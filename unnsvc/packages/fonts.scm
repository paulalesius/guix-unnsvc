;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2013, 2014, 2015, 2016, 2018, 2019 Ludovic Courtès <ludo@gnu.org>
;;; Copyright © 2014, 2017 Mark H Weaver <mhw@netris.org>
;;; Copyright © 2014 Joshua Grant <tadni@riseup.net>
;;; Copyright © 2014 Alex Kost <alezost@gmail.com>
;;; Copyright © 2015 Sou Bunnbu <iyzsong@gmail.com>
;;; Copyright © 2015 Eric Dvorsak <eric@dvorsak.fr>
;;; Copyright © 2015, 2017 Ricardo Wurmus <rekado@elephly.net>
;;; Copyright © 2015, 2016 Leo Famulari <leo@famulari.name>
;;; Copyright © 2016, 2017, 2018 Nikita <nikita@n0.is>
;;; Copyright © 2016 Jookia <166291@gmail.com>
;;; Copyright © 2016 Eric Bavier <bavier@member.fsf.org>
;;; Copyright © 2016 Dmitry Nikolaev <cameltheman@gmail.com>
;;; Copyright © 2016, 2017, 2018, 2019, 2020, 2021 Efraim Flashner <efraim@flashner.co.il>
;;; Copyright © 2016, 2020 Marius Bakke <mbakke@fastmail.com>
;;; Copyright © 2016 Toni Reina <areina@riseup.net>
;;; Copyright © 2017–2021 Tobias Geerinckx-Rice <me@tobias.gr>
;;; Copyright © 2017 José Miguel Sánchez García <jmi2k@openmailbox.com>
;;; Copyright © 2017 Alex Griffin <a@ajgrf.com>
;;; Copyright © 2017 Clément Lassieur <clement@lassieur.org>
;;; Copyright © 2017 Brendan Tildesley <mail@brendan.scot>
;;; Copyright © 2017, 2018, 2019, 2020 Arun Isaac <arunisaac@systemreboot.net>
;;; Copyright © 2017 Mohammed Sadiq <sadiq@sadiqpk.org>
;;; Copyright © 2018 Charlie Ritter <chewzerita@posteo.net>
;;; Copyright © 2018 Gabriel Hondet <gabrielhondet@gmail.com>
;;; Copyright © 2019, 2020 Jens Mølgaard <jens@zete.tk>
;;; Copyright © 2019, 2020 Nicolas Goaziou <mail@nicolasgoaziou.fr>
;;; Copyright © 2019 Baptiste Strazzulla <bstrazzull@hotmail.fr>
;;; Copyright © 2019 Alva <alva@skogen.is>
;;; Copyright © 2019 Alexandros Theodotou <alex@zrythm.org>
;;; Copyright © 2020 Damien Cassou <damien@cassou.me>
;;; Copyright © 2020 Amin Bandali <bandali@gnu.org>
;;; Copyright © 2020 Michael Rohleder <mike@rohleder.de>
;;; Copyright © 2020 John Soo <jsoo1@asu.edu>
;;; Copyright © 2020 Raghav Gururajan <raghavgururajan@disroot.org>
;;; Copyright © 2020, 2021 Julien Lepiller <julien@lepiller.eu>
;;; Copyright © 2020 Zhu Zihao <all_but_last@163.com>
;;; Copyright © 2020, 2021 Simen Endsjø <simendsjo@gmail.com>
;;; Copyright © 2020 Tim Van den Langenbergh <tmt_vdl@gmx.com>
;;; Copyright © 2020 Nicolò Balzarotti <nicolo@nixo.xyz>
;;; Copyright © 2021 Antoine Côté <antoine.cote@posteo.net>
;;; Copyright © 2021 Sergiu Ivanov <sivanov@colimite.fr>
;;; Copyright © 2021 Sarah Morgensen <iskarian@mgsn.dev>
;;; Copyright © 2021 Paul A. Patience <paul@apatience.com>
;;; Copyright © 2021 Taiju HIGASHI <higashi@taiju.info>
;;; Copyright © 2022 Philip McGrath <philip@philipmcgrath.com>
;;; Copyright © 2022 Kitzman <kitzman@disroot.org>
;;; Copyright © 2021 Wamm K. D. <jaft.r@outlook.com>
;;; Copyright © 2022 Jai Vetrivelan <jaivetrivelan@gmail.com>
;;;
;;; This file is part of GNU Guix.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

(define-module (unnsvc packages fonts)
  #:use-module (ice-9 regex)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages xorg))


(define-public font-nerd-fonts
  (package
    (name "font-nerd-fonts")
    (version "2.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ryanoasis/nerd-fonts")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1la79y16k9rwcl2zsxk73c0kgdms2ma43kpjfqnq5jlbfdj0niwg"))))
    (build-system font-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-before 'install 'make-files-writable
           (lambda _
             (for-each
              make-file-writable
              (find-files "." ".*\\.(otf|otc|ttf|ttc)$"))
             #t)))))
    (home-page "https://www.nerdfonts.com/")
    (synopsis "Iconic font aggregator, collection, and patcher")
    (description
     "Nerd Fonts patches developer targeted fonts with a high number
of glyphs (icons). Specifically to add a high number of extra glyphs
from popular  such as Font Awesome, Devicons, Octicons,
and others.")
    (license license:expat)))
