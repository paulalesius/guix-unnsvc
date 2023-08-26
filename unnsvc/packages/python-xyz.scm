(define-module (unnsvc packages python-xyz)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages check)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages mpi)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix utils))

(define-public python-docstring-to-markdown
  (package
    (name "python-docstring-to-markdown")
    (version "0.12")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "docstring-to-markdown" version))
       (sha256
        (base32
         "1fxjgy15dylyf2b4hjvcsspl24x4ayrmpf7kq1j6zg8jnhj44020"))))
    (build-system python-build-system)
    (propagated-inputs (list python-lxml python-six python-whatthepatch))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license license:lgpl2.1+)))

(define-public python-runtests
  (package
    (name "python-runtests")
    (version "0.0.28")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "runtests" version))
       (sha256
        (base32
         "1r5yvb1317c2i6iy80n5q1bp6nw3akqrg20apg5czkglpdn8mlmd"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (delete 'check))))
    (native-inputs (list python-pytest python-coverage python-mpi4py))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license license:bsd-2)))

(define-public python-requests-wsgi-adapter
  (package
    (name "python-requests-wsgi-adapter")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "requests-wsgi-adapter" version))
       (sha256
        (base32
         "0d51iq8gimc8spvk35s7zg970m2kgbci3dirfc5qsjv1wa5ck03h"))))
    (build-system pyproject-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (delete 'check))))
    (inputs (list python-requests python-runtests))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license license:expat)))

(define-public python-unearth
  (package
    (name "python-unearth")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "unearth" version))
       (sha256
        (base32
         "0ignm3asv7cnm1ngcf6adlbr7m65llxppkqik8afb8ramfjm5cfm"))))
    (build-system pyproject-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (delete 'check))))
    (native-inputs (list python-pytest python-pdm-backend python-flask python-trustme python-requests-wsgi-adapter))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license license:expat)))

(define-public python-pdm
  (package
    (name "python-pdm")
    (version "2.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pdm" version))
       (sha256
        (base32
         "1p5z0p1kq3m33n9yczj91qav18h5nf6243f8qh52ns10yq5x0j5r"))))
    (build-system pyproject-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (delete 'check)
         (delete 'sanity-check))))
    (propagated-inputs (list python-pdm-backend))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license license:expat)))

(define-public python-pdm-pep517
  (package
    (name "python-pdm-pep517")
    (version "1.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pdm-pep517" version))
       (sha256
        (base32
         "0gygn8ricrmd6wqngiazawwpm81dvl8255mcdwlwlbdlf0g14jbz"))))
    (build-system pyproject-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (delete 'check)
         (delete 'sanity-check))))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license license:expat)))

(define-public python-pytoolconfig
  (package
    (name "python-pytoolconfig")
    (version "1.2.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pytoolconfig" version))
       (sha256
        (base32
         "0yf2z9plv50mz74a6xdcy89axgpg5y8dy7sc8509sfmh4gz9s3x5"))))
    (build-system pyproject-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (delete 'check)
         (delete 'sanity-check))))
    (native-inputs (list python-pdm-pep517 python-flake8
                         python-pytest python-docutils))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license license:gpl3)))

(define-public python-packaging-23
  (package
    (name "python-packaging")
    (version "23.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "packaging" version))
       (sha256
        (base32
         "15yg8sagk2ffikgzwxbjgksgb1zkv9px5jqwzsi0zph7i5zjkbdn"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-flit-core))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (delete 'check)
         (delete 'sanity-check))))
    (home-page "https://github.com/xyz")
    (synopsis "xyz")
    (description "xyz")
    (license license:gpl3)))

(define-public python-rope-1.9
  (package
    (name "python-rope")
    (version "1.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "rope" version))
       (sha256
        (base32
         "00wmsq4fv52gh0g3vddlhrj9ffwk2g5351rh26s65q606a0p13gl"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-lxml python-six python-whatthepatch python-pytoolconfig python-platformdirs python-tomli python-packaging-23))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (delete 'check)
         (delete 'sanity-check))))
    (home-page "https://github.com/Shoobx/xmldiff")
    (synopsis "a python refactoring library...")
    (description "Rope is the world’s most advanced open source Python
refactoring library.")
    (license license:lgpl2.1+)))

(define-public python-lsp-server-1.7
  (package
    (name "python-lsp-server")
    (version "1.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "python-lsp-server" version))
       (sha256
        (base32
         "15x10vnx0m3xplvn1kqvc5jh3h113ms5kzff9sr3352db9458hn8"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-before 'check 'set-HOME
           (lambda _ (setenv "HOME" "/tmp")))
         ;; (replace 'check
         ;;   (lambda _
         ;;     ;; Disable failing test.
         ;;     (invoke "pytest" "-x" "-v" "-k"
         ;;             "not test_pyqt_completion")))
         (delete 'check)
         (delete 'sanity-check)
         )))
    (propagated-inputs
     (list python-autopep8
           python-pydocstyle
           python-flake8
           python-future
           python-jedi
           python-lsp-jsonrpc
           python-pluggy
           python-pycodestyle
           python-pyflakes
           python-rope-1.9
           python-ujson
           python-yapf))
    (native-inputs
     (list python-coverage
           python-flaky
           python-matplotlib
           python-mock
           python-numpy
           python-pandas
           python-pylint
           python-pytest
           python-pytest-cov
           python-versioneer
           python-docstring-to-markdown
           python-pytoolconfig
           ))
    (home-page "https://github.com/python-lsp/python-lsp-server")
    (synopsis "Python implementation of the Language Server Protocol")
    (description
"The Python Language Server @command{pylsp} is an implementation of the
Python 3 language specification for the Language Server Protocol (LSP).
This tool is used in text editing environments to provide a complete
and integrated feature-set for programming Python effectively.")
    (license license:expat)))

(define-public python-cleo-2.0
  (package
    (name "python-cleo")
    (version "2.0.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "cleo" version))
              (sha256
               (base32
                "1iayl7s1mrdjd6zc78vmcli3q5i4j5p9lj5yrs2i1hb360gjwjzb"))))
    (build-system pyproject-build-system)
    (native-inputs
     (list ;; For testing
           python-mock python-pytest-mock python-pytest python-poetry-core))
    (propagated-inputs
     (list python-backpack python-clikit python-pastel python-pylev))
    (arguments
     `(#:tests? #f                      ;PyPI does not have tests
       #:phases
       (modify-phases %standard-phases
         (delete 'sanity-check))))
    (home-page "https://github.com/sdispater/cleo")
    (synopsis "Command-line arguments library for Python")
    (description
     "Cleo allows you to create command-line commands with signature in
docstring and colored output.")
    (license license:expat)))

(define-public poetry-1.6
  (package
    (name "poetry")
    (version "1.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "poetry" version))
       (sha256
        (base32
         "1lirh32fcmxd56w6hx4x205cqwlwl7pammmqaarch73kjajv3f8a"))))
    (build-system pyproject-build-system)
    (arguments
     `(#:tests? #f                      ;PyPI does not have tests
       #:phases
       (modify-phases %standard-phases
         (delete 'sanity-check))
       ;; #:phases
       ;; (modify-phases %standard-phases
       ;;   (add-before 'build 'patch-setup-py
       ;;     (lambda _
       ;;       (substitute* "setup.py"
       ;;         ;; Relax some of the requirements.
       ;;         (("(keyring>=21.2.0),<22.0.0" _ keyring) keyring)
       ;;         (("(packaging>=20.4),<21.0" _ packaging) packaging)))))
       ))
    (propagated-inputs
     (list python-cachecontrol
           python-cachy
           python-cleo-2.0
           python-crashtest
           python-entrypoints
           python-html5lib
           python-keyring
           python-msgpack
           python-packaging
           python-pexpect
           python-pip
           python-pkginfo
           python-poetry-core
           python-requests
           python-requests-toolbelt
           python-shellingham
           python-tomlkit
           python-cleo
           python-virtualenv))
    (home-page "https://python-poetry.org")
    (synopsis "Python dependency management and packaging made easy")
    (description "Poetry is a tool for dependency management and packaging
in Python.  It allows you to declare the libraries your project depends on and
it will manage (install/update) them for you.")
    (license license:expat)))
