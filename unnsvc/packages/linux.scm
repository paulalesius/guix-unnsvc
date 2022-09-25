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

(define (linux-urls version)
  "Return a list of URLS for Linux VERSION."
  (list (string-append "https://www.kernel.org/pub/linux/kernel/v"
                       (version-major version) ".x/linux-" version ".tar.xz")))

(define* (corrupt-linux freedo version hash #:key (name "linux"))
  (package
    (inherit freedo)
    (name name)
    (version version)
    (source (origin
              (method url-fetch)
              (uri (linux-urls version))
              (sha256 (base32 hash))))
    (home-page "https://www.kernel.org/")
    (synopsis "Linux kernel with nonfree binary blobs included")
    (description
     "The unmodified Linux kernel, including nonfree blobs, for running Guix
System on hardware which requires nonfree software to function.")))

(define-public (linux-optimal kcflags kernel-config)
  (package
    (inherit linux)
    (name "linux-optimal")
    ;; The KCFLAGS are definitely applied to all processes, but don't know about CFLAGS.
    ;; CFLAGS is passed to the initial make process, but not to the child builders, according
    ;; to htop. KCFLAGS on the other hand, is applied to child builders of make.
    ;; gcc -### -E - -march=native 2>&1 | sed -r '/cc1/!d;s/(")|(^.* - )//g'
    ;; gcc -### -E - -march=native 2>&1 | sed -r '/cc1/!d;s/(")|(^.* - )|( -mno-[^\ ]+)//g'
    (arguments
     (substitute-keyword-arguments (package-arguments linux)
       ((#:make-flags flags ''())
        `(cons*
          (format #f "KCFLAGS=\"~S\"" ,kcflags)
          (format #f "CFLAGS=\"~S\"" ,kcflags)
          ,flags))))
    (native-inputs
     `(("kconfig" ,kernel-config)
       ("cpio" ,cpio) ;; This is required to build ikheaders
       ,@(alist-delete "kconfig"
                       (package-native-inputs linux))))))
