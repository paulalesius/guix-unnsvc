(define-module (unnsvc services repl)
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
  #:use-module (gnu services)
  #:use-module (gnu services base)
  #:use-module (gnu services admin)
  #:use-module (gnu services shepherd)
  #:use-module (gnu services getmail)
  #:use-module (gnu system shadow)
  #:export (guix-repl-service-type
            guix-repl-configuration))

(define-record-type* <guix-repl-configuration>
  guix-repl-configuration make-guix-repl-configuration
  guix-repl-configuration?
  (package      guix-repl-configuration-package
                (default guix))
  (port       	guix-repl-configuration-port
                (default "37146"))
  (user         guix-repl-configuration-user
                (default "guix-repl"))
  (group        guix-repl-configuration-group
                (default "guix-repl")))

(define (guix-repl-service config)
  "Start a guix repl on boot that listens for connections on either tcp/ip or unix sockets from CONFIG. The
purpose of this service is to allow emacs-guix/geiser and others to connect on startup."
  (match-record config <guix-repl-configuration>
    (package port user group)
    (list
     (shepherd-service
      (provision '(guix-repl))
      (documentation "Start a Guix REPL service on boot so that for example emacs-guix/geiser can connect automatically on startup.")
      (requirement '(networking guix-daemon))
      ;; This should be upgraded to make-systemd-constructor, but for some reason, when creating the AF_UNIX socket,
      ;; it refuses to adhere to the provided uid and gid information and the socket is always root. Once that is fixed
      ;; switch to the proper make-systemd-constructor for socket activation.
      (start #~(make-forkexec-constructor
                 (list
                  #$(file-append package "/bin/guix")
                  "repl"
                  #$(string-append "--listen=tcp:" port))
                #:user #$user
                #:group #$group
                #:log-file "/var/log/guix-repl.log"))
      (stop #~(make-kill-destructor))
      (respawn? #t)))))

;; @todo define a user instead to run the process inferior

;;(define (guix-repl-activation config)
;;  "The activation code for CONFIG will check whether a unix domain socket is specified as the listen
;;argument, if it is then create the socket directory if it doesn't exist, and set permissions to the
;;user and group specified in the config."
;;  (let ((user (guix-repl-configuration-user config))
;;        (group (guix-repl-configuration-group config))
;;        (listen (guix-repl-configuration-listen config))
;;	)
;;    (when (string-prefix? "unix:" listen)
;;      (let* ((socketpath (list-ref (string-split listen #\:) 1))
;;             (socketdir (dirname socketpath)))
;;        #~(begin
;;            (use-modules (guix build utils))
;;
;;            (let* ((uid (passwd:uid (getpw #$user)))
;;                   (gid (group:gid (getgr #$group))))
;;              (mkdir-p #$socketdir)
;;              (chown #$socketdir uid gid)))))))

(define %guix-repl-accounts
  (list (user-group (name "guix-repl") (system? #t))
        (user-account
         (name "guix-repl")
         (group "guix-repl")
         (system? #t)
         (comment "Guix REPL user.")
         (home-directory "/var/empty")
         (shell (file-append shadow "/sbin/nologin")))))

(define guix-repl-service-type
  (service-type
   (name 'guix-repl)
   (extensions
    (list
     (service-extension shepherd-root-service-type
                        guix-repl-service)
     ;;(service-extension activation-service-type
     ;;                   guix-repl-activation))
     (service-extension account-service-type
                        (const %guix-repl-accounts))))
   (default-value (guix-repl-configuration))))
