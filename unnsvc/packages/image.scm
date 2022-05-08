
(define-module (unnsvc packages image)
  #:use-module (ice-9 regex)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages image))

(define-public flameshot-managed
  (package
   (inherit flameshot)
   (name "flameshot-managed")
   (version "11.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/flameshot-org/flameshot")
             (commit (string-append "v" version))))
       (file-name (git-file-name (package-name flameshot) version))
       (sha256
        (base32
         "0qw1fq8mrk525wpr07id81i9q0r95hk66c17s8jxi1fldmfw8naa"))))))
