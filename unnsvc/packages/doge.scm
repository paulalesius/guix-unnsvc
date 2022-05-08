(define-module (unnsvc packages doge)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix deprecation)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages dbm)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages file)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages upnp)
  #:use-module (srfi srfi-1))

(define-public dogecoin-core
  (package
    (name "dogecoin-core")
    (version "1.14.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dogecoin/dogecoin")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1bqnss4cp5qiir83al2rilnmsr6f1v9ywkwyjsci742101ks5afm"))))
    (native-inputs
     (list autoconf
           automake
           libtool
           pkg-config
           python
           util-linux
           protobuf
           qttools
           gettext-minimal
           zlib))
    (inputs
     (list bdb-5.3
           boost
           libevent
           openssl
           qtbase-5
           miniupnpc))
    (build-system gnu-build-system)
    (arguments
     `(#:configure-flags
       (list
        (string-append "--with-boost="
                       (assoc-ref %build-inputs "boost"))
        (string-append "ac_cv_path_LRELEASE="
                       (assoc-ref %build-inputs "qttools")
                       "/bin/lrelease")
        (string-append "ac_cv_path_LUPDATE="
                       (assoc-ref %build-inputs "qttools")
                       "/bin/lupdate")
       "--enable-static=no"
       "--disable-bench"
       "--disable-zmq")
       #:phases
       (modify-phases %standard-phases
         (add-before 'configure 'make-qt-deterministic
           (lambda _
             (setenv "QT_RCC_SOURCE_DATE_OVERRIDE" "1")
                #t))
         (add-before 'check 'set-home
           (lambda _
             ;; Test failing with permission denied because it creates files in $HOME
             ;;  what():  boost::filesystem::create_directories: Permission denied: "$HOME/homeless-shelter"
             (setenv "HOME" (getenv "TMPDIR"))
                #t)))))
    (home-page "https://dogecoin.com/")
    (synopsis "Dogecoin is an open source peer-to-peer digital currency")
    (description "Dogecoin is an open source peer-to-peer digital currency, favored by Shiba Inus worldwide.")
    (license license:expat)))

