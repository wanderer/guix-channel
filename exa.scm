(define-module (exa)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages compression)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (rust-xyz))

(define-public exa
  (package
    (name "exa")
    (version "0.9.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "exa" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1s902xgplz1167k0r7x235p914lprpsqy2if0kpa1mlb0fswqqq4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f ; FIXME tests failing
       #:cargo-inputs
        (("rust-ansi-term" ,rust-ansi-term-0.12)
         ("rust-autocfg" ,rust-autocfg-0.1)
         ("rust-cc" ,rust-cc-1.0)
         ("rust-datetime" ,rust-datetime-0.4)
         ("rust-env-logger" ,rust-env-logger-0.6)
         ("rust-git2" ,rust-git2-0.9)
         ("rust-glob" ,rust-glob-0.3)
         ("rust-lazy-static" ,rust-lazy-static-1.3)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-libz-sys" ,rust-libz-sys-1.0)
         ("rust-locale" ,rust-locale-0.2)
         ("rust-log" ,rust-log-0.4)
         ("rust-natord" ,rust-natord-1.0)
         ("rust-num-cpus" ,rust-num-cpus-1.11)
         ("rust-num-traits" ,rust-num-traits-0.1)
         ("rust-number-prefix" ,rust-number-prefix-0.3)
         ("rust-openssl-src" ,rust-openssl-src-111)
         ("rust-pkg-config" ,rust-pkg-config-0.3)
         ("rust-scoped-threadpool" ,rust-scoped-threadpool-0.1)
         ("rust-term-grid" ,rust-term-grid-0.1)
         ("rust-term-size" ,rust-term-size-0.3)
         ("rust-unicode-width" ,rust-unicode-width-0.1)
         ("rust-users" ,rust-users-0.9)
         ("rust-vcpkg" ,rust-vcpkg-0.2)
         ("rust-winapi-build" ,rust-winapi-build-0.1)
         ("rust-zoneinfo-compiled" ,rust-zoneinfo-compiled-0.4))
        #:cargo-development-inputs
        (("rust-datetime" ,rust-datetime-0.4))))
    (inputs
     `(("zlib" ,zlib)))
    (home-page "https://the.exa.website/")
    (synopsis "Modern replacement for ls")
    (description "This package provides a modern replacement for ls.")
    (license license:expat)))

