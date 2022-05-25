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

(define kernel-version
  "5.17.11")

;; To download and print the has:
;; guix download <url to .tar.xz form kernel.org
(define kernel-hash
  "0c8vz02lbfm0zkgsr1gvdp8bzxz255dk863pnakw6d77z9bfc22p")

;; This method is overridden from gnu/packages/linux to change the URL
(define
  (linux-urls version)
  "Return a list of URLS for Linux VERSION."
  (list
   (string-append "https://www.kernel.org/pub/linux/kernel/v"
                  (version-major version)
                  ".x/linux-" version ".tar.xz")))

;; Override to the latest minor version and source hash (guix hash)
(define-public linux-5.17
  (corrupt-linux linux-libre-5.17 kernel-version kernel-hash))

;; Overrides framework version that defaults to linux-5.15
(define-public linux linux-5.17)

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

(define-public linux-firmware-managed
  (package
    (inherit linux-firmware)
    (name "linux-firmware")
    (version "20220509")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://git.kernel.org/pub/scm/linux/kernel"
                                  "/git/firmware/linux-firmware.git/snapshot/"
                                  "linux-firmware-" version ".tar.gz"))
              (sha256
               (base32 "0bw76zxrqgxbh8b3nhaw2wx409sppjfjmdfsjr36mkzanchycfj1"))))))

(define-public sof-firmware-managed
  (package
    (inherit sof-firmware)
    (name "sof-firmware-managed")
    (version "2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/thesofproject/sof-bin")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1qdmihvk6rh4pc41vsl7hwl9v6316x60g1wb2pl5g5xz6xq4sg54"))))
    (arguments
     `(#:install-plan
       (list (list (string-append "v" ,version ".x/sof-v" ,version) "lib/firmware/intel/sof")
             (list (string-append "v" ,version ".x/sof-tplg-v" ,version) "lib/firmware/intel/sof-tplg"))))))


linux-firmware-managed
