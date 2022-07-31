(define-module (unnsvc packages rust-apps)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-graphics)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages ibus)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages image)
  #:use-module (gnu packages jemalloc)
  #:use-module (gnu packages kde)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages rust)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages webkit)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages rust-apps))

(define-public rust-unicode-ident-1
  (package
    (name "rust-unicode-ident")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-ident" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
                "19zf5lzhzix2s35lp5lckdy90sw0kfi5a0ii49d24dcj7yk1pihm"))))
    (build-system cargo-build-system)
    (home-page "")
    (synopsis "")
    (description "")
    (license (list license:expat license:asl2.0))))

(define-public rust-textwrap-0.15
  (package
    (inherit rust-textwrap-0.12)
    (name "rust-textwrap")
    (version "0.15.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "textwrap" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1yw513k61lfiwgqrfvsjw1a5wpvm0azhpjr2kr0jhnq9c56is55i"))))))

(define-public rust-proc-macro2-1.0.42
  (package
    (inherit rust-proc-macro2-1)
    (name "rust-proc-macro2")
    (version "1.0.42")
     (source
      (origin
        (method url-fetch)
        (uri (crate-uri "proc-macro2" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "16y8maaixxaij77xk1krws51f4lpwz9y6vg9w3b35kyqy5jyjy62"))))))

(define-public rust-clap-derive-3.2
  (package
    (inherit rust-clap-derive-3)
    (name "rust-clap-derive")
    (version "3.2.15")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap_derive" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1d2c4vs345fwihkd8cc7m6acbiydcwramkd5mnp36p0a7g6jm9cv"))))))

(define-public rust-clap-3.2
  (package
    (inherit rust-clap-3)
    (name "rust-clap")
    (version "3.2.16")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1af06z8z7m3327yz1xvzxfjanclgpvvy3lssb745rig7adkbpnx3"))))
      (arguments
     `(#:cargo-inputs
       (("rust-atty" ,rust-atty-0.2)
        ("rust-bitflags" ,rust-bitflags-1)
        ("rust-clap-derive" ,rust-clap-derive-3.2)
        ("rust-indexmap" ,rust-indexmap-1)
        ("rust-os-str-bytes" ,rust-os-str-bytes-2)
        ("rust-strsim" ,rust-strsim-0.10)
        ("rust-clap-lex" ,rust-clap-lex)
        ("rust-termcolor" ,rust-termcolor-1)
        ("rust-terminal-size" ,rust-terminal-size-0.1)
        ("rust-proc-macro2" ,rust-proc-macro2-1.0.42)
        ("rust-textwrap" ,rust-textwrap-0.15)
        ("rust-vec-map" ,rust-vec-map-0.8)
        ("rust-yaml-rust" ,rust-yaml-rust-0.4))
       #:cargo-development-inputs
       (("rust-criterion" ,rust-criterion-0.3)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-regex" ,rust-regex-1)
        ("rust-version-sync" ,rust-version-sync-0.8))))))

;; Override rust-syn-1
(define-public rust-syn-1.0.98
  (package
    (inherit rust-syn-1)
    (name "rust-syn")
    (version "1.0.98")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "syn" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
                "1pbklw6fnwwgrkj8qz3wcjfggmn7vmyln44gg0yc5r2dj25fy2n5"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1.0.42)
        ("rust-quote" ,rust-quote-1)
        ("rust-unicode-xid" ,rust-unicode-xid-0.2)
        ("rust-unicode-ident" ,rust-unicode-ident-1))))))

(define-public rust-clap-lex
  (package
    (name "rust-clap-lex")
    (version "0.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap_lex" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
                "1ib1a9v55ybnaws11l63az0jgz5xiy24jkdgsmyl7grcm3sz4l18"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-os-str-bytes" ,rust-os-str-bytes-6))))
    (home-page "https://github.com/dtolnay/syn")
    (synopsis "")
    (description "")
    (license (list license:expat license:asl2.0))))

(define-public rust-cbindgen-0.24
  (package
    (inherit rust-cbindgen-0.19)
    (name "rust-cbindgen")
    (version "0.24.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cbindgen" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1yqxqsz2d0cppd8zwihk2139g5gy38wqgl9snj6rnk8gyvnqsdd6"))))
     (arguments
     `(#:cargo-inputs
       (("rust-clap" ,rust-clap-3.2)
        ("rust-heck" ,rust-heck-0.4)
        ("rust-indexmap" ,rust-indexmap-1)
        ("rust-log" ,rust-log-0.4)
        ("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-json" ,rust-serde-json-1)
        ("rust-syn" ,rust-syn-1.0.98)
        ("rust-tempfile" ,rust-tempfile-3)
        ("rust-toml" ,rust-toml-0.5))
       #:cargo-development-inputs
       (("rust-serial-test" ,rust-serial-test-0.5))))))

