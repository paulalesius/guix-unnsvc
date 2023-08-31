(define-module (unnsvc packages containers)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages containers)
  #:use-module (gnu packages selinux)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages glib)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system go))

(define-public slirp4netns-custom
  (package/inherit slirp4netns
    (name "slirp4netns")
    (version "1.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/rootless-containers/slirp4netns")
             (commit (string-append "v" version))))
       (sha256
        (base32 "0ryc4p1589lpfcw5x4irad933m8fly1siqzrxk3y552alisrdma8"))
       (file-name (git-file-name name version))))))

(define-public crun-custom
  (package/inherit crun
    (name "crun")
    (version "1.8.7")
    (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/containers/crun")
               (commit version)
               (recursive? #t)))
         (sha256
          (base32 "1wsk56vqgizfvaxmmrkgk0n426kyx1ynq3481kjqr8bd15nf8hgq"))
         (file-name (git-file-name name version))))))

(define-public conmon-custom
  (package/inherit conmon
    (name "conmon")
    (version "2.1.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/containers/conmon")
             (commit (string-append "v" version))))
       (sha256
        (base32 "0kgbbzizk07hm2ig8xhh355a3601ivgcgzcj1nyyzqmh9w0hvlw1"))
       (file-name (git-file-name name version))))
    (inputs
     (list crun-custom
           glib
           libseccomp))))

(define-public cni-plugins-custom
  (package/inherit cni-plugins
    (name "cni-plugins")
    (version "1.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/containernetworking/plugins")
             (commit (string-append "v" version))))
       (sha256
        (base32 "1s7vwbnhh8h2drsi82vs50xh47ab2akh1398ikyxxjdp0bvqdfbi"))
       (file-name (git-file-name name version))))))

(define-public podman-custom
  (package/inherit podman
    (name "podman")
    (version "4.6.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/containers/podman")
             (commit (string-append "v" version))))
       (modules '((guix build utils)))
       ;; FIXME: Btrfs libraries not detected by these scripts.
       (snippet '(substitute* "Makefile"
                   ((".*hack/btrfs.*") "")))
       (sha256
        (base32 "1a0p3g643b4hskcnsvjxlgbj2ixg7i5nnwb8yv6hpfkjwkndn737"))
       (file-name (git-file-name name version))))
    (inputs
     (list btrfs-progs
           cni-plugins-custom
           conmon-custom
           crun-custom
           gpgme
           go-github-com-go-md2man
           iptables
           libassuan
           libseccomp
           ;;libselinux
           slirp4netns-custom))))
