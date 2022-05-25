(define-module (unnsvc packages linux)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages cpio)
  #:use-module (gnu packages linux)
  #:use-module (nongnu packages linux))

(use-srfis '(1))

(define-public (linux-managed kernel-config)
  (package
    (inherit linux)
    (name "linux-managed")
       ;; The KCFLAGS are definitely applied to all processes, but don't know about CFLAGS.
       ;; CFLAGS is passed to the initial make process, but not to the child builders, according
       ;; to htop. KCFLAGS on the other hand, is applied to child builders of make.
       ;;
       ;; Disable optimization to see if it still segfaults
       ;;((#:make-flags flags ''())
       ;;  `(cons* "CFLAGS=-march=native -mtune=native -O2" "KCFLAGS=-march=native -mtune=native -O2" ,flags))
       ;;)
    (native-inputs
     `(("kconfig" ,kernel-config)
       ("cpio" ,cpio) ;; This is required to build ikheaders
       ,@(alist-delete "kconfig"
                       (package-native-inputs linux))))))
