
(define-module (unnsvc packages cargo)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages crates-io)
  #:use-module (srfi srfi-1))

(define-public rust-cargo
  (package
    (inherit rust-cargo-0.53)
    (name "rust-cargo")
    (version "0.61.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cargo" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "008mfnv06rydya44wfl8gfmmmx1kjqga8b1pkzr4b4rqyc34dg8c"))))
        (arguments
     `(;; The test suite is disabled as the internal 'cargo-test-macro' and
       ;; 'cargo-test-support' crates are not included in the release.
       #:tests? #f
       #:cargo-inputs
       (("rust-anyhow" ,rust-anyhow-1)
        ("rust-atty" ,rust-atty-0.2)
        ("rust-bytesize" ,rust-bytesize-1)
        ("rust-cargo-platform" ,(derive-package rust-cargo-platform-0.1
                                                "0.1.2"
                                                "09zsf76b9yr02jh17xq925xp1w824w2bwvb78fd0gpx5m1fq5nyb"))
        ("rust-cargo-util" ,rust-cargo-util-0.1)
        ("rust-clap" ,(derive-package rust-clap-3
                                      "3.1.0"
                                      "0rrlmb7jwsxh67bsdifsaqwl5wkyfc0xp775v770ac0q3ylgxwg5"))
        ("rust-core-foundation" ,rust-core-foundation-0.9)
        ("rust-crates-io" ,(derive-package rust-crates-io-0.33
                                           "0.34.0"
                                           "139jnq0bp507sj5na86iw0qbqfahwm5v7ajy344fgcikj52qfjkb"))
        ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.8)
        ("rust-crypto-hash" ,rust-crypto-hash-0.3)
        ("rust-curl" ,(derive-package rust-curl-0.4
                                      "0.4.41"
                                      "1qqbrvgbnzik4vlni25jwsk3ff57snmbp0zvdzdzhq9jaqrx5ihv"))
        ("rust-curl-sys" ,(derive-package rust-curl-sys-0.4
                                           "0.4.51+curl-7.80.0"
                                           "085gwlfq15fxp0zvx14sf3k91ka8z8i30271i44gwd3ad9z9hc6i"))
        ("rust-env-logger" ,rust-env-logger-0.9)
        ("rust-filetime" ,rust-filetime-0.2)
        ("rust-flate2" ,rust-flate2-1)
        ("rust-flate2" ,rust-flate2-1)
        ("rust-fwdansi" ,rust-fwdansi-1)
        ("rust-git2" ,rust-git2-0.13)
        ("rust-git2-curl" ,rust-git2-curl-0.14)
        ("rust-glob" ,rust-glob-0.3)
        ("rust-hex" ,rust-hex-0.4)
        ("rust-home" ,rust-home-0.5)
        ("rust-humantime" ,rust-humantime-2)
        ("rust-ignore" ,rust-ignore-0.4)
        ("rust-im-rc" ,rust-im-rc-15)
        ("rust-jobserver" ,(derive-package rust-jobserver-0.1
                                           "0.1.24"
                                           "1yn1vxbbqv7dqir6qbfcj8h8ddjf89m5mhvm36h13xx7k5raf9dg"))
        ("rust-kstring" ,(derive-package rust-kstring-1
                                         "1.0.6" ;; latest 1.1.0 is a bad build at crates.io
                                         "09j5xb3rnjd3kmc2v667wzsc4mz4c1hl1vkzszbj30fyxb60qccb"))
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-lazycell" ,rust-lazycell-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-libgit2-sys" ,rust-libgit2-sys-0.12)
        ("rust-log" ,rust-log-0.4)
        ("rust-memchr" ,rust-memchr-2)
        ("rust-miow" ,rust-miow-0.3)
        ("rust-num-cpus" ,rust-num-cpus-1)
        ("rust-opener" ,(derive-package rust-opener-0.4
                                        "0.5.0"
                                        "0lkrn4fv1h4m8gmp7ll6x7vjvb6kls2ngwa5cgsh2ix5fb6yp8sf"))
        ("rust-openssl" ,rust-openssl-0.10)
        ("rust-osinfo" ,(derive-package rust-os-info-3
                                        "3.0.7"
                                        "09x2sm4pgcpk14hakj4iq0zkglx1bwxlq3a5mbwc737dpwh11jba"))
        ("rust-percent-encoding" ,rust-percent-encoding-2)
        ("rust-pretty-env-logger" ,rust-pretty-env-logger-0.4)
        ("rust-rand" ,rust-rand-0.8)
        ("rust-rustc-workspace-hack" ,rust-rustc-workspace-hack-1)
        ("rust-rustfix" ,(derive-package rust-rustfix-0.5
                                         "0.6.0"
                                         "0apkjxv3z70vhnyz2kpwsivvndk6qk7kkp0rf7sg8pk7q1gy02vg"))
        ("rust-same-file" ,rust-same-file-1)
        ("rust-semver" ,rust-semver-0.10)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-ignored" ,rust-serde-ignored-0.1)
        ("rust-serde-json" ,rust-serde-json-1)
        ("rust-shell-escape" ,rust-shell-escape-0.1)
        ("rust-socket2" ,rust-socket2-0.4)
        ("rust-strip-ansi-escapes" ,rust-strip-ansi-escapes-0.1)
        ("rust-tar" ,(derive-package rust-tar-0.4
                                     "0.4.36"
                                     "0iz40bd47xr69dsbckd6rv5ry2nqb2dp3z850q41pvpnmk6xk441"))
        ("rust-tempfile" ,rust-tempfile-3)
        ("rust-termcolor" ,rust-termcolor-1)
        ("rust-textwrap" ,(derive-package rust-textwrap-0.12
                                          "0.14.0"
                                          "1hph6h82099mai9nnjfcim9rmhmvzgj8m1j8rjq2913baijm77zm"))
        ("rust-toml" ,rust-toml-0.5)
        ("rust-toml-edit" ,(derive-package rust-toml-edit-0.3
                                           "0.13.4"
                                           "0nzmc02sfkkxsg59gjqsg0irwn5mj5lp2cz0gjj0ld2jngarwkkl"))
        ("rust-os-str-bytes" ,rust-os-str-bytes-6)
        ("rust-unicode-width" ,rust-unicode-width-0.1)
        ("rust-unicode-xid" ,rust-unicode-xid-0.2)
        ("rust-url" ,rust-url-2)
        ("rust-walkdir" ,rust-walkdir-2)
        ("rust-winapi" ,rust-winapi-0.3))))))

(define (crate-origin name version hash)
  ;; First 5 characters being "rust-" from guix naming convention
  (let ((crate-name (substring name (string-length "rust-"))))
    (origin
      (method url-fetch)
      (uri (crate-uri crate-name version))
      (file-name
       (string-append crate-name "-" version ".tar.gz"))
      (sha256
       (base32 hash)))))


(define-public (derive-package crate-package crate-version crate-hash)
  (display (format #t "Deriving crate: ~a ~a ~a\n"
                   (package-name crate-package)
                   crate-version
                   crate-hash))
  (package
    (inherit crate-package)
    (name (package-name crate-package))
    (version crate-version)
    (source (crate-origin (package-name crate-package) crate-version crate-hash))))

(define-public rust-cargo-util-0.1
  (package
    (name "rust-cargo-util")
    (version "0.1.2")
    (source (crate-origin name version "1sz0gzcyp9ycb4zwj69qs9gd8kn9hv9nh2dq42c59x5xccqph755"))
    (build-system cargo-build-system)
    (home-page "https://github.com/rust-lang/cargo")
    (synopsis "Utils for Cargo")
    (description "Miscellaneous support code used by Cargo.")
    (license (list license:expat license:asl2.0))))

rust-cargo
