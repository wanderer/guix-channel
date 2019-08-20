(define-module (ripgrep)
  #:use-module (gnu packages crates-io)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (rust-xyz))

(define-public ripgrep
  (package
    (name "ripgrep")
    (version "11.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ripgrep" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0bn40lz9n08llq615p4qqqbi24zbkf0appfx3zgxg34a86ga9zds"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bstr" ,rust-bstr-0.1)
        ("rust-clap" ,rust-clap)
        ("rust-grep" ,rust-grep)
        ("rust-ignore" ,rust-ignore)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-log" ,rust-log)
        ("rust-num-cpus" ,rust-num-cpus)
        ("rust-regex" ,rust-regex)
        ("rust-serde-json" ,rust-serde-json)
        ("rust-termcolor" ,rust-termcolor))
       #:cargo-development-inputs
       (("rust-clap" ,rust-clap)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-serde" ,rust-serde)
        ("rust-serde-derive" ,rust-serde-derive))))
    (home-page
     "https://github.com/BurntSushi/ripgrep")
    (synopsis
     "line-oriented search tool that recursively searches your current directory")
    (description
     "ripgrep is a line-oriented search tool that recursively searches your current
directory for a regex pattern while respecting your gitignore rules.  ripgrep
has first class support on Windows, macOS and Linux")
    (license #f)))
