(define-module (unnsvc packages emacs)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system emacs)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages suckless)
  ;;#:use-module (flat packages emacs)
  )

(define-public emacs-exwm-managed
  (package
    (inherit emacs-exwm)
    (name "emacs-exwm-managed")
    (propagated-inputs
     (list emacs-xelb           ;; ??
           emacs                ;; emacs we'll use
           emacs-guix
           ;;slock                ;; screen lock
           xss-lock
           xset                 ;; DPMS
           xclip                ;; EXWM clipboard
           ))
    (inputs
     (list xhost dbus))
    (arguments
     ;; Use (substitute-keyword-arguments (package-arguments emacs)) to replace selectively
     ;; EXWM does not work with emacs-pgtk-native-comp, use emacs-native-comp
     `(#:emacs ,emacs
       #:phases
       (modify-phases %standard-phases
         (add-after 'build 'install-xsession
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (xsessions (string-append out "/share/xsessions"))
                    (bin (string-append out "/bin"))
                    (exwm-executable (string-append bin "/exwm-managed")))
               ;; Add a .desktop file to xsessions
               (mkdir-p xsessions)
               (mkdir-p bin)
               (make-desktop-entry-file
                (string-append xsessions "/exwm-managed.desktop")
                #:name ,name
                #:exec exwm-executable
                #:try-exec exwm-executable)
               ;; Add a shell wrapper to bin
               (with-output-to-file exwm-executable
                 (lambda _
                   (format #t
                    "#!~a ~@
~a +SI:localuser:$USER ~@
~a s 180 120
~a -- /run/setuid-programs/slock &
exec ~a --exit-with-session ~a --no-site-file -fs \"$@\" --eval '~s' ~%"
                           (search-input-file inputs "/bin/sh")
                           (search-input-file inputs "/bin/xhost")
                           (search-input-file inputs "/bin/xset")
                           (search-input-file inputs "/bin/xss-lock")
                           (search-input-file inputs "/bin/dbus-launch")
                           (search-input-file inputs "/bin/emacs")
                           '(cond
                             ((file-exists-p "~/.exwm")
                              (load-file "~/.exwm"))
                             ((not (featurep 'exwm))
                              (require 'exwm)
                              (require 'exwm-config)
                              (exwm-config-default)
                              (message (concat "exwm configuration not found. "
                                               "Falling back to default configuration...")))))))
               (chmod exwm-executable #o555)
               #t))))))
    (home-page "http://custom")
    (synopsis "Derivative")))

