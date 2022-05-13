;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2017 Julien Lepiller <julien@lepiller.eu>
;;; Copyright © 2017 Clément Lassieur <clement@lassieur.org>
;;; Copyright © 2017 Mathieu Othacehe <m.othacehe@gmail.com>
;;; Copyright © 2021 Guillaume Le Vaillant <glv@posteo.net>
;;; Copyright © 2021 Solene Rapenne <solene@perso.pw>
;;; Copyright © 2021 Domagoj Stolfa <ds815@gmx.com>
;;; Copyright © 2021 Tobias Geerinckx-Rice <me@tobias.gr>
;;; Copyright © 2021 Raghav Gururajan <rg@raghavgururajan.name>
;;; Copyright © 2021 jgart <jgart@dismail.de>
;;; Copyright © 2021 Nathan Dehnel <ncdehnel@gmail.com>
;;; Copyright © 2022 Cameron V Chaparro <cameron@cameronchaparro.com>
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

(define-module (unnsvc services wireguard)
  #:use-module (gnu services)
  #:use-module (gnu services configuration)
  #:use-module (gnu services dbus)
  #:use-module (gnu services shepherd)
  #:use-module (gnu system shadow)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages vpn)
  #:use-module (guix packages)
  #:use-module (guix records)
  #:use-module (guix gexp)
  #:use-module (guix i18n)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match)
  #:use-module (ice-9 regex)
  #:export (wireguard-peer
            wireguard-peer?
            wireguard-peer-name
            wireguard-peer-endpoint
            wireguard-peer-allowed-ips
            wireguard-peer-public-key
            wireguard-peer-keep-alive

            wireguard-configuration
            wireguard-configuration?
            wireguard-configuration-wireguard
            wireguard-configuration-interface
            wireguard-configuration-addresses
            wireguard-configuration-port
            wireguard-configuration-dns
            wireguard-configuration-private-key
            wireguard-configuration-peers

            wireguard-custom-service-type))

;;;
;;; Wireguard.
;;;

(define-record-type* <wireguard-peer>
  wireguard-peer make-wireguard-peer
  wireguard-peer?
  (name              wireguard-peer-name)
  (endpoint          wireguard-peer-endpoint
                     (default #f))     ;string
  (public-key        wireguard-peer-public-key)   ;string
  (allowed-ips       wireguard-peer-allowed-ips) ;list of strings
  (keep-alive        wireguard-peer-keep-alive
                     (default #f)))    ;integer

(define-record-type* <wireguard-configuration>
  wireguard-configuration make-wireguard-configuration
  wireguard-configuration?
  (wireguard          wireguard-configuration-wireguard ;file-like
                      (default wireguard-tools))
  (interface          wireguard-configuration-interface ;string
                      (default "wg0"))
  (addresses          wireguard-configuration-addresses ;string
                      (default '("10.0.0.1/32")))
  (port               wireguard-configuration-port ;integer
                      (default 51820))
  (private-key        wireguard-configuration-private-key ;string
                      (default "/etc/wireguard/private.key"))
  (peers              wireguard-configuration-peers ;list of <wiregard-peer>
                      (default '()))
  (dns                wireguard-configuration-dns ;list of strings
                      (default #f)))

(define (wireguard-configuration-file config)
  (define (peer->config peer)
    (let ((name (wireguard-peer-name peer))
          (public-key (wireguard-peer-public-key peer))
          (endpoint (wireguard-peer-endpoint peer))
          (allowed-ips (wireguard-peer-allowed-ips peer))
          (keep-alive (wireguard-peer-keep-alive peer)))
      (format #f "[Peer] #~a
PublicKey = ~a
AllowedIPs = ~a
~a~a"
              name
              public-key
              (string-join allowed-ips ",")
              (if endpoint
                  (format #f "Endpoint = ~a\n" endpoint)
                  "")
              (if keep-alive
                  (format #f "PersistentKeepalive = ~a\n" keep-alive)
                  "\n"))))

  (match-record config <wireguard-configuration>
    (wireguard interface addresses port private-key peers dns)
    (let* ((config-file (string-append interface ".conf"))
           (peers (map peer->config peers))
           (config
            (computed-file
             "wireguard-config"
             #~(begin
                 (mkdir #$output)
                 (chdir #$output)
                 (call-with-output-file #$config-file
                   (lambda (port)
                     (let ((format (@ (ice-9 format) format)))
                       (format port "[Interface]
Address = ~a
PostUp = ~a set %i private-key ~a
~a
~a
~{~a~^~%~}"
                               #$(string-join addresses ",")
                               #$(file-append wireguard "/bin/wg")
                               #$private-key
                               #$(if port
                                     (format #f "ListenPort = ~a" port)
                                     "")
                               #$(if dns
                                     (format #f "DNS = ~a"
                                             (string-join dns ","))
                                     "")
                               (list #$@peers)))))))))
      (file-append config "/" config-file))))

(define (wireguard-activation config)
  (match-record config <wireguard-configuration>
    (private-key)
    #~(begin
        (use-modules (guix build utils)
                     (ice-9 popen)
                     (ice-9 rdelim))
        (mkdir-p (dirname #$private-key))
        (unless (file-exists? #$private-key)
          (let* ((pipe
                  (open-input-pipe (string-append
                                    #$(file-append wireguard-tools "/bin/wg")
                                    " genkey")))
                 (key (read-line pipe)))
            (call-with-output-file #$private-key
              (lambda (port)
                (display key port)))
            (chmod #$private-key #o400)
            (close-pipe pipe))))))

(define (wireguard-shepherd-service config)
  (match-record config <wireguard-configuration>
    (wireguard interface)
    (let ((wg-quick (file-append wireguard "/bin/wg-quick"))
          (config (wireguard-configuration-file config)))
      (list (shepherd-service
             (requirement '(networking))
             (provision (list
                         (symbol-append 'wireguard-
                                        (string->symbol interface))))
             (start #~(lambda _
                       (invoke #$wg-quick "up" #$config)))
             (stop #~(lambda _
                       (invoke #$wg-quick "down" #$config)))
             (documentation "Run the Wireguard VPN tunnel"))))))

(define wireguard-custom-service-type
  (service-type
   (name 'wireguard)
   (extensions
    (list (service-extension shepherd-root-service-type
                             wireguard-shepherd-service)
          (service-extension activation-service-type
                             wireguard-activation)))
   (description "Set up Wireguard @acronym{VPN, Virtual Private Network}
tunnels.")))
