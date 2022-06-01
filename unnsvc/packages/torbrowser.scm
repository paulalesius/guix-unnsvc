(define-module (unnsvc packages torbrowser)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build copy-build-system)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages xorg))

(define-public torbrowser
  (package
    (name "torbrowser")
    (version "11.0.13")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.torproject.org/dist/torbrowser/" version "/tor-browser-linux64-" version "_en-US.tar.xz"))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "03pzwzgikc43pm0lga61jdzg46fanmvd1wsnb2xkq0y1ny8gsqfz"))))
    (inputs
     (list coreutils
           bash
           grep
           sed
           gcc-toolchain
           patchelf
           gtk+
           dbus-glib
           libxt
           libevent
           openssl
           glibc))
    (build-system copy-build-system)
    ;; Do like: grep -r -C10 "copy-build-system" .
    (arguments
     `(#:modules ((srfi srfi-1)
                  (guix build copy-build-system)
                  (guix build utils))
      #:phases
       #~(modify-phases %standard-phases
         (add-after 'patch-shebangs 'patch-elf
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (invoke "patchelf" "--set-interpreter"
                     #$(string-append glibc "/lib/ld-linux-x86_64.so.2")
                     "firefox.real"))))))
    ;; (arguments
    ;;  ;; Use (substitute-keyword-arguments (package-arguments emacs)) to replace selectively
    ;;  ;; EXWM does not work with emacs-pgtk-native-comp, use emacs-native-comp
    ;;  `(#:emacs ,emacs
    ;;    #:phases
    ;;    (modify-phases %standard-phases
    ;;      (add-after 'build 'install-xsession
    ;;        (lambda* (#:key inputs outputs #:allow-other-keys)
    ;;          (let* ((out (assoc-ref outputs "out"))
    ;;                 (xsessions (string-append out "/share/xsessions"))
    ;;                 (bin (string-append out "/bin"))
    ;;                 (exwm-executable (string-append bin "/exwm-managed")))
    ;;            ;; Add a .desktop file to xsessions
    ;;            (mkdir-p xsessions)
    ;;            (mkdir-p bin)
    ;;            (make-desktop-entry-file
    ;;             (string-append xsessions "/exwm-managed.desktop")
    ;;             #:name ,name
    ;;             #:exec exwm-executable
    ;;             #:try-exec exwm-executable)
    ;;            ;; Add a shell wrapper to bin
    ;;            (with-output-to-file exwm-executable
    ;;              (lambda _
    ;;                (format #t "#!~a ~@
    ;;                  ~a +SI:localuser:$USER ~@
    ;;                  exec ~a --exit-with-session ~a --no-site-file -fs \"$@\" --eval '~s' ~%"
    ;;                        (search-input-file inputs "/bin/sh")
    ;;                        (search-input-file inputs "/bin/xhost")
    ;;                        (search-input-file inputs "/bin/dbus-launch")
    ;;                        (search-input-file inputs "/bin/emacs")
    ;;                        '(cond
    ;;                          ((file-exists-p "~/.exwm")
    ;;                           (load-file "~/.exwm"))
    ;;                          ((not (featurep 'exwm))
    ;;                           (require 'exwm)
    ;;                           (require 'exwm-config)
    ;;                           (exwm-config-default)
    ;;                           (message (concat "exwm configuration not found. "
    ;;                                            "Falling back to default configuration...")))))))
    ;;            (chmod exwm-executable #o555)
    ;;            #t))))))
    (home-page "http://custom")
    (description "description")
    (synopsis "synopsis")
    (license license:gpl3+)))

torbrowser
