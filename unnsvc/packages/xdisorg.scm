(define-module (unnsvc packages xdisorg)
  #:use-module (guix build-system meson)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix git-download))

(define-public wl-clipboard-custom
  (package/inherit wl-clipboard
    (name "wl-clipboard")
    (version "2.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bugaevc/wl-clipboard")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "09l6dv3qsqscbr98vxi4wg4rkx0wlhnsc40n21mx3ds6balmg105")))))) 
