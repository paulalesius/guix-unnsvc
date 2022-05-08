(define-module (unnsvc packages greetd)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system qt)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system cargo)
  #:use-module (gnu packages linux)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xfce)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages man))

(define-public rust-enquote-1.1
  (package
    (name "rust-enquote")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "enquote" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32"0clrjghlfkkb7sndabs5wch0fz2nif6nj4b117s8kqxx3nqnrhq6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/reujab/enquote")
    (synopsis "A Rust library for quotes, unquotes, and unescapes strings.")
    (description "A Rust library for quotes, unquotes, and unescapes strings.")
    (license license:unlicense)))

(define-public rust-nix-0.19
  (package
    (inherit rust-nix-0.23)
    (name "rust-nix")
    (version "0.19.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nix" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1wk1pmaf9pv84sc4jf19gm1as2yq3ydwcx0n5nc1bpsgzq6bmk5j"))))))

(define-public rust-pam-sys-0.5
  (package
    (name "rust-pam-sys")
    (version "0.5.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pam-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0d14501d5vybjnzxfjf96321xa5wa36x1xvf02h02zq938qmhj6d"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/1wilkens/pam-sys")
    (synopsis "Rust FFI bindings to the Linux Pluggable Authentication Modules (PAM).")
    (description "Rust FFI bindings to the Linux Pluggable Authentication Modules (PAM).")
    (license license:gpl3)))

(define-public rust-type-map-0.4
  (package
    (name "rust-type-map")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "type-map" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ilsqq7pcl3k9ggxv2x5fbxxfd6x7ljsndrhc38jmjwnbr63dlxn"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/1wilkens/pam-sys")
    (synopsis "Provides the best of both http::Extensions and actix_http::Extensions, with some code and tests drawn directly from actix-http::Extensions.")
    (description "Provides the best of both http::Extensions and actix_http::Extensions, with some code and tests drawn directly from actix-http::Extensions.")
    (license (list license:expat license:asl2.0))))

(define-public rust-crossterm-0.22
  (package
    (inherit rust-crossterm-0.20)
    (name "rust-crossterm")
    (version "0.22.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crossterm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0p1j2qfby343qf2isv7g78hrp7rkkk7qlg797jvx34a2dhq2amf8"))))))

(define-public rust-intl-pluralrules-7.0
  (package
    (name "rust-intl-pluralrules")
    (version "7.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "intl_pluralrules" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ksy3hxqs8if3nbvcin0a8390lpkzbk2br1brik70z96hj1ri3xi"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/zbraniecki/pluralrules")
    (synopsis "Unicode Plural Rules categorizer for numeric input.")
    (description "Unicode Plural Rules categorizer for numeric input.")
    (license (list license:expat license:asl2.0))))

(define-public rust-self-cell-0.10
  (package
    (name "rust-self-cell")
    (version "0.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "self_cell" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1by8h3axgpbiph5nbq80z6a41hd4cqlqc66hgnngs57y42j6by8y"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/Voultapher/self_cell")
    (synopsis "Safe-to-use proc-macro-free self-referential structs in stable Rust.")
    (description "Safe-to-use proc-macro-free self-referential structs in stable Rust.")
    (license license:asl2.0)))

(define-public rust-fluent-bundle-0.15
  (package
    (name "rust-fluent-bundle")
    (version "0.15.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fluent-bundle" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1zbzm13rfz7fay7bps7jd4j1pdnlxmdzzfymyq2iawf9vq0wchp2"))))
    (build-system cargo-build-system)
    (arguments
    `(#:cargo-inputs
      (("rust-intl-pluralrules" ,rust-intl-pluralrules-7.0)
       ("rust-rustc-hash" ,rust-rustc-hash-1)
       ("rust-self-cell" ,rust-self-cell-0.10))))
    (home-page "https://projectfluent.org/")
    (synopsis "Fluent-rs is a library for language and locale identifier negotiation")
    (description "Fluent-rs is a library for language and locale identifier negotiation.")
    (license license:asl2.0)))

(define-public rust-fluent-0.16
  (package
    (name "rust-fluent")
    (version "0.16.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fluent" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "19s7z0gw95qdsp9hhc00xcy11nwhnx93kknjmdvdnna435w97xk1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-fluent-bundle" ,rust-fluent-bundle-0.15))))
    (home-page "https://projectfluent.org/")
    (synopsis "A localization framework designed to unleash the entire expressive power of natural language translations")
    (description "A localization framework designed to unleash the entire expressive power of natural language translations.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-fluent-langneg-0.13
  (package
    (name "rust-fluent-langneg")
    (version "0.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fluent-langneg" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "152yxplc11vmxkslvmaqak9x86xnavnhdqyhrh38ym37jscd0jic"))))
    (build-system cargo-build-system)
    (home-page "https://projectfluent.org/")
    (synopsis "Fluent LangNeg is a library for language and locale identifier negotiation")
    (description "Fluent LangNeg is a library for language and locale identifier negotiation.")
    (license license:asl2.0)))

(define-public rust-fluent-syntax-0.11
  (package
    (name "rust-fluent-syntax")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fluent-syntax" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0y6ac7z7sbv51nsa6km5z8rkjj4nvqk91vlghq1ck5c3cjbyvay0"))))
    (build-system cargo-build-system)
    (home-page "https://projectfluent.org/")
    (synopsis "Parser/serializer API for the Fluent Syntax, part of the Project Fluent")
    (description "Fluent-syntax is a parser/serializer API for the Fluent Syntax, part of the Project Fluent, a localization framework designed to unleash the entire expressive power of natural language translations.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-greetd-ipc-0.8
  (package
    (name "rust-greetd-ipc")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "greetd_ipc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1dscriv3adjyaxfaax3cmqrzx6q2vwwchbh86dhll783wjc4ivw0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-async-trait" ,rust-async-trait-0.1)
        ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://git.sr.ht/~kennylevinsen/greetd/")
    (synopsis "IPC library for GreetD applications")
    (description "IPC library for GreetD applications.")
    (license license:gpl3)))

(define-public rust-find-crate-0.6
  (package
    (name "rust-find-crate")
    (version "0.6.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "find-crate" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ljpkh11gj7940xwz47xjhsvfbl93c2q0ql7l2v0w77amjx8paar"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-toml" ,rust-toml-0.5))))
    (home-page "https://github.com/taiki-e/find-crate")
    (synopsis "Find the crate name from the current Cargo.toml.")
    (description "Find the crate name from the current Cargo.toml.")
    (license license:asl2.0)))

(define-public rust-i18n-config-0.4
  (package
    (name "rust-i18n-config")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "i18n-config" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "10yr0k8vy2s60yzajn659yscb3ch0ya6ywyqrgrm3yxb8g6zyamn"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/kellpossible/cargo-i18n/tree/master/i18n-config")
    (synopsis "This library contains the configuration structs (along with their parsing functions) for the cargo-i18n tool/system.")
    (description "This library contains the configuration structs (along with their parsing functions) for the cargo-i18n tool/system.")
    (license license:expat)))

(define-public rust-lock-api-0.4.6
  (package
    (inherit rust-lock-api-0.4)
    (name "rust-lock-api")
    (version "0.4.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lock_api" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0frbbqqiwngg33xrc69xagi4rqqk62msllr7z95mlbjaxzbkv548"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/Amanieu/parking_lot")
    (synopsis "Wrappers to create fully-featured Mutex and RwLock types. Compatible with no_std.")
    (description "Wrappers to create fully-featured Mutex and RwLock types. Compatible with no_std.")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-sys-0.36
  (package
    (inherit rust-windows-sys-0.28)
    (name "rust-windows-sys")
    (version "0.36.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1lmqangv0zg1l46xiq7rfnqwsx8f8m52mqbgg2mrx7x52rd1a17a"))))))

(define-public rust-windows-aarch64-msvc-0.36
  (package
    (inherit rust-windows-aarch64-msvc-0.28)
    (name "rust-windows-aarch64-msvc")
    (version "0.36.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows-aarch64-msvc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ixaxs2c37ll2smprzh0xq5p238zn8ylzb3lk1zddqmd77yw7f4v"))))))

(define-public rust-windows-i686-gnu-0.36
  (package
    (inherit rust-windows-i686-gnu-0.28)
    (name "rust-windows-i686-gnu")
    (version "0.36.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows-i686-gnu" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1dm3svxfzamrv6kklyda9c3qylgwn5nwdps6p0kc9x6s077nq3hq"))))))

(define-public rust-windows-i686-msvc-0.36
  (package
    (inherit rust-windows-i686-msvc-0.28)
    (name "rust-windows-i686-msvc")
    (version "0.36.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows-i686-msvc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "097h2a7wig04wbmpi3rz1akdy4s8gslj5szsx8g2v0dj91qr3rz2"))))))

(define-public rust-windows-x86-64-gnu-0.36
  (package
    (inherit rust-windows-x86-64-gnu-0.28)
    (name "rust-windows-x86-64-gnu")
    (version "0.36.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_x86_64_gnu" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1qfrck3jnihymfrd01s8260d4snql8ks2p8yaabipi3nhwdigkad"))))))

(define-public rust-windows-x86-64-msvc-0.36
  (package
    (inherit rust-windows-x86-64-msvc-0.28)
    (name "rust-windows-x86-64-msvc")
    (version "0.36.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_x86_64_msvc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "103n3xijm5vr7qxr1dps202ckfnv7njjnnfqmchg8gl5ii5cl4f8"))))))

(define-public rust-parking-lot-core-0.9
  (package
    (inherit rust-parking-lot-core-0.8)
    (name "rust-parking-lot-core")
    (version "0.9.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "parking_lot_core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ab95rljb99rm51wcic16jgbajcr6lgbqkrr21w7bc2wyb5pk8h9"))))
    (arguments
     `(#:cargo-inputs
       (("rust-windows-sys" ,rust-windows-sys-0.36)
        ("rust-windows-aarch64-msvc" ,rust-windows-aarch64-msvc-0.36)
        ("rust-windows-i686-gnu" ,rust-windows-i686-gnu-0.36)
        ("rust-windows-i686-msvc" ,rust-windows-i686-msvc-0.36)
        ("rust-windows-x86-64-gnu" ,rust-windows-x86-64-gnu-0.36)
        ("rust-windows-x86-64-msvc" ,rust-windows-x86-64-msvc-0.36))))))

(define-public rust-parking-lot-0.12
  (package
    (inherit rust-parking-lot-0.11)
    (name "rust-parking-lot")
    (version "0.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "parking_lot" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0n7gp0cnfghglc370cxhawwfijvhj3wrjh8gdi8c06m6jcjfrxc7"))))
    (arguments
     `(#:cargo-inputs
       (("rust-lock-api" ,rust-lock-api-0.4.6)
        ("rust-parking-lot-core" ,rust-parking-lot-core-0.9))))))

(define-public rust-dashmap-5
  (package
    (inherit rust-dashmap-4)
    (name "rust-dashmap")
    (version "5.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dashmap" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0v6rfb82bxj6zn1p3x3273pi5vfqlji8vq8r84a4krpwlcslm0y0"))))))

(define-public rust-i18n-embed-impl-0.8
  (package
    (name "rust-i18n-embed-impl")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "i18n-embed-impl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0dk1ww6f0xi4zjyz5q7k79v57qyw7msfcrzv983fn22q0c737chd"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/kellpossible/cargo-i18n/tree/master/i18n-embed")
    (synopsis "Traits and macros to conveniently embed localization assets into your application")
    (description "Traits and macros to conveniently embed localization assets into your application binary or library in order to localize it at runtime. Works in unison with cargo-i18n.")
    (license license:expat)))

(define-public rust-intl-memoizer-0.5
  (package
    (name "rust-intl-memoizer")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "intl-memoizer" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0vx6cji8ifw77zrgipwmvy1i3v43dcm58hwjxpb1h29i98z46463"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-i18n-embed-impl" ,rust-i18n-embed-impl-0.8)
        ("rust-type-map" ,rust-type-map-0.4))))
    (home-page "https://github.com/kellpossible/cargo-i18n/tree/master/i18n-embed")
    (synopsis "intl-memoizer is a crate designed to handle lazy-initialized references to intl formatters")
    (description "intl-memoizer is a crate designed to handle lazy-initialized references to intl formatters.")
    (license (list license:expat license:asl2.0))))

(define-public rust-i18n-embed-0.13
  (package
    (name "rust-i18n-embed")
    (version "0.13.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "i18n-embed" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ly2n8y1zgj9953i5ikmvkh0nj76n9xb6sx3vz1qmpj4dvbixwp7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-i18n-embed-impl" ,rust-i18n-embed-impl-0.8)
        ("rust-intl-memoizer" ,rust-intl-memoizer-0.5)
        ("rust-locale-config" ,rust-locale-config-0.3)
        ("rust-parking-lot" ,rust-parking-lot-0.12))))
    (home-page "https://github.com/kellpossible/cargo-i18n/tree/master/i18n-embed")
    (synopsis "Traits and macros to conveniently embed localization assets into your application")
    (description "Traits and macros to conveniently embed localization assets into your application binary or library in order to localize it at runtime. Works in unison with cargo-i18n.")
    (license license:expat)))

(define-public rust-i18n-embed-fl-0.6
  (package
    (name "rust-i18n-embed-fl")
    (version "0.6.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "i18n-embed-fl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "13p9miglh1ds0wbnhg5sz6phvsh8aki9i8s0g1rapl7rirqsj84l"))))
     (build-system cargo-build-system)
     (arguments
      `(#:cargo-inputs
        (("rust-dashmap" ,rust-dashmap-5)
         ("rust-find-crate" ,rust-find-crate-0.6)
         ("rust-i18n-config" ,rust-i18n-config-0.4)
         ("rust-proc-macro-error" ,rust-proc-macro-error-1)
         ("rust-strsim" ,rust-strsim-0.10))))
     (home-page "https://github.com/kellpossible/cargo-i18n/tree/master/i18n-embed-fl")
     (synopsis "This crate provides a macro to perform compile time checks when using the i18n-embed crate and the fluent localization system")
     (description "This crate provides a macro to perform compile time checks when using the i18n-embed crate and the fluent localization system.")
     (license license:expat)))

(define-public rust-rust-embed-impl-6.2
  (package
    (name "rust-rust-embed-impl")
    (version "6.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rust-embed-impl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0c6xgqdckydg3nx8c6zxz8cs157pczwq7s3bpir0rgx29gi67rwl"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/kellpossible/cargo-i18n/tree/master/i18n-embed")
    (synopsis "Rust Custom Derive Macro which loads files into the rust binary at compile time during release and loads the file from the fs during dev.")
    (description "Rust Custom Derive Macro which loads files into the rust binary at compile time during release and loads the file from the fs during dev.")
    (license license:expat)))

(define-public rust-rust-embed-utils-7
  (package
    (inherit rust-rust-embed-utils-5)
    (name "rust-rust-embed-utils")
    (version "7.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rust-embed-utils" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ab02sv9zlinf6gacmac0zm9iv7q9kcyrx013mx4icfbmyiyqvvm"))))
    (arguments
     `(#:cargo-inputs
       (("rust-sha2" ,rust-sha2-0.9))))))

(define-public rust-rust-embed-6.4
  (package
    (name "rust-rust-embed")
    (version "6.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rust-embed" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1hxi8d4nrlqm8xvhn86iinw5dfm05m9lxs9a32bz665kcnnfa5ws"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rust-embed-impl" ,rust-rust-embed-impl-6.2)
        ("rust-rust-embed-utils" ,rust-rust-embed-utils-7)
        ("rust-walkdir" ,rust-walkdir-2))))
    (home-page "https://github.com/pyrossh/rust-embed")
    (synopsis "Rust Macro which loads files into the rust binary at compile time during release and loads the file from the fs during dev")
    (description " Rust Macro which loads files into the rust binary at compile time during release and loads the file from the fs during dev.")
    (license license:expat)))

(define-public rust-textwrap-0.14
  (package
    (inherit rust-textwrap-0.12)
    (name "rust-textwrap")
    (version "0.14.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "textwrap" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "106xjfzfpk3nj51fx9slf9kyir7xjwvpqm003v9ardgq5b8whrh0"))))
    (arguments
     `(#:cargo-inputs
       (("rust-smawk" ,rust-smawk-0.3)
        ("rust-unicode-linebreak" ,rust-unicode-linebreak-0.1))))))

(define-public rust-tui-0.17
  (package
    (inherit rust-tui-0.16)
    (name "rust-tui")
    (version "0.17.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tui" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0w92l3ilsz4lzmsp6illpsvabgsl0nysridny5rrn0wbr0r0mv93"))))))

(define-public rust-tinystr-0.3
  (package
    (name "rust-tinystr")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tinystr" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "18rbmjw2rv3wvij5318kyx8vn6w2cyvbzphy1c4ipnhynp27kb2b"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/unicode-org/icu4x")
    (synopsis "A small ASCII-only bounded length string representation.")
    (description "A small ASCII-only bounded length string representation.")
    (license license:asl2.0)))

(define-public rust-unic-langid-impl-0.9
  (package
    (name "rust-unic-langid-impl")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unic-langid-impl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0kck3fpdvqv5nha47xkna3zsr8ik9hpyr5ac830n4j29y3m8wjhs"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/zbraniecki/unic-locale")
    (synopsis "Unic crates for locale management implementing Unicode UTS #35")
    (description " Unic crates for locale management implementing Unicode UTS #35.")
    (license (list license:expat license:asl2.0))
    (arguments
     `(#:cargo-inputs
       (("rust-tinystr" ,rust-tinystr-0.3))))))

(define-public rust-unic-langid-0.9
  (package
    (name "rust-unic-langid")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unic-langid" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1rcw8llr3a120qad7rlbv4fb19l744ckxwnx37dhn0qafg6qyckk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-unic-langid-impl" ,rust-unic-langid-impl-0.9))))
    (home-page "https://github.com/zbraniecki/unic-locale")
    (synopsis "Unic crates for locale management implementing Unicode UTS #35")
    (description " Unic crates for locale management implementing Unicode UTS #35.")
    (license (list license:expat license:asl2.0))))

(define-public rust-crossterm-winapi-0.9
  (package
    (inherit rust-crossterm-winapi-0.8)
    (name "rust-crossterm-winapi")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crossterm_winapi" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "075z15gxm4rn5yywq46khbg29bf504ix0f06zq3hx8aa91db7q9a"))))))

(define-public greetd
  (package
    (name "greetd")
    (version "0.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.sr.ht/~kennylevinsen/greetd")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0x5c3jkw09kvj2grcxm899y2n6ws8p990cyp9cs0fy6lm4fzlh6v"))
              ;; Move to (search-patches ...) when adding to the repo
              ;;(patches '("unnsvc/greetd-ipc.patch"))
              ))
    (build-system cargo-build-system)
    (arguments
     `(
       ;;#:install-source? #f
       #:cargo-inputs (
        ("rust-async-trait" ,rust-async-trait-0.1)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-json" ,rust-serde-json-1)
        ("rust-thiserror" ,rust-thiserror-1)
        ("rust-tokio" ,rust-tokio-1)
        ("rust-enquote" ,rust-enquote-1.1)
        ("rust-getopts" ,rust-getopts-0.2)
        ("rust-nix" ,rust-nix-0.19)
        ("rust-pam-sys" ,rust-pam-sys-0.5)
        ("rust-users" ,rust-users-0.11)
        ("rust-rpassword" ,rust-rpassword-5))
        #:phases
        (modify-phases %standard-phases
          ;; The cargo-install phase is re-purposed to just install build artifacts
          (add-after 'build 'build-manpages
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (with-directory-excursion "man"
                  (mkdir-p out)
                  (invoke "make" "all")))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (outbin (string-append out "/bin/")))
                ;; Install binaries
                (with-directory-excursion "target/release"
                  (install-file "greetd" outbin)
                  (install-file "agreety" outbin)
                  (install-file "fakegreet" outbin))
                ;; Install manpages
                (with-directory-excursion "man"
                  (setenv "PREFIX" out)
                  (format #t "POUTPUT TO PREFIX: ~a~%" (getenv "PREFIX"))
                  (invoke "make" "install"))))))))
    (inputs
     (list linux-pam scdoc pkg-config))
    (synopsis "GreetD is a minimal login manager deamon.")
    (description "GreetD is a minimal login manager daemon.")
    (home-page "https://git.sr.ht/~kennylevinsen/greetd")
    (license (list license:gpl3))))

(define-public tuigreet
  (package
    (name "tuigreet")
    (version "0.7.2")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/apognu/tuigreet.git")
         (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1g976jmkayi2mv0mx3yw5hqq6ai4l8z495s00id30rpvald0dvij"))))
    (build-system cargo-build-system)
    (arguments
     `(#:install-source? #f
       #:cargo-inputs (("rust-chrono" ,rust-chrono-0.4)
                       ("rust-crossterm" ,rust-crossterm-0.22)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-getopts" ,rust-getopts-0.2)
                       ("rust-greetd-ipc" ,rust-greetd-ipc-0.8)
                       ("rust-i18n-embed" ,rust-i18n-embed-0.13)
                       ("rust-i18n-embed-fl" ,rust-i18n-embed-fl-0.6)
                       ("rust-nix" ,rust-nix-0.23)
                       ("rust-rust-embed" ,rust-rust-embed-6.4)
                       ("rust-rust-ini" ,rust-rust-ini-0.17)
                       ("rust-smart-default" ,rust-smart-default-0.6)
                       ("rust-textwrap" ,rust-textwrap-0.14)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tui" ,rust-tui-0.17)
                       ("rust-unic-langid" ,rust-unic-langid-0.9)
                       ("rust-zeroize" ,rust-zeroize-1)
                       ("rust-crossterm-winapi" ,rust-crossterm-winapi-0.9)
                       ("rust-fluent" ,rust-fluent-0.16)
                       ("rust-fluent-langneg" ,rust-fluent-langneg-0.13)
                       ("rust-fluent-syntax" ,rust-fluent-syntax-0.11))))
    (synopsis "GTK-based greeter for GreetD")
    (description "GTK-based greeter for GreetD.")
    (home-page "https://github.com/apognu/tuigreet")
    (license license:gpl3)))


;;tuigreet
;;greetd
