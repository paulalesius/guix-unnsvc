(define-module (unnsvc packages containers)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages containers)
  #:use-module (guix packages))

(define-public sbctl
  (package
    (name "sbctl")
    (version "0.11")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Foxboron/sbctl")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "190rwq6hrjhib46jjaak5fpv5pqd0b51b5gwbpsj697mqmply2lh"))))
    (build-system go-build-system)
    (arguments
     (list #:install-source? #f))
    (synopsis "Secure Boot key manager")
    (description
     "@code{sbctl} intends to be a user-friendly secure boot key manager
capable of setting up secure boot, offer key management capabilities, and
keep track of files that needs to be signed in the boot chain.")
    (license license:public-domain)
    (home-page "https://github.com/Foxboron/sbctl")))

(define-public htop-sensors-custom
  (package/inherit htop
    (version "3.2.2")
        (arguments
     (list #:tests? #f
           #:phases #~(modify-phases %standard-phases
                        (add-after 'install 'wrap-executable
                          (lambda* (#:key inputs outputs #:allow-other-keys)
                            (let ((out (assoc-ref outputs "out"))
                                  (lm-sensors (assoc-ref inputs "lm-sensors")))
                              (wrap-program (string-append out "/bin/htop")
                                `("LD_LIBRARY_PATH" ":" = (,(string-append lm-sensors "/lib"))))))))))
    ;; Add lm-sensors for temperature reading in htop
    (inputs (list
             ncurses
             `(,lm-sensors "lib")))))
