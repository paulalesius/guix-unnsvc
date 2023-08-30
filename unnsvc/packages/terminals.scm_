(define-module (unnsvc packages terminals)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cargo)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (guix build-system emacs)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages suckless)
  #:use-module (gnu packages terminals)
  #:use-module (srfi srfi-26))

(define-public foot-custom
  (package/inherit foot
    (name "foot")
    (version "1.15.3")
    (home-page "https://codeberg.org/dnkl/foot")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url home-page) (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1a224i2i7qk170kf2rzyxqcv3lnx9f548lwa37jgjr7i339x4zwf"))))))
