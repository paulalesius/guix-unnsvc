(define-module (unnsvc packages containers)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages containers)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system go))

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
