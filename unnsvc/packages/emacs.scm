(define-module (unnsvc packages emacs)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages mail)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages selinux)
  #:use-module (gnu packages acl)
  #:use-module (gnu packages web)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages suckless)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages tree-sitter)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system)
  #:use-module (guix build-system emacs)
  #:use-module (guix build-system gnu)

  )


(define-public emacs-custom
  (package/inherit emacs
    (name "emacs-custom")
    (build-system gnu-build-system)
    (inputs (modify-inputs (package-inputs emacs)
              (delete "libx11" "gtk+" "libxft" "libtiff" "giflib" "libjpeg"
                      "imagemagick" "libpng" "librsvg" "libxpm" "libice"
                      "libsm" "cairo" "pango" "harfbuzz"
                      ;; These depend on libx11, so remove them as well.
                      "libotf" "m17n-lib" "dbus"
                      "gpm" "lcms" "alsa-lib" "libselinux")
              (prepend inotify-tools)))
    (arguments
     (substitute-keyword-arguments (package-arguments emacs)
       ((#:configure-flags flags #~'())
        #~(list "--with-modules"
                "--with-native-compilation"
                "--without-x"
                "--with-x-toolkit=no"
                "--without-selinux"
                "--without-sound"
                "--without-lcms2"
                "CFLAGS=-march=native -mtune=native -pipe -O2 -fomit-frame-pointer"))
       ((#:modules _) (%emacs-modules build-system))
       ((#:phases phases)
        #~(modify-phases #$phases
           (delete 'restore-emacs-pdmp)
           (delete 'strip-double-wrap)))))))

;; See emacs-next-tree-sitter
;; (define-public emacs-29-custom
;;   (package/inherit emacs-custom
;;     (name "emacs-29-custom")
;;     (version "29.1")
;;     (inputs (modify-inputs (package-inputs emacs-custom)
;;                 (prepend sqlite tree-sitter)))
;;     (arguments
;;      (substitute-keyword-arguments (package-arguments emacs-custom)
;;         ((#:configure-flags flags #~'())
;;          #~(cons* "--with-tree-sitter" #$flags))))))

(define (%emacs-modules build-system)
  (let ((which (build-system-name build-system)))
    `((guix build ,(symbol-append which '-build-system))
      (guix build utils)
      (srfi srfi-1)
      (ice-9 ftw))))

;; (define-public emacs-old-custom
;;   (package
;;     (name "emacs-old")
;;     (version "29.1")
;;     (source (origin
;;               (method url-fetch)
;;               (uri (string-append "mirror://gnu/emacs/emacs-"
;;                                   version ".tar.xz"))
;;               (sha256
;;                (base32
;;                 "009f7q08vg919b90k2jrsznq73s3n224avz80dd2y7i3rjjq3y6j"))
;;               (patches (search-patches "emacs-exec-path.patch"
;;                                        "emacs-fix-scheme-indent-function.patch"
;;                                        ;; Does not apply to emacs 29.1 "emacs-source-date-epoch.patch"
;;                                        ))
;;               (modules '((guix build utils)))
;;               (snippet
;;                '(with-directory-excursion "lisp"
;;                   ;; Delete the bundled byte-compiled elisp files and generated
;;                   ;; autoloads.
;;                   (for-each delete-file
;;                             (append (find-files "." "\\.elc$")
;;                                     (find-files "." "loaddefs\\.el$")
;;                                     (find-files "eshell" "^esh-groups\\.el$")))

;;                   ;; Make sure Tramp looks for binaries in the right places on
;;                   ;; remote Guix System machines, where 'getconf PATH' returns
;;                   ;; something bogus.
;;                   (substitute* "net/tramp.el"
;;                     ;; Patch the line after "(defcustom tramp-remote-path".
;;                     (("\\(tramp-default-remote-path")
;;                      (format #f "(tramp-default-remote-path ~s ~s ~s ~s "
;;                              "~/.guix-profile/bin" "~/.guix-profile/sbin"
;;                              "/run/current-system/profile/bin"
;;                              "/run/current-system/profile/sbin")))

;;                   ;; Make sure Man looks for C header files in the right
;;                   ;; places.
;;                   (substitute* "man.el"
;;                     (("\"/usr/local/include\"" line)
;;                      (string-join
;;                       (list line
;;                             "\"~/.guix-profile/include\""
;;                             "\"/var/guix/profiles/system/profile/include\"")
;;                       " ")))))))
;;     (build-system glib-or-gtk-build-system)
;;     (arguments
;;      (list
;;       #:tests? #f                      ; no check target
;;       #:modules (%emacs-modules build-system)
;;       #:configure-flags
;;       #~(list "--with-modules"
;;                                 "--with-native-compilation=no"
;; 				"--with-sound=no"
;; 				"--with-x-toolkit=no"
;; 				"--without-x"
;; 				"--without-cairo"
;; 				;;"--without-libsystemd" - configured for elogind
;; 				"--without-lcms2"
;; 				"--without-gpm"
;; 				"--without-selinux"
;; 				"--with-tree-sitter"
;;                                 ;;"--disable-build-details"
;; 				"CFLAGS=-march=native -mtune=native -pipe -O2 -fomit-frame-pointer")
;;       #:make-flags #~(list
;; 		       "NATIVE_FULL_AOT=0")
;;       #:phases
;;       #~(modify-phases %standard-phases
;;           (add-after 'set-paths 'set-libgccjit-path
;;             (lambda* (#:key inputs #:allow-other-keys)
;;               (define (first-subdirectory/absolute directory)
;;                 (let ((files (scandir
;;                               directory
;;                               (lambda (file)
;;                                 (and (not (member file '("." "..")))
;;                                      (file-is-directory? (string-append
;;                                                           directory "/"
;;                                                           file)))))))
;;                   (and (not (null? files))
;;                        (string-append directory "/" (car files)))))
;;               (let* ((libgccjit-libdir
;;                       (first-subdirectory/absolute ;; version
;;                        (first-subdirectory/absolute ;; host type
;;                         (search-input-directory inputs "lib/gcc")))))
;;                 (setenv "LIBRARY_PATH"
;;                         (string-append (getenv "LIBRARY_PATH")
;;                                        ":" libgccjit-libdir)))))
;;           (add-after 'unpack 'enable-elogind
;;             (lambda _
;;               (substitute* "configure.ac"
;;                 (("libsystemd") "libelogind"))
;;               (when (file-exists? "configure")
;;                 (delete-file "configure"))))
;;           (add-after 'unpack 'patch-program-file-names
;;             (lambda* (#:key inputs #:allow-other-keys)
;;               (substitute* '("src/callproc.c"
;;                              "lisp/term.el"
;;                              "lisp/htmlfontify.el"
;;                              "lisp/textmodes/artist.el"
;;                              "lisp/progmodes/sh-script.el")
;;                 (("\"/bin/sh\"")
;;                  (format #f "~s" (search-input-file inputs "/bin/sh"))))
;;               (substitute* "lisp/doc-view.el"
;;                 (("\"(gs|dvipdf|ps2pdf|pdftotext)\"" all what)
;;                  (let ((replacement (false-if-exception
;;                                      (search-input-file
;;                                       inputs
;;                                       (string-append "/bin/" what)))))
;;                    (if replacement
;;                        (string-append "\"" replacement "\"")
;;                        all))))
;;               ;; match ".gvfs-fuse-daemon-real" and ".gvfsd-fuse-real"
;;               ;; respectively when looking for GVFS processes.
;;               (substitute* "lisp/net/tramp-gvfs.el"
;;                 (("\\(tramp-compat-process-running-p \"(.*)\"\\)" all process)
;;                  (format #f "(or ~a (tramp-compat-process-running-p ~s))"
;;                          all (string-append "." process "-real"))))))
;;           (add-after 'unpack 'patch-compilation-driver
;;             (lambda _
;;               (substitute* "lisp/emacs-lisp/comp.el"
;;                 (("\\(defcustom native-comp-driver-options nil")
;;                  (format
;;                   #f "(defcustom native-comp-driver-options '(~@{~s~^ ~})"
;;                   (string-append
;;                    "-B" #$(this-package-input "binutils") "/bin/")
;;                   (string-append
;;                    "-B" #$(this-package-input "glibc") "/lib/")
;;                   (string-append
;;                    "-B" #$(this-package-input "libgccjit") "/lib/")
;;                   (string-append
;;                    "-B" #$(this-package-input "libgccjit") "/lib/gcc/"))))))
;;           (add-before 'configure 'fix-/bin/pwd
;;             (lambda _
;;               ;; Use `pwd', not `/bin/pwd'.
;;               (substitute* (find-files "." "^Makefile\\.in$")
;;                 (("/bin/pwd")
;;                  "pwd"))))
;;           (add-after 'install 'install-site-start
;;             ;; Use 'guix-emacs' in "site-start.el", which is used autoload the
;;             ;; Elisp packages found in EMACSLOADPATH.
;;             (lambda* (#:key inputs outputs #:allow-other-keys)
;;               (let* ((out      (assoc-ref outputs "out"))
;;                      (lisp-dir (string-append out "/share/emacs/site-lisp"))
;;                      (emacs    (string-append out "/bin/emacs")))

;;                 ;; This is duplicated from emacs-utils to prevent coupling.
;;                 (define* (emacs-byte-compile-directory dir)
;;                   (let ((expr `(progn
;;                                 (setq byte-compile-debug t)
;;                                 (byte-recompile-directory
;;                                  (file-name-as-directory ,dir) 0 1))))
;;                     (invoke emacs "--quick" "--batch"
;;                             (format #f "--eval=~s" expr))))

;;                 (copy-file #$(local-file
;;                               (search-auxiliary-file "emacs/guix-emacs.el"))
;;                            (string-append lisp-dir "/guix-emacs.el"))
;;                 (with-output-to-file (string-append lisp-dir "/site-start.el")
;;                   (lambda ()
;;                     (display
;;                      (string-append
;;                       "(when (require 'guix-emacs nil t)\n"
;;                       "  (guix-emacs-autoload-packages)\n"
;;                       "  (advice-add 'package-load-all-descriptors"
;;                       " :after #'guix-emacs-load-package-descriptors))"))))
;;                 ;; Remove the extraneous subdirs.el file, as it causes Emacs to
;;                 ;; add recursively all the the sub-directories of a profile's
;;                 ;; share/emacs/site-lisp union when added to EMACSLOADPATH,
;;                 ;; which leads to conflicts.
;;                 (delete-file (string-append lisp-dir "/subdirs.el"))
;;                 ;; Byte compile the site-start files.
;;                 (emacs-byte-compile-directory lisp-dir))))
;; 	  (add-after 'glib-or-gtk-wrap 'restore-emacs-pdump
;; 		     (lambda* (#:key outputs target #:allow-other-keys)
;; 			      (let* ((libexec (string-append (assoc-ref outputs "out")
;; 							     "/libexec"))
;; 				     (pdmp (find-files libexec "\\.pdmp$"))
;; 				     (pdmp-real (find-files libexec "\\.pdmp-real$")))
;; 				(for-each rename-file pdmp-real pdmp))))
;; ;;  	  (add-after 'glib-or-gtk-wrap 'strip-double-wrap
;; ;;		     (lambda* (#:key outputs #:allow-other-keys)
;; ;;			      (with-directory-excursion (assoc-ref outputs "out")
;; ;;				(copy-file
;; ;;				  (car (find-files "bin" "^emacs-([0-9]+\\.)+[0-9]+$"))
;; ;;				  "bin/emacs"))))
;;           (add-after 'strip-double-wrap 'wrap-emacs-paths
;;             (lambda* (#:key inputs outputs #:allow-other-keys)
;;               (let* ((out (assoc-ref outputs "out"))
;;                      (lisp-dirs (find-files (string-append out "/share/emacs")
;;                                             "^lisp$"
;;                                             #:directories? #t)))
;;                 (for-each
;;                  (lambda (prog)
;;                    (wrap-program prog
;;                      ;; emacs-next and variants rely on uname being in PATH for
;;                      ;; Tramp.  Tramp paths can't be hardcoded, because they
;;                      ;; need to be portable.
;;                      `("PATH" suffix
;;                        ,(map dirname
;;                              (list (search-input-file inputs "/bin/gzip")
;;                                    ;; for coreutils
;;                                    (search-input-file inputs "/bin/yes"))))
;;                      `("EMACSLOADPATH" suffix ,lisp-dirs)))
;;                  (find-files (string-append out "/bin")
;;                              ;; Matches versioned and unversioned emacs binaries.
;;                              ;; We don't patch emacsclient, because it takes its
;;                              ;; environment variables from emacs.
;;                              ;; Likewise, we don't need to patch helper binaries
;;                              ;; like etags, ctags or ebrowse.
;;                              "^emacs(-[0-9]+(\\.[0-9]+)*)?$"))))))))
;;     (inputs
;;      (list gnutls
;;            ncurses

;;            ;; To "unshadow" ld-wrapper in native builds
;;            (make-ld-wrapper "ld-wrapper" #:binutils binutils)

;;            ;; For native compilation
;;            binutils
;;            (libc-for-target)
;;            libgccjit

;;            ;; Required for "core" functionality, such as dired and compression.
;;            coreutils
;;            gzip

;;            ;; Avoid Emacs's limited movemail substitute that retrieves POP3
;;            ;; email only via insecure channels.
;;            ;; This is not needed for (modern) IMAP.
;;            mailutils

;;            ;;gpm
;;            ;;libx11
;;            ;;gtk+
;;            ;;cairo
;;            ;;pango
;;            ;;harfbuzz
;;            ;;libxft
;;            ;;libtiff
;;            ;;giflib
;;            ;;lcms
;;            ;;libjpeg-turbo
;;            ;;libselinux
;;            acl
;;            jansson
;;            gmp
;;            ghostscript
;;            poppler
;;            elogind
;; 	   inotify-tools

;;            ;; When looking for libpng `configure' links with `-lpng -lz', so we
;;            ;; must also provide zlib as an input.
;;            libpng
;;            zlib
;;            (librsvg-for-system)
;;            ;;libxpm
;;            libxml2
;;            ;;libice
;;            ;;libsm
;;            ;;alsa-lib
;;            dbus

;;            ;; multilingualization support
;;            ;;libotf
;;            ;;m17n-lib

;; 	   tree-sitter
;; 	   sqlite))
;;     (native-inputs
;;      (list autoconf pkg-config texinfo))
;;     (native-search-paths
;;      (list (search-path-specification
;;             (variable "EMACSLOADPATH")
;;             (files '("share/emacs/site-lisp")))
;;            (search-path-specification
;;             (variable "EMACSNATIVELOADPATH")
;;             (files '("lib/emacs/native-site-lisp")))
;;            (search-path-specification
;;             (variable "INFOPATH")
;;             (files '("share/info")))
;;            ;; tree-sitter support is not yet available in emacs 28, but this
;;            ;; search path won't harm and also will be beneficial for
;;            ;; emacs-next and other emacs-* packages, which have tree-sitter
;;            ;; support enabled.  Please, remove this comment, when emacs
;;            ;; package is updated to 29.
;;            (search-path-specification
;;             (variable "TREE_SITTER_GRAMMAR_PATH")
;;             (files '("lib/tree-sitter")))))

;;     (home-page "https://www.gnu.org/software/emacs/")
;;     (synopsis "The extensible, customizable, self-documenting text editor")
;;     (description
;;      "GNU Emacs is an extensible and highly customizable text editor.  It is
;; based on an Emacs Lisp interpreter with extensions for text editing.  Emacs
;; has been extended in essentially all areas of computing, giving rise to a
;; vast array of packages supporting, e.g., email, IRC and XMPP messaging,
;; spreadsheets, remote server editing, and much more.  Emacs includes extensive
;; documentation on all aspects of the system, from basic editing to writing
;; large Lisp programs.  It has full Unicode support for nearly all human
;; languages.")
;;     (license license:gpl3+)))


;; (define-public emacs-exwm-managed
;;   (package
;;     (inherit emacs-exwm)
;;     (name "emacs-exwm-managed")
;;     (propagated-inputs
;;      (list
;;            emacs-xelb           ;; ??
;;            emacs                ;; emacs we'll use
;;            emacs-pdf-tools      ;; Requires special building procedure and OS integration
;;            ;;emacs-guix
;;            ;;slock                ;; screen lock
;;            ;;xss-lock
;;            ;;xset                 ;; DPMS
;;            xclip                ;; EXWM clipboard
;;            ))
;;     (inputs
;;      (list xhost dbus))
;;     (arguments
;;      ;; Use (substitute-keyword-arguments (package-arguments emacs)) to replace selectively
;;      ;; EXWM does not work with emacs-pgtk-native-comp, use emacs-native-comp
;;      `(#:emacs ,emacs
;;        #:phases
;;        (modify-phases %standard-phases
;;          (add-after 'build 'install-xsession
;;            (lambda* (#:key inputs outputs #:allow-other-keys)
;;              (let* ((out (assoc-ref outputs "out"))
;;                     (xsessions (string-append out "/share/xsessions"))
;;                     (bin (string-append out "/bin"))
;;                     (exwm-executable (string-append bin "/exwm-managed")))
;;                ;; Add a .desktop file to xsessions
;;                (mkdir-p xsessions)
;;                (mkdir-p bin)
;;                (make-desktop-entry-file
;;                 (string-append xsessions "/exwm-managed.desktop")
;;                 #:name ,name
;;                 #:exec exwm-executable
;;                 #:try-exec exwm-executable)
;;                ;; Add a shell wrapper to bin
;;                (with-output-to-file exwm-executable
;;                  (lambda _
;;                    (format #t
;;                     "#!~a ~@
;; ~a +SI:localuser:$USER ~@
;; exec ~a --exit-with-session ~a --no-site-file -fs \"$@\" --eval '~s' ~%"
;;                            (search-input-file inputs "/bin/sh")
;;                            (search-input-file inputs "/bin/xhost")
;;                            (search-input-file inputs "/bin/dbus-launch")
;;                            (search-input-file inputs "/bin/emacs")
;;                            '(cond
;;                              ((file-exists-p "~/.exwm")
;;                               (load-file "~/.exwm"))
;;                              ((not (featurep 'exwm))
;;                               (require 'exwm)
;;                               (require 'exwm-config)
;;                               (exwm-config-default)
;;                               (message (concat "exwm configuration not found. "
;;                                                "Falling back to default configuration...")))))))
;;                (chmod exwm-executable #o555)
;;                #t))))))
;;     (home-page "http://custom")
;;     (synopsis "Derivative")))
