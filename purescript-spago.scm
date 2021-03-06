(define-module (purescript-spago)
  #:use-module (dhall)
  #:use-module (ghc-parsing)
  #:use-module (ghc-repline)
  #:use-module (ghc-system)
  #:use-module ((ghc-cborg) #:select (ghc-serialise))
  #:use-module (gnu packages haskell-check)
  #:use-module (gnu packages haskell-crypto)
  #:use-module (gnu packages haskell-web)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages python)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix build-system haskell)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (purescript-spago))

(define purescript-spago
  (let ((revision "1")
        (commit "838e627461f58181bb69fd3828a161bc88b97e6d"))
    (package
      (name "purescript-spago")
      (version (git-version "0.6.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference (url "https://github.com/spacchetti/spago")
                             (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "18pfdhiqn0a3iwvkxzw4lkg8g6h5c60gj917y0n6k08pdi3vv800"))))
      (build-system haskell-build-system)
      (native-inputs
       `(("ghc-hpack" ,ghc-hpack)
         ("python" ,python)))
      (inputs
       `(("dhall" ,dhall)
         ("dhall-json" ,dhall-json)
         ("ghc-aeson" ,ghc-aeson)
         ("ghc-aeson-pretty" ,ghc-aeson-pretty)
         ("ghc-async-pool" ,ghc-async-pool)
         ("ghc-dotgen" ,ghc-dotgen)
         ("ghc-megaparsec-7.0.4" ,ghc-megaparsec-7.0.4)
         ("ghc-repline" ,ghc-repline)
         ("ghc-serialise" ,ghc-serialise)
         ("ghc-turtle" ,ghc-turtle)
         ("ghc-file-embed" ,ghc-file-embed)))
      (arguments
       `(#:phases
         (modify-phases %standard-phases
           (add-before 'setup-compiler 'hpack
             (lambda _
               (invoke "hpack")
               (substitute* "spago.cabal"
                 (("filepath") "filepath <= 1.4.2"))
               (substitute* "spago.cabal"
                 (("process") "process <= 1.6.3.0"))
               #t)))))
      (home-page "https://github.com/spacchetti/spago")
      (synopsis "Package manager and build tool for PureScript")
      (description
       "Aims to tie together the UX of developing a PureScript project.
it is heavily inspired by Rust's Cargo and Haskell's Stack, and builds
on top of ideas from existing PureScript infrastructure and tooling,
as psc-package, pulp and purp.")
      ;; TODO figure it out
      (license license:bsd-3))))

;; DEPENDENCIES

(define ghc-hspec-discover
  (package
    (name "ghc-hspec-discover")
    (version "2.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/hspec-discover/hspec-discover-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1n3by0dn3x3kfy7vnyfdz0dr2wwwj82m0ijlm9s1n6aa976xddhw"))))
    (build-system haskell-build-system)
    (native-inputs
     `(("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-hspec-meta" ,ghc-hspec-meta)))
    (home-page "http://hspec.github.io/")
    (synopsis
     "Automatically discover and run Hspec tests")
    (description
     "Automatically discover and run Hspec tests.

http://hspec.github.io/hspec-discover.html")
    (license license:expat)))

(define ghc-dotgen
  (package
    (name "ghc-dotgen")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/dotgen/dotgen-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "148q93qsmqgr5pzdwvpjqfd6bdm1pwzcp2rblfwswx2x8c5f43fg"))))
    (build-system haskell-build-system)
    (home-page "https://github.com/ku-fpg/dotgen")
    (synopsis
     "Simple interface for building .dot graph files")
    (description
     "This package provides a simple interface for building .dot graph
files, for input into the dot and graphviz tools.  It includes a
monadic interface for building graphs.")
    (license license:bsd-3)))

(define ghc-async-pool
  (let ((revision "1")
        (commit "edec25439593093331c89090951399ccdd400124"))
    (package
      (name "ghc-async-pool")
      (version (git-version "0.9.0.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference (url "https://github.com/jwiegley/async-pool")
                             (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1pf3dpyi86w99c38d6yi4yjx267rizxhrkrnnqzi7b5qfg7p394b"))))
      (build-system haskell-build-system)
      (inputs
       `(("ghc-fgl" ,ghc-fgl)
         ("ghc-async" ,ghc-async)
         ("ghc-transformers-base" ,ghc-transformers-base)
         ("ghc-monad-control" ,ghc-monad-control)))
      (native-inputs `(("ghc-hspec" ,ghc-hspec)))
      (home-page
       "http://hackage.haskell.org/package/async-pool")
      (synopsis
       "Modified version of Async that supports worker groups and
many-to-many task dependencies")
      (description
       "This library modifies the async package to allow for task
pooling and many-to-many dependencies between tasks.")
      (license license:expat))))
