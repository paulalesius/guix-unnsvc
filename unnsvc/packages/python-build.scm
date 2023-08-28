(define-module (unnsvc packages python-build)
  #:use-module (gnu packages)
  #:use-module (gnu packages python-build)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download))

(define-public python-poetry-core-1.7
  (package/inherit python-poetry-core
    (version "1.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "poetry_core" version))
       (sha256
        (base32
         "0x1v6p8fzb68gsj8v0g4hskx5m9484ha3v3vcf1010lwpn1rnrwg"))))))
