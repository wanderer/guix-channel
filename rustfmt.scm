(define-module (rustfmt)
  #:use-module (gnu packages crates-io)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (rust-xyz))

(define-public rustfmt
  (package
    (name "rustfmt")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustfmt" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "003mam2zks9cvafy6ig3q38mbp4pbw1gbi98p5xgpc2dh7nhx57c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-autocfg" ,rust-autocfg-0.1)
        ("rust-bitflags" ,rust-bitflags-1)
        ("rust-diff" ,rust-diff-0.1)
        ("rust-env-logger" ,rust-env-logger-0.4)
        ("rust-getopts" ,rust-getopts-0.2)
        ("rust-itoa" ,rust-itoa-0.4)
        ("rust-kernel32-sys" ,rust-kernel32-sys-0.2)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.3)
        ("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-quote" ,rust-quote-0.6)
        ("rust-rand-chacha" ,rust-rand-chacha-0.1)
        ("rust-rand-core-0.4.0" ,rust-rand-core-0.4)
        ("rust-rand-core-0.3" ,rust-rand-core-0.3)
        ("rust-rand-hc" ,rust-rand-hc-0.1)
        ("rust-rand-isaac" ,rust-rand-isaac-0.1)
        ("rust-rand-jitter" ,rust-rand-jitter-0.1)
        ("rust-rand-os" ,rust-rand-os-0.1)
        ("rust-rand-pcg" ,rust-rand-pcg-0.1.2)
        ("rust-rand-xorshift" ,rust-rand-xorshift-0.1)
        ("rust-regex" ,rust-regex-0.2)
        ("rust-ryu" ,rust-ryu-1.0)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-strings" ,rust-strings)
        ("rust-syn" ,rust-syn-1.0)
        ("rust-syntex-errors" ,rust-syntex-errors)
        ("rust-syntex-syntax" ,rust-syntex-syntax)
        ("rust-term" ,rust-term-0.4)
        ("rust-toml" ,rust-toml-0.4)
        ("rust-ucd-util" ,rust-ucd-util-0.1)
        ("rust-unicode-segmentation" ,rust-unicode-segmentation-1.3)
        ("rust-winapi" ,rust-winapi-0.2)
        ("rust-winapi-build" ,rust-winapi-build-0.1))))
    (home-page
     "https://github.com/rust-lang-nursery/rustfmt")
    (synopsis
     "Tool to find and fix Rust formatting issues")
    (description
     "Tool to find and fix Rust formatting issues")
    (license #f)))


