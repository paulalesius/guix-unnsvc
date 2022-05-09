
(define-module (unnsvc packages xorg)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system python)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages aidc)
  #:use-module (gnu packages anthy)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages gperf)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages inkscape)
  #:use-module (gnu packages image)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages libbsd)
  #:use-module (gnu packages libedit)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages m4)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages onc-rpc)
  #:use-module (gnu packages pciutils)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages perl-check)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-compression)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages spice)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg))


(define-public xorg-server
  (package
    (name "xorg-server")
    (version "21.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://xorg.freedesktop.org/archive/individual"
                           "/xserver/xorg-server-" version ".tar.xz"))
       (sha256
        (base32
         "1rgbrld7spg7plkv3c3bbnlnszpflk5z1mqbjrmi2ymlnvasmmk1"))
       (patches
        (list
         ;; See:
         ;;   https://lists.fedoraproject.org/archives/list/devel@lists.
         ;;      fedoraproject.org/message/JU655YB7AM4OOEQ4MOMCRHJTYJ76VFOK/
         (origin
           (method url-fetch)
           (uri (string-append
                 "http://pkgs.fedoraproject.org/cgit/rpms/xorg-x11-server.git"
                 "/plain/06_use-intel-only-on-pre-gen4.diff"))
           (sha256
            (base32
             "0mm70y058r8s9y9jiv7q2myv0ycnaw3iqzm7d274410s0ik38w7q"))
           (file-name "xorg-server-use-intel-only-on-pre-gen4.diff"))))))
    (build-system gnu-build-system)
    (propagated-inputs
     ;; The following libraries are required by xorg-server.pc.
     (list libpciaccess libxcvt mesa pixman xorgproto))
    (inputs
     `(("udev" ,eudev)
       ("dbus" ,dbus)
       ("libdmx" ,libdmx)
       ("libepoxy" ,libepoxy)
       ("libgcrypt" ,libgcrypt)
       ("libxau" ,libxau)
       ("libxaw" ,libxaw)
       ("libxdmcp" ,libxdmcp)
       ("libxfixes" ,libxfixes)
       ("libxfont2" ,libxfont2)
       ("libxkbfile" ,libxkbfile)
       ("libxrender" ,libxrender)
       ("libxres" ,libxres)
       ("libxshmfence" ,libxshmfence)
       ("libxt" ,libxt)
       ("libxv" ,libxv)
       ("xkbcomp" ,xkbcomp)
       ("xkeyboard-config" ,xkeyboard-config)
       ("xtrans" ,xtrans)
       ("zlib" ,zlib)
       ;; Inputs for Xephyr
       ("xcb-util" ,xcb-util)
       ("xcb-util-image" ,xcb-util-image)
       ("xcb-util-keysyms" ,xcb-util-keysyms)
       ("xcb-util-renderutil" ,xcb-util-renderutil)
       ("xcb-util-wm" ,xcb-util-wm)))
    (native-inputs
     `(("python" ,python-wrapper)
       ("pkg-config" ,pkg-config)))
    (arguments
     `(#:configure-flags
       (list (string-append "--with-xkb-path="
                            (assoc-ref %build-inputs "xkeyboard-config")
                            "/share/X11/xkb")
             (string-append "--with-xkb-output="
                            "/tmp") ; FIXME: This is a bit doubtful; where should
                                        ; the compiled keyboard maps go?
             (string-append "--with-xkb-bin-directory="
                            (assoc-ref %build-inputs "xkbcomp")
                            "/bin")
             ;; By default, it ends up with invalid '${prefix}/...', causes:
             ;;   _FontTransOpen: Unable to Parse address ${prefix}/share/...
             ;; It's not used anyway, so set it to empty.
             "--with-default-font-path="

             ;; Enable the X security extensions (ssh -X).
             "--enable-xcsecurity"

             ;; The default is to use "uname -srm", which captures the kernel
             ;; version and makes builds non-reproducible.
             "--with-os-name=GNU"
             "--with-os-vendor=Guix"    ; not strictly needed, but looks nice

             ;; For the log file, etc.
             "--localstatedir=/var"
             ;; For sddm.
             "--enable-kdrive"
             "--enable-xephyr")
       #:phases
       (modify-phases %standard-phases
         (add-before 'configure 'pre-configure
           (lambda _
             (substitute* (find-files "." "\\.c$")
               (("/bin/sh") (which "sh")))

             ;; Don't try to 'mkdir /var'.
             (substitute* "hw/xfree86/Makefile.in"
               (("\\$\\(MKDIR_P\\).*logdir.*")
                "true\n"))

             ;; Strip timestamps that would otherwise end up in the 'Xorg'
             ;; binary.
             (substitute* "configure"
               (("^BUILD_DATE=.*$")
                "BUILD_DATE=19700101\n")
               (("^BUILD_TIME=.*$")
                "BUILD_TIME=000001\n")))))))
    (home-page "https://www.x.org/wiki/")
    (synopsis "Xorg implementation of the X Window System")
    (description
     "This package provides the Xorg X server itself.
The X server accepts requests from client programs to create windows, which
are (normally rectangular) 'virtual screens' that the client program can
draw into.

Windows are then composed on the actual screen by the X server (or by a
separate composite manager) as directed by the window manager, which usually
communicates with the user via graphical controls such as buttons and
draggable titlebars and borders.")
    (license license:x11)))

