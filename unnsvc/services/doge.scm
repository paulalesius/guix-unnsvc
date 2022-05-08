(define-module (unnsvc services doge)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match)
  #:use-module (guix gexp)
  #:use-module (guix records)
  #:use-module (guix packages)
  #:use-module ((gnu packages base)
                #:select (glibc-utf8-locales))
  #:use-module (gnu packages admin)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages web)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages guile-xyz)
  #:use-module (gnu packages package-management)
  #:use-module (unnsvc packages doge)
  #:use-module (gnu services)
  #:use-module (gnu services base)
  #:use-module (gnu services admin)
  #:use-module (gnu services shepherd)
  #:use-module (gnu services getmail)
  #:use-module (gnu system shadow)
  #:export (dogecoind-service-type
            dogecoind-configuration))

(define-record-type* <dogecoind-configuration>
  dogecoind-configuration make-dogecoind-configuration
  dogecoind-configuration?
  (package                      dogecoind-configuration-package
                                (default dogecoin-core))
  (user                         dogecoind-configuration-user
                                (default "dogecoin"))
  (group                        dogecoind-configuration-group
                                (default "dogecoin"))
  (datadir                      dogecoind-configuration-datadir
                                (default "/var/lib/dogecoind"))
  (pid                          dogecoind-configuration-pid
                                (default "/run/dogecoind/dogecoind.pid"))
  (conf                         dogecoind-configuration-conf
                                (default "/etc/dogecoind.conf"))
  (extra-content                dogecoind-configuration-extra-content
                                (default #f)))

(define (dogecoind-service config)
  "Basically CONFIG."
  (match-record config <dogecoind-configuration>
    (package user group conf datadir conf pid extra-content)
    (list
     (shepherd-service
      (provision '(dogecoind))
      (documentation "Start dogecoin-core daemon.")
      (requirement '(networking))
      ;; Disable autostart since we may not always want to run it on boot, especially on
      ;; laptops and mobile connections.
      (auto-start? #f)
      (start #~(make-forkexec-constructor
                `(#$(file-append package "/bin/dogecoind")
                  ,(when #$extra-content
                       (string-append "-conf=" #$conf))
                  "-daemon"
                  #$(string-append "-datadir=" datadir)
                  #$(string-append "-pid=" pid))
                #:user #$user
                #:group #$group
                #:pid-file #$pid
                #:log-file "/var/log/dogecoind.log"
                #:directory #$datadir))
      (stop #~(make-kill-destructor))))))

 (define (dogecoind-activation config)
   "Return the activation GEXP for CONFIG."
   (let ((user (dogecoind-configuration-user config))
         (group (dogecoind-configuration-group config))
         (datadir (dogecoind-configuration-datadir config))
         (piddir (dirname (dogecoind-configuration-pid config)))
         (conf (dogecoind-configuration-conf config))
         (extra-content (dogecoind-configuration-extra-content config)))
     #~(begin
         (use-modules (guix build utils))

         (let* ((uid (passwd:uid (getpw #$user)))
                (gid (group:gid (getgr #$group)))
                (datadir-stat (stat #$datadir #f))
                (piddir-stat (stat #$piddir #f))
                (confdir-stat (stat (dirname #$conf) #f)))

           ;; Data dir
           (when (not datadir-stat)
             (mkdir-p #$datadir)
             (chown #$datadir uid gid)
             (chmod #$datadir #o700))

           ;; Pid dir
           (when (not piddir-stat)
             (mkdir-p #$piddir)
             (chown #$piddir uid gid))

           ;; Configuration file specified
           (when #$extra-content
             (when (not confdir-stat)
               (let ((confdir (dirname #$conf)))
                 (mkdir-p confdir)
                 (chown confdir uid gid)
                 (chmod confdir #o600)))
             (call-with-output-file #$conf
               (lambda (port)
                 (format port "~a\n" #$extra-content))))))))

(define %dogecoind-accounts
  (list (user-group (name "dogecoin") (system? #t))
        (user-account
         (name "dogecoin")
         (group "dogecoin")
         (system? #t)
         (comment "Dogecoin user")
         (home-directory "/var/empty")
         (shell (file-append shadow "/sbin/nologin")))))

(define dogecoind-service-type
  (service-type
   (name 'dogecoind)
   (extensions
    (list
     (service-extension shepherd-root-service-type
                        dogecoind-service)
     (service-extension activation-service-type
                        dogecoind-activation)
     (service-extension account-service-type
                        (const %dogecoind-accounts))))
   (default-value (dogecoind-configuration))))
