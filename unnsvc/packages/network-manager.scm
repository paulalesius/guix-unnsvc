(define-module (unnsvc packages network-manager)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages aidc)
  #:use-module (gnu packages aspell)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages avahi)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages build-tools)
  #:use-module (gnu packages calendar)
  #:use-module (gnu packages cdrom)
  #:use-module (gnu packages check)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-graphics)
  #:use-module (gnu packages crates-gtk)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages cyrus-sasl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages dbm)
  #:use-module (gnu packages djvu)
  #:use-module (gnu packages dns)
  #:use-module (gnu packages docbook)
  #:use-module (gnu packages docker)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages enchant)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages file-systems)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages game-development)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages gimp)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages gnuzilla)
  #:use-module (gnu packages geo)
  #:use-module (gnu packages gperf)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages ibus)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages image)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages inkscape)
  #:use-module (gnu packages iso-codes)
  #:use-module (gnu packages kerberos)
  #:use-module (gnu packages language)
  #:use-module (gnu packages libcanberra)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages libunistring)
  #:use-module (gnu packages libunwind)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages lirc)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages mail)
  #:use-module (gnu packages man)
  #:use-module (gnu packages markup)
  #:use-module (gnu packages messaging)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages music)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages nettle)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages ninja)
  #:use-module (gnu packages node)
  #:use-module (gnu packages nss)
  #:use-module (gnu packages ocr)
  #:use-module (gnu packages openldap)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages password-utils)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages photo)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages polkit)
  #:use-module (gnu packages popt)
  #:use-module (gnu packages pretty-print)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages rdesktop)
  #:use-module (gnu packages rdf)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages rust)
  #:use-module (gnu packages samba)
  #:use-module (gnu packages scanner)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages search)
  #:use-module (gnu packages selinux)
  #:use-module (gnu packages slang)
  #:use-module (gnu packages speech)
  #:use-module (gnu packages spice)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages swig)
  #:use-module (gnu packages tex)
  #:use-module (gnu packages time)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages valgrind)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages virtualization)
  #:use-module (gnu packages vpn)
  #:use-module (gnu packages web)
  #:use-module (gnu packages webkit)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module (gnu artwork)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system glib-or-gtk)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system python)
  #:use-module (guix build-system trivial)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (ice-9 match)
  #:use-module (srfi srfi-1))

(define-public gnome-backgrounds
  (package
    (name "gnome-backgrounds")
    (version "42.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://gnome/sources/" name "/"
                           (version-major version) "/"
                           name "-" version ".tar.xz"))
       (sha256
        (base32
         "0p99q434c8qgj5wxcma9jj4dh1ff9x984ncs31vmz725kyhf2zsc"))))
    (build-system meson-build-system)
    (native-inputs (list gettext-minimal))
    (home-page "https://gitlab.gnome.org/GNOME/gnome-backgrounds")
    (synopsis "Background images for the GNOME desktop")
    (description
     "GNOME backgrounds package contains a collection of graphics files which
can be used as backgrounds in the GNOME Desktop environment.  Additionally,
the package creates the proper framework and directory structure so that you
can add your own files to the collection.")
    (license (list license:gpl2+
                   license:cc-by2.0
                   license:cc-by-sa2.0
                   license:cc-by-sa3.0))))

(define-public gsettings-desktop-schemas
  (package
    (name "gsettings-desktop-schemas")
    (version "42.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://gnome/sources/" name "/"
                           (version-major version)  "/"
                           name "-" version ".tar.xz"))
       (sha256
        (base32
         "1li3fcqwnw20f4j0i21i88fygm0hli8gmzkn4apgf8ynkrd371k6"))))
    (build-system meson-build-system)
    (arguments
     `(#:phases (modify-phases %standard-phases
                  (add-after 'unpack 'patch-schemas
                    (lambda* (#:key inputs #:allow-other-keys)
                      (substitute* (find-files "schemas"
                                               "\\.gschema\\.xml\\.in$")
                        ;; Provide the correct file name of the default
                        ;; GNOME background, 'adwaita-timed.xml'.
                        (("@datadir@/backgrounds/gnome")
                         (search-input-directory inputs
                                                 "/share/backgrounds/gnome"))
                        ;; Do not reference fonts, that may not exist.
                        (("'Source Code Pro 10'") "'Monospace 11'")))))))
    (inputs (list glib gnome-backgrounds))
    (native-inputs (list gettext-minimal
                         `(,glib "bin") ;glib-compile-schemas, etc.
                         gobject-introspection
                         pkg-config
                         python))  ;for build-aux/meson/post-install.py
    (home-page "https://launchpad.net/gsettings-desktop-schemas")
    (synopsis "GNOME settings for various desktop components")
    (description "Gsettings-desktop-schemas contains a collection of GSettings
schemas for settings shared by various components of the GNOME desktop.")
    (license license:lgpl2.1+)))

(define-public glib-networking
  (package
    (name "glib-networking")
    (version "2.72.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://gnome/sources/glib-networking/"
                                  (version-major+minor version) "/"
                                  "glib-networking-" version ".tar.xz"))
              (sha256
               (base32
                "0fw2w0rbk1x53fks6jbm9mg9sy0nnyv2591dwlfh91cj6sxsw2hh"))
              (patches
               (search-patches "glib-networking-gnutls-binding.patch"))))
    (build-system meson-build-system)
    (arguments
     (if (target-64bit?)
         '()
         (list #:phases
               #~(modify-phases %standard-phases
                   (add-after 'unpack 'work-around-32-bit-time-t
                     (lambda _
                       (invoke "patch" "--force" "-p1" "-i"
                               #$(local-file
                                  (search-patch
                                   "glib-networking-32-bit-time.patch")))))))))
    (native-inputs
     `(("pkg-config" ,pkg-config)
       ("gettext" ,gettext-minimal)))
    (inputs
     (list glib gnutls gsettings-desktop-schemas libproxy))
    (home-page "https://wiki.gnome.org/Projects/GLib")
    (synopsis "Network extensions for GLib")
    (description
     "Glib-networking contains the implementations of certain GLib networking
features that cannot be implemented directly in GLib itself because of their
dependencies.  Currently it contains GnuTLS and OpenSSL-based implementations of
GTlsBackend, a libproxy-based implementation of GProxyResolver,
GLibproxyResolver, and a GNOME GProxyResolver that uses the proxy information
from the GSettings schemas in gsettings-desktop-schemas.")
    (license license:lgpl2.1+)))

(define-public vala
  (package
    (name "vala")
    (version "0.56.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://gnome/sources/vala/"
                                  (version-major+minor version) "/"
                                  "vala-" version ".tar.xz"))
              (sha256
               (base32
                "1f8zv4js1kjh6v0a5d9wpnbcnqii6argkcw6yp6x30nszlfvh665"))))
    (build-system glib-or-gtk-build-system)
    (arguments
     '(#:configure-flags '("--enable-coverage")
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-docbook-xml
           (lambda* (#:key inputs #:allow-other-keys)
             (with-directory-excursion "doc/manual"
               (substitute* '("manual.xml" "version.xml.in")
                 (("http://www.oasis-open.org/docbook/xml/4.4/")
                  (string-append (assoc-ref inputs "docbook-xml")
                                 "/xml/dtd/docbook/"))))))
         (add-before 'check 'pre-check
           (lambda _
             (setenv "CC" "gcc")
             (substitute* "valadoc/tests/libvaladoc\
/tests-extra-environment.sh"
               (("export PKG_CONFIG_PATH=" m)
                (string-append m "$PKG_CONFIG_PATH:"))))))))
    (native-inputs
     `(("bison" ,bison)
       ("dbus" ,dbus)                   ; for dbus tests
       ("docbook-xml" ,docbook-xml-4.4)
       ("docbook-xsl" ,docbook-xsl)
       ("flex" ,flex)
       ("gobject-introspection" ,gobject-introspection) ; for gir tests
       ("help2man" ,help2man)
       ("perl" ,perl)
       ("pkg-config" ,pkg-config)
       ("xsltproc" ,libxslt)))
    (propagated-inputs
     `(("glib" ,glib)                   ; required by libvala-0.40.pc
       ("libgvc" ,graphviz)))
    (home-page "https://wiki.gnome.org/Projects/Vala/")
    (synopsis "Compiler using the GObject type system")
    (description "Vala is a programming language using modern high level
abstractions without imposing additional runtime requirements and without using
a different ABI compared to applications and libraries written in C.  Vala uses
the GObject type system and has additional code generation routines that make
targeting the GNOME stack simple.")
    (license license:lgpl2.1+)))

(define-public libsoup-minimal
  (package
    (name "libsoup-minimal")
    (version "3.0.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://gnome/sources/libsoup/"
                                  (version-major+minor version) "/"
                                  "libsoup-" version ".tar.xz"))
              (sha256
               (base32
                "19ixq8m51myq78f40mxr79zgawpn7r78aigx8nxzkb5r83w5jpdl"))))
    (build-system meson-build-system)
    (arguments
     `(#:configure-flags '("-Dgtk_doc=false")
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'adjust-tests
           (lambda _
             ;; This test fails due to missing /etc/nsswitch.conf
             ;; in the build environment.
             (substitute* "tests/socket-test.c"
               ((".*/sockets/unconnected.*") ""))

             ;; These fail because "subdomain.localhost" does not resolve in
             ;; the build environment.  Moreover, the hsts-test suite fails on
             ;; i686-linux because of errors from `session_get_uri' like
             ;; "Unexpected status 200 OK (expected 301 Moved Permanently)"
             ;; (see: https://gitlab.gnome.org/GNOME/libsoup/-/issues/239).
             (substitute* "tests/meson.build"
               ((".*'name': 'hsts'.*") ""))
             (substitute* "tests/hsts-db-test.c"
               ((".*/hsts-db/subdomains.*") "")))))))
    (native-inputs
     (list `(,glib "bin") ;for glib-mkenums
           gobject-introspection
           intltool
           pkg-config
           python-wrapper
           vala
           curl
           gnutls ;for 'certtool'
           httpd))
    (propagated-inputs
     ;; libsoup-3.0.pc refers to all of these (except where otherwise noted)
     (list brotli
           glib
           glib-networking ; for GIO runtime modules
           libpsl
           nghttp2 ;for pkg-config
           `(,nghttp2 "lib")
           libxml2
           sqlite
           zlib))
    (inputs
     (list mit-krb5 samba/fixed))     ; For ntlm_auth support
    (home-page "https://wiki.gnome.org/Projects/libsoup")
    (synopsis "GLib-based HTTP Library")
    (description
     "LibSoup is an HTTP client/server library for GNOME.  It uses GObjects
and the GLib main loop, to integrate well with GNOME applications.")
    (license license:lgpl2.0+)))

(define-public libsoup
  (package/inherit libsoup-minimal
    (name "libsoup")
    (outputs (cons "doc" (package-outputs libsoup-minimal)))
    (arguments
     (substitute-keyword-arguments (package-arguments libsoup-minimal)
       ((#:configure-flags configure-flags)
        `(cons "-Dgtk_doc=true"
               (delete "-Dgtk_doc=false" ,configure-flags)))
       ((#:phases phases)
        `(modify-phases ,phases
           (add-after 'unpack 'patch-docbook-xml
             (lambda* (#:key inputs #:allow-other-keys)
               (let ((xmldoc (string-append (assoc-ref inputs "docbook-xml")
                                            "/xml/dtd/docbook")))
                 (substitute* (find-files "docs/reference")
                   (("http://.*/docbookx\\.dtd")
                    (string-append xmldoc "/docbookx.dtd"))))))
           (add-after 'install 'move-doc
             (lambda* (#:key outputs #:allow-other-keys)
               (let ((out (assoc-ref outputs "out"))
                     (doc (assoc-ref outputs "doc")))
                 (mkdir-p (string-append doc "/share"))
                 (copy-recursively (string-append out "/share/gtk-doc")
                                   (string-append doc "/share/gtk-doc"))
                 (delete-file-recursively
                  (string-append out "/share/gtk-doc")))))))))
    (native-inputs (modify-inputs (package-native-inputs libsoup-minimal)
                     (prepend docbook-xml-4.1.2 gtk-doc)))))

(define-public libgudev
  (package
    (name "libgudev")
    (version "237")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://gnome/sources/" name "/"
                                  version "/" name "-" version ".tar.xz"))
              (sha256
               (base32
                "1al6nr492nzbm8ql02xhzwci2kwb1advnkaky3j9636jf08v41hd"))))
    (build-system meson-build-system)
    (native-inputs
     `(("glib:bin" ,glib "bin") ; for glib-genmarshal, etc.
       ("gobject-introspection" ,gobject-introspection)
       ("pkg-config" ,pkg-config)))
    (propagated-inputs
     (list glib ; in Requires of gudev-1.0.pc
           eudev))               ; in Requires.private of gudev-1.0.pc
    (inputs
     `(("udev" ,eudev)))
    (home-page "https://wiki.gnome.org/Projects/libgudev")
    (synopsis "GObject bindings for libudev")
    (description
     "This library provides GObject bindings for libudev.  It was originally
part of udev-extras, then udev, then systemd.  It's now a project on its own.")
    (license license:lgpl2.1+)))

(define-public ell
  (package
    (name "ell")
    (version "0.50")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.kernel.org/pub/scm/libs/ell/ell.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0p8rssgmbhz9105jwxj1ql2i7av3xy38qibzn92kaaj0z89in01d"))))
    (build-system gnu-build-system)
    (arguments
     ;; Tests launch dbus-daemon instances that all try to bind to
     ;; "/tmp/ell-test-bus".  Thus, we need to run them sequentially.
     '(#:parallel-tests? #f))
    (inputs
     (list dbus))
    (native-inputs
     (list autoconf automake libtool pkg-config))
    (home-page "https://01.org/ell")
    (synopsis "Embedded Linux Library")
    (description "The Embedded Linux* Library (ELL) provides core, low-level
functionality for system daemons.  It typically has no dependencies other than
the Linux kernel, C standard library, and libdl (for dynamic linking).  While
ELL is designed to be efficient and compact enough for use on embedded Linux
platforms, it is not limited to resource-constrained systems.")
    (license license:lgpl2.1+)))

(define-public iwd
  (package
    (name "iwd")
    (version "1.27")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.kernel.org/pub/scm/network/wireless/iwd.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1859hmbfd35m935bcbzgkwxrqay3z48iqp1qbi0kdkis4zs7xpw0"))))
    (build-system gnu-build-system)
    (inputs
     (list dbus ell (package-source ell) readline))
    (native-inputs
     (list autoconf
           automake
           libtool
           pkg-config
           python
           python-docutils
           openssl))
    (arguments
     `(#:configure-flags
       ,#~(list "--disable-systemd-service"
                "--enable-external-ell"
                "--enable-hwsim"
                "--enable-tools"
                "--enable-wired"
                "--localstatedir=/var"
                (string-append "--with-dbus-datadir=" #$output "/share/")
                (string-append "--with-dbus-busdir="
                               #$output "/share/dbus-1/system-services"))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'copy-ell-header-files
           ;; Copy into the source tree two of ell's private header files that
           ;; it shares with iwd, as is required to build with the
           ;; "--enable-external-ell" configure option.
           ;; See the definition of "ell_shared" in iwd's Makefile.am.
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((ell-header-dir (search-input-directory inputs "/ell"))
                   (target-dir "ell"))
               (mkdir target-dir)
               (for-each
                (lambda (file-name)
                  (copy-file (string-append ell-header-dir "/" file-name)
                             (string-append target-dir "/" file-name)))
                '("asn1-private.h" "useful.h")))))
         (add-after 'configure 'patch-Makefile
           (lambda _
             (substitute* "Makefile"
               ;; Don't try to 'mkdir /var'.
               (("\\$\\(MKDIR_P\\) -m 700") "true")))))))
    (home-page "https://git.kernel.org/pub/scm/network/wireless/iwd.git/")
    (synopsis "Internet Wireless Daemon")
    (description "iwd is a wireless daemon for Linux that aims to replace WPA
Supplicant.  It optimizes resource utilization by not depending on any external
libraries and instead utilizing features provided by the Linux kernel to the
maximum extent possible.")
    (license license:lgpl2.1+)))

(define-public network-manager
  (package
    (name "network-manager")
    (version "1.38.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://gnome/sources/NetworkManager/"
                                  (version-major+minor version) "/"
                                  "NetworkManager-" version ".tar.xz"))
              (patches (search-patches ;;"network-manager-plugin-path.patch"
                                       "network-manager-meson.patch"))
              (sha256
               (base32
                "1vxjc9h1adafl90ha2ww4pb50v5fb180yz5nhxkq3c7yvl3wz942"))))
    (build-system meson-build-system)
    (outputs '("out"
               "doc"))                  ; 8 MiB of gtk-doc HTML
    (arguments
     `(#:configure-flags
       (let ((out      (assoc-ref %outputs "out"))
             (dhclient (search-input-file %build-inputs "/sbin/dhclient")))
         (list
          ;; Otherwise, the RUNPATH will lack the final 'NetworkManager' path
          ;; component.
          (string-append "-Dc_link_args=-Wl,-rpath="
                         out "/lib:"
                         out "/lib/NetworkManager/" ,version)
          "-Dsystemd_journal=false"
          "-Dsession_tracking=elogind"
          "-Dsuspend_resume=elogind"
          "-Dsystemdsystemunitdir=no"
          "-Dsession_tracking_consolekit=false"
          "-Ddhcpcd=no"
          "-Ddhcpcanon=no"
          "-Dcrypto=gnutls"
          "-Diwd=true"
          "-Dlibaudit=yes"
          "-Dqt=false"
          "-Ddocs=true"
          "--sysconfdir=/etc"
          "--localstatedir=/var"
          (string-append "-Dudev_dir="
                         out "/lib/udev")
          (string-append "-Ddbus_conf_dir="
                         out "/etc/dbus-1/system.d")

          (string-append "-Ddhclient=" dhclient)))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-dlopen-call-to-libjansson.so
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "src/libnm-glib-aux/nm-json-aux.c"
               (("(handle = dlopen\\()soname" _ head)
                (string-append
                 head "\"" (search-input-file inputs
                                              "lib/libjansson.so") "\"")))))
         (add-before 'configure 'pre-configure
           (lambda _
             ;; These tests try to test aspects of network-manager's
             ;; functionality within restricted containers, but they don't
             ;; cope with being already in the Guix build jail as that jail
             ;; lacks some features that they would like to proxy over (like
             ;; a /sys mount).
             (substitute* "src/core/tests/meson.build"
               ((".*test-l3cfg.*") ""))
             (substitute* "src/core/devices/tests/meson.build"
               ((".*test-acd.*") "")
               ((".*test-lldp.*") ""))
             (substitute* "src/core/platform/tests/meson.build"
               ((".*test-address-linux.*") "")
               ((".*test-cleanup-linux.*") "")
               ((".*test-link-linux.*") "")
               ((".*test-lldp.*") "")
               ((".*test-route-linux.*") "")
               ((".*test-tc-linux.*") ""))))
         (add-after 'unpack 'patch-docbook-xml
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((xmldoc (string-append (assoc-ref inputs "docbook-xml")
                                          "/xml/dtd/docbook")))
               (substitute* (find-files "." ".*\\.(xsl|xml)")
                 (("http://.*/docbookx\\.dtd")
                  (string-append xmldoc "/docbookx.dtd"))))))
         (add-before 'check 'pre-check
           (lambda _
             ;; For the missing /etc/machine-id.
             (setenv "DBUS_FATAL_WARNINGS" "0")))
         (add-before 'install 'no-polkit-magic
           ;; Meson ‘magically’ invokes pkexec, which fails (not setuid).
           (lambda _
             (setenv "PKEXEC_UID" "something")))
         (add-after 'install 'move-doc
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out"))
                   (doc (assoc-ref outputs "doc")))
               (mkdir-p (string-append doc "/share"))
               (for-each (lambda (directory)
                           (copy-recursively (string-append out directory)
                                             (string-append doc directory))
                           (delete-file-recursively
                            (string-append out directory)))
                         '("/share/doc" "/share/gtk-doc"))))))))
    (propagated-inputs
     (list glib))
    (native-inputs
     `(("glib:bin" ,glib "bin")         ; for gdbus-codegen
       ("gtk-doc" ,gtk-doc/stable)
       ("gobject-introspection" ,gobject-introspection)
       ("docbook-xml" ,docbook-xml)
       ("docbook-xsl" ,docbook-xsl)
       ("intltool" ,intltool)
       ("libxslt" ,libxslt)
       ("libxml2" ,libxml2)
       ("pkg-config" ,pkg-config)
       ("vala" ,vala)
       ;; For testing.
       ("python" ,python-wrapper)
       ("python-dbus" ,python-dbus)
       ("python-pygobject" ,python-pygobject)))
    (inputs
     `(("curl" ,curl)
       ("cyrus-sasl" ,cyrus-sasl)
       ("dbus-glib" ,dbus-glib)
       ("dnsmasq" ,dnsmasq)
       ("eudev" ,eudev)
       ("gnutls" ,gnutls)
       ("iptables" ,iptables)
       ("isc-dhcp" ,isc-dhcp)
       ("iwd" ,iwd)                     ; wpa_supplicant alternative
       ("jansson" ,jansson)
       ("libaudit" ,audit)
       ("libgcrypt" ,libgcrypt)
       ("libgudev" ,libgudev)
       ("libndp" ,libndp)
       ("libnl" ,libnl)
       ("libselinux" ,libselinux)
       ("libsoup" ,libsoup)
       ("mobile-broadband-provider-info" ,mobile-broadband-provider-info)
       ("modem-manager" ,modem-manager)
       ("newt" ,newt)                   ;for the 'nmtui' console interface
       ("openresolv" ,openresolv)       ; alternative resolv.conf manager
       ("polkit" ,polkit)
       ("ppp" ,ppp)
       ("readline" ,readline)
       ("util-linux" ,util-linux)
       ("elogind" ,elogind)))
    (synopsis "Network connection manager")
    (home-page "https://wiki.gnome.org/Projects/NetworkManager")
    (description
     "NetworkManager is a system network service that manages your network
devices and connections, attempting to keep active network connectivity when
available.  It manages ethernet, WiFi, mobile broadband (WWAN), and PPPoE
devices, and provides VPN integration with a variety of different VPN
services.")
    ;; “This NetworkManager project consists of the daemon, client tools, and
    ;; libnm. libnm is licensed LGPL-2.1+, while the rest is licensed under
    ;; GPL-2.0+.”
    (license (list license:gpl2+
                   license:lgpl2.1+))
    (properties '((upstream-name . "NetworkManager")))))

(define-public mobile-broadband-provider-info
  (package
    (name "mobile-broadband-provider-info")
    (version "20220511")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://gnome/sources/"
                    "mobile-broadband-provider-info/" version "/"
                    "mobile-broadband-provider-info-" version ".tar.xz"))
              (sha256
               (base32
                "0x57n850sfww1b7bh98413j78vm8mwy85qn36ac3bw31cs43xybm"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("xsltproc" ,libxslt)))
    (arguments
     `(#:tests? #f))                    ; no tests
    (home-page "https://wiki.gnome.org/Projects/NetworkManager")
    (synopsis "Database of broadband connection configuration")
    (description "Database of broadband connection configuration.")
    (license license:public-domain)))

network-manager
