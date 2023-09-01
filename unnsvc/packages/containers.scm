(define-module (unnsvc packages containers)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages containers)
  #:use-module (gnu packages selinux)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages protobuf)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system go)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cargo))

(define-public rust-iptables
  (package
    (name "rust-iptables")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "iptables" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0iqi5303wk2gx5fdbr5d1507mk87l6yifnjdaiwlb0a3wzc8lj0w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-0.2)
        ("rust-nix" ,rust-nix-0.23))))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:expat license:asl2.0))))

(define-public rust-sval-test
  (package
    (name "rust-sval-test")
    (version "2.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sval-test" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "10kmxysanpa0kvll716s7a4bqsfd8c0w0b4g1a1g3mv2mm8cbip2"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-sval-ref
  (package
    (name "rust-sval-ref")
    (version "2.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sval-ref" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0z1dy9mvqw9w63mz82h8il1r9dxlp1dadh54npcx0jwq5aaa2g3h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-sval" ,rust-sval-2)
        ("rust-sval-test" ,rust-sval-test))))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-sval-2
  (package/inherit rust-sval-1
    (name "rust-sval")
    (version "2.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sval" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1cbq3cx67dw0my4cn8ldgf9p4hkxsmb5g6yggi3yklrllhh160wb"))))))

(define-public rust-itoa-1.0.5
  (package/inherit rust-itoa-1
    (name "rust-itoa")
    (version "1.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "itoa" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0h343sak699ci49anaa7l3p94b9kcc4ypaqwcam6qsz8p7s85mgs"))))))

(define-public rust-value-bag-serde1
  (package
    (name "rust-value-bag-serde1")
    (version "1.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "value_bag_serde1" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1523528ccb5pmba1pwz4nk5qns7wv2k435vysva50fj0xzzg7fdh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-erased-serde-0.3" ,rust-erased-serde-0.3)
        ("rust-serde-fmt" ,rust-serde-fmt-1))))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-actix-router-0.2.7
  (package/inherit rust-actix-router-0.2
    (name "rust-actix-router")
    (version "0.2.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "actix-router" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0b258dplqmria44mv1zzjpmm2xrpdzwcqcz3jg41z7k4ffprklia"))))))

(define-public rust-gonzales
  (package
    (name "rust-gonzales")
    (version "0.0.3-beta")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gonzales" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01w0prwnqqp527qqb593fd25y4cnhgczk1fz9k8yygp4l3h3m9j7"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-path-tree-0.2
  (package
    (name "rust-path-tree")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "path-tree" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ank4ajbj4z2n5srdfx9qmjnbwfj5czm833md1x50h2n4sbn00sd"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-route-recognizer
  (package
    (name "rust-route-recognizer")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "route-recognizer" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ikp3blbina00jdbifxw1c9whg6mljli24lq5pv82iar53xr9axg"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-smartcow
  (package
    (name "rust-smartcow")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "smartcow" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "18jxicfi9q2b666vxflyjk2mxpxgv23wwd116xald36a3wfcnvv5"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-routefinder
  (package
    (name "rust-routefinder")
    (version "0.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "routefinder" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1jia5377jj56960zgqcnmi538kn1lwgxlg952isk3pfy22dzky4l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-smartcow" ,rust-smartcow)
        ("rust-smartstring" ,rust-smartstring-1))))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-matchit-0.7
  (package
    (name "rust-matchit")
    (version "0.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "matchit" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1vsj5zaizw44wh9793g5nlkcxi8mnfd41zscy1bax17qlsr044pd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:cargo-development-inputs
       (("rust-actix-router" ,rust-actix-router-0.2.7)
        ("rust-criterion" ,rust-criterion-0.3)
        ("rust-gonzales" ,rust-gonzales)
        ("rust-hyper" ,rust-hyper-0.14)
        ("rust-path-tree" ,rust-path-tree-0.2)
        ("rust-route-recognizer" ,rust-route-recognizer)
        ("rust-routefinder" ,rust-routefinder)
        ("rust-tower" ,rust-tower-0.4))))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-sval-json
  (package
    (name "rust-sval-json")
    (version "2.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sval_json" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "13c8hna2n7ykiz3l3ahx2iqmfjmwhyfm0j9n51h8ifwcwckzd9md"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-sval-serde
  (package
    (name "rust-sval-serde")
    (version "2.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sval_serde" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0imhipninbxsj4l6ahiqb3dw8vvbbk9y9yhyspjw7xw10p6jc2c3"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-sval-fmt
  (package
    (name "rust-sval-fmt")
    (version "2.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sval_fmt" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "09j3ss5kayp6pb23wasc1k9mjcvv0x6v1xrqzasml162cj9rxh3x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-itoa" ,rust-itoa-1)
        ("rust-ryu" ,rust-ryu-1))))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-sval-dynamic
  (package
    (name "rust-sval-dynamic")
    (version "2.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sval_dynamic" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kq3shbdfz74hhq4aaf27h99ax7piaqd3f4d6g9nx93pia765vx0"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-netlink-sys
  (package
    (name "rust-netlink-sys")
    (version "0.8.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "netlink-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04842pp457q7g14d6a61j70k60zg2wrbz0cmda3ka0dcww4bywb4"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-rtnetlink
  (package
    (name "rust-rtnetlink")
    (version "0.13.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rtnetlink" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1h46w6knfvfa352b8fn4kbmlqhxa4fyqdxykxqxqrwqr5nw2wmbs"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-genetlink
  (package
    (name "rust-genetlink")
    (version "0.2.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "genetlink" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "17q7zlmp95fx28zjkzh69g6d5q6rm2a3dkj7yy5jk8gsq5v0128z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-async-std" ,rust-async-std-1)
        ("rust-netlink-packet-core" ,rust-netlink-packet-core-0.7)
        ("rust-netlink-packet-generic" ,rust-netlink-packet-generic-0.3)
        ("rust-netlink-proto" ,rust-netlink-proto)
        ("rust-netlink-sys" ,rust-netlink-sys))))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-derive-into-owned-0.1
  (package
    (name "rust-derive-into-owned")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "derive-into-owned" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0qnac89fds5m3rz6s2g557rxy2l3qgcshyw8ll9j0n8xsc2cwvsp"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-pcap-file-1
  (package
    (name "rust-pcap-file")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pcap-file" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0hd382xfr41prh86plbx2lypa7gjfi82c6x8mrch24l33bnkzlba"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1)
        ("rust-derive-into-owned" ,rust-derive-into-owned-0.1)
        ("rust-thiserror" ,rust-thiserror-1)
        ("rust-glob" ,rust-glob-0.3)
        ("rust-quote" ,rust-quote-0.3)
        ("rust-syn" ,rust-syn-0.11))))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-netlink-proto
  (package
    (name "rust-netlink-proto")
    (version "0.11.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "netlink-proto" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1hqjpa7ppciqp6h5lh71ipivhwpq3v32j67l0bckvcsbziq6fb44"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-netlink-packet-generic-0.3
  (package
    (name "rust-netlink-packet-generic")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "netlink-packet-generic" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12rhb95ayx63zb55mz8z5vc5lghk92s8bxmpiimlrj1isf5fpmqw"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-netlink-packet-route-0.10
  (package
    (name "rust-netlink-packet-route")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "netlink-packet-route" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0lp5wqhjfdn7pinmpknr4fycrkxqc6v1j78y2420jz6yfx0dbdcz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-anyhow" ,rust-anyhow-1)
        ("rust-netlink-packet-core" ,rust-netlink-packet-core-0.4))
       #:cargo-development-inputs
       (("rust-netlink-sys" ,rust-netlink-sys)
        ("rust-pcap-file" ,rust-pcap-file-1)
        ("rust-pretty-assertions" ,rust-pretty-assertions-0.7))))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-netlink-packet-route-0.13
  (package
    (name "rust-netlink-packet-route")
    (version "0.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "netlink-packet-route" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "06lg6j147b2b8v470wx2q567z22i1bmr9rkz4fcc4wwkfknybppm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-anyhow" ,rust-anyhow-1)
        ("rust-netlink-packet-core" ,rust-netlink-packet-core-0.4))
       #:cargo-development-inputs
       (("rust-pretty-assertions" ,rust-pretty-assertions-0.7)
        ("rust-pcap-file" ,rust-pcap-file-1)
        ("rust-netlink-sys" ,rust-netlink-sys))))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-netlink-packet-route-0.15
  (package
    (name "rust-netlink-packet-route")
    (version "0.15.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "netlink-packet-route" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0g1565p2mz87l1i6582n5rciscbcrcp5g3y36q9g11vxqwr3x6ga"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-anyhow" ,rust-anyhow-1)
        ("rust-netlink-packet-core" ,rust-netlink-packet-core-0.5)
        ("rust-netlink-packet-utils" ,rust-netlink-packet-utils-0.5))
       #:cargo-development-inputs
       (("rust-pretty-assertions" ,rust-pretty-assertions-0.7)
        ("rust-pcap-file" ,rust-pcap-file-1)
        ("rust-netlink-sys" ,rust-netlink-sys))))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-netlink-packet-route-0.17
  (package
    (name "rust-netlink-packet-route")
    (version "0.17.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "netlink-packet-route" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0rjsg8cd8yd1in9czmzg1fa0y9qgx4lhh3aqi0grf1m3lp79hf85"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-anyhow" ,rust-anyhow-1)
        ("rust-netlink-packet-core" ,rust-netlink-packet-core-0.7)
        ("rust-netlink-packet-utils" ,rust-netlink-packet-utils-0.5)
        ("rust-netlink-sys" ,rust-netlink-sys))
       #:cargo-development-inputs
       (("rust-pcap-file" ,rust-pcap-file-1)
        ("rust-pretty-assertions" ,rust-pretty-assertions-0.7))))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-netlink-packet-utils-0.5
  (package
    (name "rust-netlink-packet-utils")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "netlink-packet-utils" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0d3xfh9zg0x2hbmh8iws0dvhj69prpx54khfvmfakm8sqw48mphf"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-netlink-packet-core-0.7
  (package
    (name "rust-netlink-packet-core")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "netlink-packet-core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "197dh9c5570135kv5q770n2ih5prhsql58cd71xxcya4f2plywkj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-anyhow" ,rust-anyhow-1)
        ("rust-netlink-packet-utils" ,rust-netlink-packet-utils-0.5)
        ("rust-netlink-packet-route" ,rust-netlink-packet-route-0.13))))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-netlink-packet-core-0.5
  (package
    (name "rust-netlink-packet-core")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "netlink-packet-core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0njkzy91g5039y3icl8gdsd4q39ds47zyh2wc68lpnpz9ssz0p3y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-anyhow" ,rust-anyhow-1)
        ("rust-netlink-packet-utils" ,rust-netlink-packet-utils-0.5))
       #:cargo-development-inputs
       (("rust-netlink-packet-route" ,rust-netlink-packet-route-0.13))))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-netlink-packet-core-0.4
  (package
    (name "rust-netlink-packet-core")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "netlink-packet-core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "15qj97azqrkrkmp2w5cfwxhd16b6hmb8rs33csca4wafpnsqlnrl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-anyhow" ,rust-anyhow-1)
        ("rust-netlink-packet-utils" ,rust-netlink-packet-utils-0.5))
       #:cargo-development-inputs
       (("rust-netlink-packet-route" ,rust-netlink-packet-route-0.10))))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-dhcproto
  (package
    (name "rust-dhcproto")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dhcproto" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1hsbl77lxvxa94ihn2vna1sx2icrkch427w24a883xymhm9h9vnw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-dhcproto-macros" ,rust-dhcproto-macros)
        ("rust-hex" ,rust-hex-0.4)
        ("rust-ipnet" ,rust-ipnet-2)
        ("rust-trust-dns-proto" ,rust-trust-dns-proto-0.22))))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-dhcproto-macros
  (package
    (name "rust-dhcproto-macros")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dhcproto-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0w61gvnm17frkm6mk8q4xkwd1iji946lj5f175w585h4hvxkx6d7"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-etherparse
  (package
    (name "rust-etherparse")
    (version "0.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "etherparse" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "146rcbnhlpcbl6c6csfhvz0227wbiwhk13md6acq8211b7m94wl2"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-mozim
  (package
    (name "rust-mozim")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mozim" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "14f4k92zfr1mm2qhq6j3bq277j4wfdlj24lb96py0jrivz81a70c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1)
        ("rust-dhcproto" ,rust-dhcproto)
        ("rust-etherparse" ,rust-etherparse)
        ("rust-futures" ,rust-futures-0.3)
        ("rust-nispor" ,rust-nispor)
        ("rust-env-logger" ,rust-env-logger-0.10))))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-sval-buffer
  (package
    (name "rust-sval-buffer")
    (version "2.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sval_buffer" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0a30rw303lafs5n08xpb2sfmw45h490wri9c7wpk8szj590ykxvb"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-value-bag-sval2
  (package
    (name "rust-value-bag-sval2")
    (version "1.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "value_bag_sval2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0zdd1xj6vby5bv575vqc7in3gs9mzg8jgxfbj4g3dwxn8r0lzcih"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-sval-buffer" ,rust-sval-buffer)
        ("rust-sval-dynamic" ,rust-sval-dynamic)
        ("rust-sval-fmt" ,rust-sval-fmt)
        ("rust-sval-json" ,rust-sval-json)
        ("rust-sval-serde" ,rust-sval-serde)
        ("rust-mozim" ,rust-mozim))))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-value-bag-1.4
  (package/inherit rust-value-bag-1
    (name "rust-value-bag")
    (version "1.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "value-bag" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "18zl11ghirkc4mnkma1ms210gzgg0hm1an8vq1430l48zdkwsb6r"))))
    (arguments
     `(#:cargo-inputs
       (("rust-value-bag-serde1" ,rust-value-bag-serde1)
        ("rust-value-bag-sval2" ,rust-value-bag-sval2))))))

(define-public rust-sval-derive-2
  (package
    (name "rust-sval-derive")
    (version "2.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sval_derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1xp383009kz8lw0892fli31nbz17d7yw6f4gks1f5i70d1vcsadb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-ethtool
  (package
    (name "rust-ethtool")
    (version "0.2.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ethtool" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0nivim6pzfvrnmyb0p7qv39q54vraa0z6jy0ims7gp0panih93hx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-genetlink" ,rust-genetlink))))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-mptcp-pm
  (package
    (name "rust-mptpc-pm")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mptcp-pm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ma2r9ffp2164s1msfjw78553xccy4i9lvrkbsvhgr6wcgyaibry"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-nispor
  (package
    (name "rust-nispor")
    (version "1.2.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nispor" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0z2q50ayy5gxz3q651v6qb3vqx4zjyrcic9lsswv90yy3wcig8x6"))))
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-ethtool" ,rust-ethtool)
        ("rust-futures" ,rust-futures-0.3)
        ("rust-mptcp-pm" ,rust-mptcp-pm)
        ("rust-netlink-packet-route" ,rust-netlink-packet-route-0.17)
        ("rust-netlink-packet-utils" ,rust-netlink-packet-utils-0.5)
        ("rust-netlink-sys" ,rust-netlink-sys)
        ("rust-rtnetlink" ,rust-rtnetlink)
        ("rust-nix" ,rust-nix-0.26))
       #:cargo-development-inputs
       (("rust-pretty-assertions" ,rust-pretty-assertions-1)
        ("rust-serde-yaml" ,rust-serde-yaml-0.9))))
    (build-system cargo-build-system)
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-prost-build-0.11
  (package
    (name "rust-prost-build")
    (version "0.11.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "prost-build" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0w5jx97q96ydhkg67wx3lb11kfy8195c56g0476glzws5iak758i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-bytes" ,rust-bytes-1)
        ("rust-heck" ,rust-heck-0.4)
        ("rust-itertools" ,rust-itertools-0.10)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-log" ,rust-log-0.4)
        ("rust-multimap" ,rust-multimap-0.8)
        ("rust-petgraph" ,rust-petgraph-0.6)
        ("rust-prost" ,rust-prost-0.11)
        ("rust-prettyplease" ,rust-prettyplease-0.1)
        ("rust-prost-types" ,rust-prost-types-0.11)
        ("rust-pulldown-cmark" ,rust-pulldown-cmark-0.9)
        ("rust-pulldown-cmark-to-cmark" ,rust-pulldown-cmark-to-cmark-10))))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-prost-types-0.11
  (package
    (name "rust-prost-types")
    (version "0.11.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "prost-types" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04ryk38sqkp2nf4dgdqdfbgn6zwwvjraw6hqq6d9a6088shj4di1"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-pulldown-cmark-to-cmark-10
  (package
    (name "rust-pulldown-cmark-to-cmark")
    (version "10.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pulldown-cmark-to-cmark" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0gc366cmd5jxal9m95l17rvqsm4dn62lywc8v5gwq8vcjvhyd501"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-tonic-build-0.8
  (package
    (name "rust-tonic-build")
    (version "0.8.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tonic-build" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1i781mfzcbzfk6fnf7qp95q6r0b05ixvmynw4z0agq7pq2wykxav"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-prettyplease" ,rust-prettyplease-0.1)
        ("rust-prost-build" ,rust-prost-build-0.11))))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-headers-0.3.9
  (package/inherit rust-headers-0.3
    (name "rust-headers")
    (version "0.3.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "headers" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0w62gnwh2p1lml0zqdkrx9dp438881nhz32zrzdy61qa0a9kns06"))))))

(define-public rust-multer
  (package
    (name "rust-multer")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "multer" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1hjiphaypj3phqaj5igrzcia9xfmf4rr4ddigbh8zzb96k1bvb01"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bytes" ,rust-bytes-1)
        ("rust-encoding-rs" ,rust-encoding-rs-0.8)
        ("rust-tokio-util" ,rust-tokio-util-0.7))
       #:cargo-development-inputs
       (("rust-hyper" ,rust-hyper-0.14))))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-sync-wrapper
  (package
    (name "rust-sync-wrapper")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sync_wrapper" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0q01lyj0gr9a93n10nxsn8lwbzq97jqd6b768x17c8f7v7gccir0"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-tokio-tungstenite-0.18
  (package/inherit rust-tokio-tungstenite-0.11
    (name "rust-tokio-tungstenite")
    (version "0.18.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-tungstenite" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1z8bxhq6d1ndh4x914wwk72l93ha1sl0jmnb6knvqiqi869rqcal"))))
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-tungstenite" ,rust-tungstenite-0.18)
        ("rust-rustls-native-certs" ,rust-rustls-native-certs-0.6)
        ("rust-tokio-native-tls" ,rust-tokio-native-tls-0.3)
        ("rust-tokio-rustls" ,rust-tokio-rustls-0.23)
        ("rust-webpki-roots" ,rust-webpki-roots-0.22))
       #:cargo-development-inputs
       (("rust-hyper" ,rust-hyper-0.14))))))

(define-public rust-axum-core
  (package
    (name "rust-axum-core")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "axum-core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0b1d9nkqb8znaba4qqzxzc968qwj4ybn4vgpyz9lz4a7l9vsb7vm"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-axum-macros
  (package
    (name "rust-axum-macros")
    (version "0.3.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "axum-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0qkb5cg06bnp8994ay0smk57shd5hpphcmp90kd7p65dxh86mjnd"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-axum
  (package
    (name "rust-axum")
    (version "0.6.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "axum" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0rv9xkibnsgjg4vx658k3qhz0029b7indj34wxsrwczv98iwcdv1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-async-trait" ,rust-async-trait-0.1)
        ("rust-axum-core" ,rust-axum-core)
        ("rust-axum-macros" ,rust-axum-macros)
        ;;("rust-base64" ,rust-base64-0.21)
        ("rust-bitflags" ,rust-bitflags-1)
        ("rust-bytes" ,rust-bytes-1)
        ("rust-futures-util" ,rust-futures-util-0.3)
        ("rust-headers" ,rust-headers-0.3.9)
        ("rust-http-body" ,rust-http-body-0.4.5)
        ("rust-hyper" ,rust-hyper-0.14)
        ("rust-itoa" ,rust-itoa-1.0.5)
        ("rust-matchit" ,rust-matchit-0.7)
        ("rust-sync-wrapper" ,rust-sync-wrapper)
        ("rust-multer" ,rust-multer)
        ("rust-serde-path-to-error" ,rust-serde-path-to-error-0.1)
        ;;("rust-serde-urlencoded" ,rust-serde-urlencoded-0.7)
        ("rust-sha1" ,rust-sha1-0.10)
        ("rust-tokio-tungstenite" ,rust-tokio-tungstenite-0.18)
        ("rust-tower" ,rust-tower-0.4.13)
        ("rust-tower-http" ,rust-tower-http)
        ("rust-tower-layer" ,rust-tower-layer-0.3.2)
        ("rust-base64" ,rust-base64-0.21.3)
        ;;("rust-tower-service" ,rust-tower-service-0.3)
        )
       #:cargo-development-inputs
       (("rust-quickcheck-macros" ,rust-quickcheck-macros-1)
        ("rust-reqwest" ,rust-reqwest-0.11))))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-tungstenite-0.18
  (package/inherit rust-tungstenite-0.11
    (name "rust-tungstenite")
    (version "0.18.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tungstenite" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1207jv8ciklgnqwjhxc1c1xhplrfab231191apyz0k6d56vnmvih"))))
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-sha1" ,rust-sha1-0.10)
        ("rust-utf-8" ,rust-utf-8-0.7)
        ("rust-rustls-native-certs" ,rust-rustls-native-certs-0.6)
        ("rust-webpki-roots" ,rust-webpki-roots-0.22))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger-0.10)
        ("rust-input-buffer" ,rust-input-buffer-0.5))))))

(define-public rust-hdrhistogram-7
  (package/inherit rust-hdrhistogram-6
    (name "rust-hdrhistogram")
    (version "7.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hdrhistogram" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1a1al1rfxcqmx0n9h100ggvg036f4rv69fq12kimazvw9zsvj6bz"))))))

(define-public rust-input-buffer-0.5
  (package/inherit rust-input-buffer-0.3
    (name "rust-input-buffer")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "input-buffer" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "044qxqdkcq6mv07bsvm35hl7hy3rmf87lrxjyz8zaq57i0xngvmc"))))))

(define-public rust-tower-0.4.13
  (package/inherit rust-tower-0.4
    (name "rust-tower")
    (version "0.4.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tower" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "073wncyqav4sak1p755hf6vl66njgfc1z1g1di9rxx3cvvh9pymq"))))
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-tower-layer" ,rust-tower-layer-0.3)
        ("rust-tower-service" ,rust-tower-service-0.3.2)
        ("rust-hdrhistogram" ,rust-hdrhistogram-7)
        ("rust-tokio-stream" ,rust-tokio-stream-0.1))
       #:cargo-development-inputs
       (("rust-tokio-test" ,rust-tokio-test-0.4)
        ("rust-tower-test" ,rust-tower-test-0.4))))))

(define-public rust-tower-test-0.4
  (package/inherit rust-tower-test-0.3
    (name "rust-tower-test")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tower-test" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "19zgjwzr9216yg1ayrnsly06lqdv96m2z1xq0bmf9fgazxrnfm54"))))))

(define-public rust-async-compression-0.4
  (package/inherit rust-async-compression-0.3
    (name "rust-async-compression")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "async-compression" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0avdpqb01p9k3ix1vcvsjfzrgk4samgw0nhs94j36sc407fbd5fl"))))
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-deflate64" ,rust-deflate64)
        ("rust-brotli" ,rust-brotli-3)
        ("rust-bzip2" ,rust-bzip2-0.4)
        ("rust-zstd" ,rust-zstd-0.12)
        ("rust-zstd-safe" ,rust-zstd-safe-6)
        ("rust-xz2" ,rust-xz2-0.1))))))

(define-public rust-zstd-0.12
  (package/inherit rust-zstd-0.11
    (name "rust-zstd")
    (version "0.12.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zstd" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0g654jj8z25rvzli2b1231pcp9y7n6vk44jaqwgifh9n2xg5j9qs"))))))

(define-public rust-zstd-safe-6
  (package/inherit rust-zstd-safe-5
    (name "rust-zstd-safe")
    (version "6.0.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zstd-safe" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "10cm0v8sw3jz3pi0wlwx9mbb2l25lm28w638a5n5xscfnk8gz67f"))))))

(define-public rust-tower-service-0.3.2
  (package/inherit rust-tower-service-0.3
    (name "rust-tower-service")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tower-service" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0lmfzmmvid2yp2l36mbavhmqgsvzqf7r2wiwz73ml4xmwaf1rg5n"))))))

(define-public rust-base64-0.21.3
  (package/inherit rust-base64-0.21
    (name "rust-base64")
    (version "0.21.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "base64" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0lvf1ishhckkjwiamhqr3iwy5ddrzgvgqfkblwkcaxrxqvxwwka1"))))))

(define-public rust-http-body-0.4.5
  (package/inherit rust-tower-0.4
    (name "rust-http-body")
    (version "0.4.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "http-body" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1l967qwwlvhp198xdrnc0p5d7jwfcp6q2lm510j6zqw4s4b8zwym"))))))

(define-public rust-mime-0.3.17
  (package/inherit rust-mime-0.3
    (name "rust-mime")
    (version "0.3.17")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mime" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "16hkibgvb9klh0w0jk5crr5xv90l3wlf77ggymzjmvl1818vnxv8"))))))

(define-public rust-tower-layer-0.3.2
  (package/inherit rust-tower-layer-0.3
    (name "rust-tower-layer")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tower-layer" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1l7i17k9vlssrdg4s3b0ia5jjkmmxsvv8s9y9ih0jfi8ssz8s362"))))))

(define-public rust-tower-http
  (package
    (name "rust-tower-http")
    (version "0.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tower-http" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "10ksnhpwfbq0c837hgp28ig8nnz2gx1mqs8w865jm3ds78l71bjm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-async-compression" ,rust-async-compression-0.4)
        ("rust-bitflags" ,rust-bitflags-2)
        ("rust-base64" ,rust-base64-0.21.3)
        ("rust-http-body" ,rust-http-body-0.4.5)
        ("rust-http-range-header" ,rust-http-range-header)
        ("rust-httpdate" ,rust-httpdate-1)
        ("rust-iri-string" ,rust-iri-string)
        ("rust-mime" ,rust-mime-0.3.17)
        ("rust-tokio-util" ,rust-tokio-util-0.7)
        ("rust-tower" ,rust-tower-0.4)
        ("rust-hyper" ,rust-hyper-0.14))))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-deflate64
  (package
    (name "rust-deflate64")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "deflate64" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0q2g25kr1anrkgvm2qazm0z8jcy1m8h064sppdrdx0m54ns5pp1h"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-iri-string
  (package
    (name "rust-iri-string")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "iri-string" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1h07hkfkkjjvgzlaqpr5fia7hrgv7qxqdw4xrpdc3936gmk9p191"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-http-range-header
  (package
    (name "rust-http-range-header")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "http-range-header" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "13vm511vq3bhschkw2xi9nhxzkw53m55gn9vxg7qigfxc29spl5d"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license (list license:asl2.0 license:expat))))

(define-public rust-http-body-0.4.5
  (package/inherit rust-log-0.4
    (name "rust-http-body")
    (version "0.4.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "http-body" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1l967qwwlvhp198xdrnc0p5d7jwfcp6q2lm510j6zqw4s4b8zwym"))))))

(define-public rust-log-0.4.20
  (package/inherit rust-log-0.4
    (name "rust-log")
    (version "0.4.20")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "log" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "13rf7wphnwd61vazpxr7fiycin6cb1g8fmvgqg18i464p0y1drmm"))))
    (arguments
     `(#:tests? #f
       #:cargo-inputy
       (("rust-sval" ,rust-sval-2)
        ("rust-sval-ref" ,rust-sval-ref)
        ("rust-value-bag" ,rust-value-bag-1.4))
       #:cargo-development-inputs
       (("rust-serde-test" ,rust-serde-test-1)
        ("rust-serde-derive" ,rust-serde-derive-1)
        ("rust-sval-derive" ,rust-sval-derive-2))))))

(define-public rust-digest-0.10.7
  (package/inherit rust-digest-0.10
    (name "digest")
    (version "0.10.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "digest" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "14p2n6ih29x81akj097lvz7wi9b6b9hvls0lwrv7b6xwyy0s5ncy"))))))

(define-public rust-sha2-0.10.7
  (package/inherit rust-sha2-0.10
    (name "sha2")
    (version "0.10.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sha2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1n3flx8bjyblmb2n860g8402z7q10caajp2n403n37i3cbcbk7s7"))))
    (arguments
     `(#:cargo-inputs
       (("rust-digest" ,rust-digest-0.10.7)
        ("rust-cpufeatures" ,rust-cpufeatures-0.2))
       #:cargo-development-inputs
       (("rust-hex-literal" ,rust-hex-literal-0.2))))))

(define-public rust-prost-derive-0.11
  (package/inherit rust-prost-derive-0.9
    (name "rust-prost-derive")
    (version "0.11.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "prost-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1d3mw2s2jba1f7wcjmjd6ha2a255p2rmynxhm1nysv9w1z8xilp5"))))))

(define-public rust-prost-0.11
  (package/inherit rust-prost-0.9
    (name "rust-prost")
    (version "0.11.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "prost" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kc1hva2h894hc0zf6r4r8fsxfpazf7xn5rj3jya9sbrsyhym0hb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-bytes" ,rust-bytes-1)
        ("rust-prost-derive" ,rust-prost-derive-0.11))))))

(define-public rust-sysctl-0.5
  (package/inherit rust-sysctl-0.4
    (name "rust-sysctl")
    (version "0.5.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sysctl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ghxnlffv8xc65hgr84pr3gbnyjvi5khgjcv51cncrdxrjidcrpd"))))))

(define-public rust-once-cell-1.14
  (package/inherit rust-once-cell-1
    (name "rust-once-cell")
    (version "1.14.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "once_cell" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1h6pc09c5yf1vyyb32sp12k3j9w853vfn22bl9yxgjiikswm8wig"))))))

(define-public rust-quote-1.0.30
  (package/inherit rust-quote-1
    (name "rust-quote")
    (version "1.0.30")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "quote" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fw4h7j524dq7dk1fciahzkhx9ngjxy6w3qp2n5ll9bpqavs21sr"))))))

(define-public rust-proc-macro2-1.0.65
  (package/inherit rust-proc-macro2-1
    (name "rust-proc-macro2")
    (version "1.0.65")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "proc-macro2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zhxdbfn0g2q5wqzd4xcbglrgyr9yzwcjy8w4sqpia3h8q8jbplj"))))))

(define-public rust-serde-derive-1.0.156
  (package/inherit rust-serde-derive-1
    (name "rust-serde-derive")
    (version "1.0.156")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0z88gj1imji06pwll6il2qvcvx4mwzf2hci29b3wwsz30539rqnp"))))
    (arguments
     `(#:cargo-inputs
       (("rust-syn" ,rust-syn-1))))))

(define-public rust-serde-1.0.156
  (package/inherit rust-serde-1
    (name "rust-serde")
    (version "1.0.156")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "19394in28sb9gh1v2153rqkyq46irr81x5a20701gpha5h4mnjri"))))
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-serde-derive" ,rust-serde-derive-1.0.156))))))

(define-public rust-toml-0.5.9
  (package/inherit rust-toml-0.5
    (name "rust-toml")
    (version "0.5.9")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "toml" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1mr40c0x3ma0dbzh4v43bfn4sj3k9ihpgq6fz1js88l6fnky30ld"))))))

(define-public rust-serde-json-1.0.99
  (package/inherit rust-serde-json-1
    (name "rust-serde-json")
    (version "1.0.99")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "serde-json" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1qzal5a1wlfw587xqfwngly0nhrkzqi7d1rva27hp820q9qnh9j6"))))))

(define-public rust-trybuild-1.0.67
  (package/inherit rust-trybuild-1
    (name "rust-trybuild")
    (version "1.0.67")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "trybuild" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1i7r1lmhg7kx19jfbdan0aq96ngx9qpcklpxx0lpqd2x5v362pi2"))))))

(define-public rust-pin-project-lite-0.2.11
  (package/inherit rust-pin-project-lite-0.2
    (name "pin-project-lite")
    (version "0.2.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pin-project-lite" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0n0bwr5qxlf0mhn2xkl36sy55118s9qmvx2yl5f3ixkb007lbywa"))))
       ;;(modules '((guix build utils)))
      ;;  (snippet
;;         '(substitute* "Cargo.toml"
;;            (("\\[dev-dependencies.rustversion\\]" m)
;;             (string-append "
;; [dev-dependencies.macrotest]
;; version = \"1\"
;; " m))))
       (arguments
        `(#:cargo-inputs
          (("rust-once-cell" ,rust-once-cell-1.14)
           ("rust-macrotest" ,rust-macrotest-1)
           ("rust-proc-macro2" ,rust-proc-macro2-1.0.65)
           ("rust-quote" ,rust-quote-1.0.30)
           ("rust-serde" ,rust-serde-1.0.156)
           ("rust-toml" ,rust-toml-0.5.9)
           ("rust-trybuild" ,rust-trybuild-1.0.67)
           ("rust-serde-json" ,rust-serde-json-1.0.99))))))

(define-public rust-tokio-rustls-0.24
  (package/inherit rust-tokio-rustls-0.23
    (name "rust-tokio-rustls")
    (version "0.24.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-rustls" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "10bhibg57mqir7xjhb2xmf24xgfpx6fzpyw720a4ih8a737jg0y2"))))
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-rustls" ,rust-rustls-0.21))
       #:cargo-development-inputs
       (("rust-argh" ,rust-argh-0.1)
        ("rust-rustls-pemfile" ,rust-rustls-pemfile-1)
        ("rust-rustls-webpki" ,rust-rustls-webpki-0.100)
        ("rust-webpki-roots" ,rust-webpki-roots-0.23))))))

(define-public rust-socket2-0.4.9
  (package/inherit rust-socket2-0.4
    (name "rust-socket2")
    (version "0.4.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "socket2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0qnn1r41jqj20m0a2nzzjgzndlmpg5maiyjchccaypfqxq8sk934"))))))

(define-public rust-tokio-macros-2
  (package/inherit rust-tokio-macros-1
    (name "rust-tokio-macros")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0pk7y9dfanab886iaqwcbri39jkw33kgl7y07v0kg1pp8prdq2v3"))))))

(define-public rust-tokio-1.29
  (package/inherit rust-tokio-1
    (name "rust-tokio")
    (version "1.29.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1nm4yhhirdczb7pz1raff0jmw8r91x0zxifjp4rmi78rfpzjca2k"))))
    (arguments
     `(#:cargo-inputs
       (("rust-pin-project-lite" ,rust-pin-project-lite-0.2.11)
        ("rust-bytes" ,rust-bytes-1)
        ("rust-tokio-macros" ,rust-tokio-macros-2)
        ("rust-socket2" ,rust-socket2-0.4.9))))))

(define-public rust-tonic-0.9
  (package/inherit rust-tonic-0.6
    (name "rust-tonic")
    (version "0.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tonic" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0nlx35lvah5hdcp6lg1d6dlprq0zz8ijj6f727szfcv479m6d0ih"))))
    (arguments
     `(#:cargo-inputs
       (("rust-axum" ,rust-axum)
        ("rust-async-stream" ,rust-async-stream-0.3)
        ("rust-hyper-timeout" ,rust-hyper-timeout-0.4)
        ("rust-prost" ,rust-prost-0.11)
        ("rust-rustls-native-certs" ,rust-rustls-native-certs-0.6)
        ("rust-rustls-pemfile" ,rust-rustls-pemfile-1)
        ("rust-tokio-rustls" ,rust-tokio-rustls-0.24)
        ("rust-tokio-stream" ,rust-tokio-stream-0.1)
        ("rust-tower" ,rust-tower-0.4)
        ("rust-webpki-roots" ,rust-webpki-roots-0.23))
       #:cargo-development-inputs
       (("rust-bencher" ,rust-bencher-0.1)
        ("rust-quickcheck-macros" ,rust-quickcheck-macros-1))))))

(define-public rust-zbus-macros-3.13
  (package/inherit rust-zbus-macros-3
    (name "rust-zbus-macros")
    (version "3.13.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zbus-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1brmniak38sx05z3vvc4k962j08n2rzvzjwwad769zys5v8l3qzn"))))
    (arguments
     `(#:cargo-inputs
       (("rust-winnow" ,rust-winnow-0.4)
        ("rust-zvariant-utils" ,rust-zvariant-utils-1))
       #:cargo-development-inputs
       (("rust-trybuild" ,rust-trybuild-1))))))

(define-public rust-zbus-3.13
  (package/inherit rust-zbus-3
    (name "rust-zbus")
    (version "3.13.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zbus" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         ;;"0j5rxgszrmkk5pbpwccrvj3gflwqw8jv8wfx9v84qbl75l53kpii"
         "0adbvblnn30qjinyl7iiyz8qj4anlp2vdw0734gk4a3cjv4pfgbc"))))
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-async-fs" ,rust-async-fs-1.6)
        ("rust-async-broadcast" ,rust-async-broadcast-0.5)
        ("rust-async-process" ,rust-async-process-1.7)
        ("rust-async-recursion" ,rust-async-recursion-1)
        ("rust-async-trait" ,rust-async-trait-0.1)
        ("rust-byteorder" ,rust-byteorder-1)
        ("rust-derivative" ,rust-derivative-2)
        ("rust-ordered-stream" ,rust-ordered-stream-0.2)
        ("rust-enumflags2" ,rust-enumflags2-0.7)
        ("rust-serde-repr" ,rust-serde-repr-0.1)
        ("rust-xdg-home" ,rust-xdg-home)
        ("rust-hex" ,rust-hex-0.4)
        ("rust-quick-xml" ,rust-quick-xml-0.27)
        ("rust-serde-xml-rs" ,rust-serde-xml-rs-0.4)
        ("rust-sha1" ,rust-sha1-0.10)
        ("rust-tokio-vsock" ,rust-tokio-vsock-0.3)
        ("rust-vsock" ,rust-vsock-0.3)
        ("rust-zbus-macros" ,rust-zbus-macros-3.13)
        ("rust-zbus-names" ,rust-zbus-names-2)
        ("rust-nix" ,rust-nix-0.26)
        ("rust-uds-windows" ,rust-uds-windows-1)
        ("rust-futures-core" ,rust-futures-core-0.3)
        ;;("rust-zvariant" ,rust-zvariant-3)
        )
       #:cargo-development-inputs
       (("rust-doc-comment" ,rust-doc-comment-0.3)
        ("rust-ntest" ,rust-ntest-0.9)
        ("rust-test-log" ,rust-test-log-0.2))))))

(define-public rust-async-process-1.7
  (package/inherit rust-async-process-1
    (name "rust-async-process")
    (version "1.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "async-process" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1jcra7vqidszfgy5c1v0d7xflm3qsh857r722999223yv6qji7bs"))))))

(define-public rust-ordered-stream-0.2
  (package/inherit rust-ordered-stream-0.1
    (name "rust-ordered-stream")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ordered-stream" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0l0xxp697q7wiix1gnfn66xsss7fdhfivl2k7bvpjs4i3lgb18ls"))))))

(define-public rust-async-fs-1.6
  (package/inherit rust-async-fs-1
    (name "rust-async-fs")
    (version "1.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "async-fs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01if2h77mry9cnm91ql2md595108i2c1bfy9gaivzvjfcl2gk717"))))))

(define-public rust-libc-0.2.145
  (package/inherit rust-libc-0.2
    (name "rust-libc")
    (version "0.2.145")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "10bazars21ky514f16njnd754372l07bav7gyjw64ml4zziwv1pw"))))))

(define-public rust-pure-rust-locales-0.6
  (package/inherit rust-pure-rust-locales-0.5
    (name "rust-pure-rust-locales")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pure-rust-locales" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ssj0ysdc8pj61wwc4kcyc9294w5j6ydbplfsw8h1fwf09ynv1ab"))))))

(define-public rust-rayon-core-1.11
  (package/inherit rust-rayon-core-1
    (name "rust-rayon-core")
    (version "1.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rayon-core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "13dymrhhdilzpbfh3aylv6ariayqdfk614b3frvwixb6d6yrb3sb"))))))

(define-public rust-rayon-1.7
  (package/inherit rust-rayon-1
    (name "rust-rayon")
    (version "1.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rayon" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0fzh8w5ds1qjhilll4rkpd3kimw70zi5605wprxcig1pdqczab8x"))))
    (arguments
     `(#:cargo-inputs
       (("rust-rayon-core" ,rust-rayon-core-1.11))))))

(define-public rust-chrono-0.4.28
  (package/inherit rust-chrono-0.4
    (name "rust-chrono")
    (version "0.4.28")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "chrono" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "03zybgrhna9jyraxvqyyhiq6yngjprsjc26qyvshixrj0vgj9vcm"))))
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-android-tzdata" ,rust-android-tzdata)
        ("rust-arbitrary" ,rust-arbitrary-1)
        ("rust-criterion" ,rust-criterion-0.4)
        ("rust-pure-rust-locales" ,rust-pure-rust-locales-0.6))
       #:cargo-development-inputs
       (("rust-doc-comment" ,rust-doc-comment-0.3)
        ("rust-windows-bindgen" ,rust-windows-bindgen))))))

(define-public rust-windows-metadata
  (package
    (name "rust-windows-metadata")
    (version "0.51.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows-metadata" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "03h0c6qs1yyl0z69p4k1hdq636j868qdxnri1dy47nprjvckacbm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rayon" ,rust-rayon-1.7))))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license license:gpl2+)))

(define-public rust-windows-bindgen
  (package
    (name "rust-windows-bindgen")
    (version "0.51.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows-bindgen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0xfdq4q958qal5iks8xkaanf7w3akzfxc58dxvz7amhjg2vic7xw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rayon" ,rust-rayon-1.7)
        ("rust-windows-metadata" ,rust-windows-metadata))))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license license:gpl2+)))

(define-public rust-android-tzdata
  (package
    (name "rust-android-tzdata")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "android-tzdata" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1w7ynjxrfs97xg3qlcdns4kgfpwcdv824g611fq32cag4cdr96g9"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license license:gpl2+)))

(define-public rust-xdg-home
  (package
    (name "rust-xdg-home")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "xdg-home" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kbd1ks8bvpsay6lgk60yaf1w13daaf75ghmslan031ss4y20s97"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license license:gpl2+)))

(define-public netavark
  (package
    (name "netavark")
    (version "1.7.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/containers/netavark")
             (commit (string-append "v" version))))
       (sha256
        (base32 "18m965y78k97rry9w2srp2z969k3br0pw75wagc990knqkrg4sva"))
       (file-name (git-file-name name version))))
    (build-system cargo-build-system)
    (arguments
     `(#:install-source? #f
       #:cargo-inputs
       (("rust-anyhow" ,rust-anyhow-1)
        ("rust-env-logger" ,rust-env-logger-0.10)
        ("rust-fs2" ,rust-fs2-0.4)
        ("rust-ipnet" ,rust-ipnet-2)
        ("rust-iptables" ,rust-iptables)
        ("rust-log" ,rust-log-0.4.20)
        ("rust-netlink-packet-core" ,rust-netlink-packet-core-0.5)
        ("rust-netlink-packet-route" ,rust-netlink-packet-route-0.15)
        ("rust-netlink-sys" ,rust-netlink-sys)
        ("rust-nispor" ,rust-nispor)
        ("rust-prost" ,rust-prost-0.11)
        ("rust-serde-value" ,rust-serde-value-0.7)
        ("rust-sha2" ,rust-sha2-0.10.7)
        ("rust-sysctl" ,rust-sysctl-0.5)
        ("rust-tokio" ,rust-tokio-1.29)
        ("rust-tokio-stream" ,rust-tokio-stream-0.1)
        ("rust-tonic" ,rust-tonic-0.9)
        ("rust-zbus" ,rust-zbus-3.13)
        ("rust-chrono" ,rust-chrono-0.4.28)
        ("rust-tonic-build" ,rust-tonic-build-0.8)
        ("rust-mozim" ,rust-mozim)
        ("rust-libc" ,rust-libc-0.2.145))))
    (native-inputs
     (list protobuf))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license license:gpl2+)))

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

(define-public podman-netavark
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
     (list netavark
           btrfs-progs
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
