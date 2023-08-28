(define-module (unnsvc packages python-xyz)
  #:use-module (gnu packages)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix utils)
  #:use-module (gnu packages check)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages mpi)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages gnupg)
  #:use-module ((guix licenses) #:prefix license:))

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

(define-public python-pkginfo-1.9
  (package/inherit python-pkginfo
    (version "1.9.6")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pkginfo" version))
       (sha256
        (base32
         "0inh57664sx2vlbd3913dsc9nz21ysb9vk591qpkg90qhxp8kmcg"))))
    (build-system python-build-system)
    (native-inputs
     (list python-wheel))))

(define-public python-dulwich-21
  (package/inherit python-dulwich
    (version "0.21.5")
    (source
      (origin
        (method url-fetch)
        (uri (list (string-append "https://www.dulwich.io/releases/"
                            "dulwich-" version ".tar.gz")
                   (pypi-uri "dulwich" version)))
        (sha256
          (base32
           "00rik55i99hgax97rcckz5cfacg9fh7vjdj69bisdpcx4i75x5bh"))))
    (build-system python-build-system)
    (arguments
     '(#:tests? #f
       #:phases
       (modify-phases %standard-phases
         (add-before 'check 'fix-tests
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* '("dulwich/tests/test_repository.py"
                            "dulwich/tests/test_porcelain.py"
                            "dulwich/tests/test_hooks.py")
               (("/bin/sh") (search-input-file inputs "/bin/sh")))
             (setenv "TEST_RUNNER" "unittest")
             (setenv "PYTHONHASHSEED" "random"))))))
    (propagated-inputs
     (list python-fastimport python-urllib3))
    (native-inputs
     (list python-mock python-geventhttpclient python-gpg
           git gnupg python-paramiko python-requests))))

(define-public python-cachecontrol-0.13
  (package/inherit python-cachecontrol
    (version "0.13.1")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "cachecontrol" version))
        (sha256
          (base32
           "0sshgq42kg89gyjqxb2x9a6s6lmza4qyg71h31hkl96jg5mkc4ph"))))
    (build-system pyproject-build-system)
    (propagated-inputs
     (list python-requests python-msgpack python-lockfile python-flit-core))))

(define-public python-crashtest-0.4
  (package/inherit python-crashtest
    (version "0.4.1")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "crashtest" version))
        (sha256
          (base32
           "1kphcr9af50p37j9v5s8p8qblxy8fmi6s1s8yqlx9yzb2vrv3mw0"))))
    (build-system python-build-system)
    (home-page "https://github.com/sdispater/crashtest")
    (synopsis "Manage Python errors with ease")
    (description
     "Python library that makes exceptions handling and inspection easier.")
    (license license:expat)))

(define-public python-virtualenv-22.24
  (package/inherit python-virtualenv
    (version "20.24.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "virtualenv" version))
       (sha256
        (base32
         "1z1ysb778zjjny6fdcf48y3wj64l54m6ll21y25342vvh77b9hz5"))))
    (build-system pyproject-build-system)
    (native-inputs
     (list python-mock python-pytest python-setuptools-scm python-hatchling python-hatch-vcs python-platformdirs))
    (propagated-inputs
     (list python-appdirs python-distlib python-filelock python-six))
    (arguments
     `(#:tests? #f
       #:phases (modify-phases %standard-phases
                  ;; Loading the library fails because DRMAA_LIBRARY_PATH
                  ;; is not configured.
                  (delete 'sanity-check))))))

(define-public python-rapidfuzz
  (package
    (name "python-rapidfuzz")
    (version "3.2.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "rapidfuzz" version))
              (sha256
               (base32
                "0yspc3wsrim59jrnx556alxqvikg2n245ga2dn1agzk0k4fh73a4"))))
    (build-system python-build-system)
    (arguments
     `(#:tests? #f                      ;PyPI does not have tests
       #:phases
       (modify-phases %standard-phases
         (delete 'sanity-check))))
    (home-page "https://github.com/sdispater/cleo")
    (synopsis "rapid fuzzy string matching")
    (description
     "Rapid fuzzy string matching in Python and C++ using the Levenshtein
Distance")
    (license license:expat)))

(define-public poetry-1.6
  (package/inherit poetry
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
         (delete 'sanity-check))))
    (propagated-inputs
     (list python-cachecontrol-0.13
           python-cleo
           python-crashtest-0.4
           python-dulwich
           python-entrypoints
           python-html5lib
           python-keyring
           python-msgpack
           python-packaging-23
           python-pexpect
           python-pip
           python-pkginfo-1.9
           python-poetry-core-1.7
           python-requests
           python-requests-toolbelt
           python-shellingham
           python-tomlkit
           python-virtualenv-22.24
           python-rapidfuzz))))

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

