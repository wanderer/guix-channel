(define-module (alacritty)
  #:use-module ((gnu packages cmake) #:select (cmake))
  #:use-module ((gnu packages compression) #:select (gzip))
  #:use-module (gnu packages crates-io)
  #:use-module ((gnu packages elf) #:select (patchelf))
  #:use-module ((gnu packages fontutils) #:select (fontconfig freetype))
  #:use-module ((gnu packages freedesktop) #:select (wayland xdg-utils))
  #:use-module ((gnu packages gcc) #:select (gcc))
  #:use-module ((gnu packages gl) #:select (glew freeglut mesa mesa-utils))
  #:use-module ((gnu packages ncurses) #:select (ncurses))
  #:use-module ((gnu packages pkg-config) #:select (pkg-config))
  #:use-module ((gnu packages python) #:select (python-wrapper))
  #:use-module ((gnu packages version-control) #:select (git))
  #:use-module ((gnu packages vulkan) #:select (vulkan-loader))
  #:use-module ((gnu packages xdisorg) #:select (libxkbcommon))
  #:use-module ((gnu packages xml) #:select (expat))
  #:use-module ((gnu packages xorg)
                #:select (libx11
                          libxcb
                          libxcursor
                          libxi
                          libxrandr
                          libxxf86vm))
  #:use-module (guix build-system cargo)
  #:use-module ((guix build-system gnu) #:prefix gnu:)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (rust-xyz))

(define-public alacritty
  (package
    (name "alacritty")
    (version "0.3.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jwilm/alacritty")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1h9zid7bi19qga3a8a2d4x3ma9wf1njmj74s4xnw7nzqqf3dh750"))))
    (build-system cargo-build-system)
    (inputs
     `(("expat" ,expat)
       ("fontconfig" ,fontconfig)
       ("freeglut" ,freeglut)
       ("freetype" ,freetype)
       ("gcc-lib" ,gcc "lib")
       ("glew" ,glew)
       ("gzip" ,gzip)
       ("libx11" ,libx11)
       ("libxcb" ,libxcb)
       ("libxcursor" ,libxcursor)
       ("libxi" ,libxi)
       ("libxxf86vm" ,libxxf86vm)
       ("libxkbcommon" ,libxkbcommon)
       ("libxrandr" ,libxrandr)
       ("mesa" ,mesa)
       ("ncurses" ,ncurses)
       ("patchelf" ,patchelf)
       ("xdg-utils" ,xdg-utils)))
    (native-inputs
     `(("cmake" ,cmake)
       ("pkg-config" ,pkg-config)
       ("python-wrapper" ,python-wrapper)))
    (arguments
     `(#:cargo-inputs
       (("rust-aho-corasick" ,rust-aho-corasick-0.7)
        ("rust-ansi-term" ,rust-ansi-term-0.11)
        ("rust-atty" ,rust-atty-0.2)
        ("rust-backtrace-sys" ,rust-backtrace-sys-0.1)
        ("rust-base64" ,rust-base64-0.10)
        ("rust-cc" ,rust-cc-1.0)
        ("rust-cgl" ,rust-cgl-0.2)
        ("rust-clap" ,rust-clap-2)
        ("rust-clipboard-win" ,rust-clipboard-win)
        ("rust-core-text" ,rust-core-text)
        ("rust-crossbeam-channel" ,rust-crossbeam-channel-0.3)
        ("rust-crossbeam-deque" ,rust-crossbeam-deque-0.6)
        ("rust-crossbeam-epoch" ,rust-crossbeam-epoch-0.7)
        ("rust-crossbeam-queue" ,rust-crossbeam-queue-0.1)
        ("rust-dbus" ,rust-dbus)
        ("rust-dirs" ,rust-dirs-1)
        ("rust-dtoa" ,rust-dtoa-0.4)
        ("rust-dunce" ,rust-dunce)
        ("rust-dwrote" ,rust-dwrote)
        ("rust-either" ,rust-either-1.5)
        ("rust-embed-resource" ,rust-embed-resource)
        ("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-errno" ,rust-errno-0.2)
        ("rust-euclid" ,rust-euclid)
        ("rust-failure-derive" ,rust-failure-derive-0.1)
        ("rust-foreign-types" ,rust-foreign-types)
        ("rust-foreigh-types-shared" ,rust-foreign-types-shared-0.1)
        ("rust-freetype-rs" ,rust-freetype-rs)
        ("rust-fuchsia-zircon" ,rust-fuchsia-zircon-0.3)
        ("rust-fuchsia-zircon-sys" ,rust-fuchsia-zircon-sys-0.3)
        ("rust-glutin" ,rust-gl-generator-0.11)
        ("rust-glutin" ,rust-glutin)
        ("rust-http-req" ,rust-http-req)
        ("rust-humantime" ,rust-humantime-1.2)
        ("rust-image" ,rust-image-0.21)
        ("rust-idna" ,rust-idna-0.1)
        ("rust-iovec" ,rust-iovec-0.1)
        ("rust-itoa" ,rust-itoa-0.4)
        ("rust-log" ,rust-log-0.4)
        ("rust-matches" ,rust-matches-0.1)
        ("rust-memoffset" ,rust-memoffset-0.2)
        ("rust-miniz-oxide" ,rust-miniz-oxide-0.2)
        ("rust-miniz-oxide-c-api" ,rust-miniz-oxide-c-api-0.2)
        ("rust-mio-anonymous-pipes" ,rust-mio-anonymous-pipes)
        ("rust-mio-named-pipes" ,rust-mio-named-pipes-0.1)
        ("rust-miow" ,rust-miow-0.2)
        ("rust-named-pipe" ,rust-named-pipe)
        ("rust-net2" ,rust-net2-0.2)
        ("rust-nix" ,rust-nix-0.14)
        ("rust-nodrop" ,rust-nodrop-0.1)
        ("rust-notify" ,rust-notify)
        ("rust-objc-foundation" ,rust-objc-foundation)
        ("rust-openssl-sys" ,rust-openssl-sys-0.9)
        ("rust-parking-lot" ,rust-parking-lot-0.7)
        ("rust-percent-encoding" ,rust-percent-encoding-1.0)
        ("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-quick-error" ,rust-quick-error-1.2)
        ("rust-quote" ,rust-quote-0.6)
        ("rust-rand" ,rust-rand-0.6)
        ("rust-rand-chacha" ,rust-rand-chacha-0.1)
        ("rust-rand-core-0.3" ,rust-rand-core-0.3)
        ("rust-rand-core-0.4.0" ,rust-rand-core-0.4)
        ("rust-rand-hc" ,rust-rand-hc-0.1)
        ("rust-rand-isaac" ,rust-rand-isaac-0.1)
        ("rust-rand-jitter" ,rust-rand-jitter-0.1)
        ("rust-rand-os" ,rust-rand-os-0.1)
        ("rust-rand-pcg" ,rust-rand-pcg-0.1.2)
        ("rust-rand-xorshift" ,rust-rand-xorshift-0.1)
        ("rust-rayon-core" ,rust-rayon-core-1.5)
        ("rust-regex-syntax" ,rust-regex-syntax-0.6)
        ("rust-remove-dir-all" ,rust-remove-dir-all-0.5)
        ("rust-rustc-demangle" ,rust-rustc-demangle-0.1)
        ("rust-rustc-tools-util" ,rust-rustc-tools-util)
        ("rust-rustc-version" ,rust-rustc-version-0.2)
        ("rust-ryu" ,rust-ryu-1.0)
        ("rust-same-file" ,rust-same-file-1.0)
        ("rust-scopeguard" ,rust-scopeguard-0.3)
        ("rust-semver-parser" ,rust-semver-parser-0.7)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-serde-yaml" ,rust-serde-yaml-0.8)
        ("rust-servo-fontconfig" ,rust-servo-fontconfig)
        ("rust-signal-hook" ,rust-signal-hook-0.1)
        ("rust-smithay" ,rust-smithay)
        ("rust-smithay-clipboard" ,rust-smithay-clipboard)
        ("rust-socket2" ,rust-socket2)
        ("rust-stable-deref-trait" ,rust-stable-deref-trait-1.1)
        ("rust-static-assertions" ,rust-static-assertions-0.3)
        ("rust-strsim" ,rust-strsim-0.8)
        ("rust-syn" ,rust-syn-1.0)
        ("rust-synstructure" ,rust-synstructure-0.10)
        ("rust-termcolor" ,rust-termcolor-1.0)
        ("rust-terminfo" ,rust-terminfo)
        ("rust-tempfile" ,rust-tempfile-3.0)
        ("rust-textwrap" ,rust-textwrap-0.11)
        ("rust-time" ,rust-time-0.1)
        ("rust-ucd-util" ,rust-ucd-util-0.1)
        ("rust-unicode-bidi" ,rust-unicode-bidi-0.3)
        ("rust-unicode-normalization" ,rust-unicode-normalization-0.1)
        ("rust-unicode-width" ,rust-unicode-width-0.1)
        ("rust-unicode-xid-0.1" ,rust-unicode-xid-0.1)
        ("rust-unicode-xid-0.2" ,rust-unicode-xid-0.2)
        ("rust-url" ,rust-url-1.7)
        ("rust-vcpkg" ,rust-vcpkg-0.2)
        ("rust-vec-map" ,rust-vec-map-0.8)
        ("rust-version-check" ,rust-version-check-0.1)
        ("rust-vte" ,rust-vte)
        ("rust-widestring" ,rust-widestring-0.4)
        ("rust-winapi" ,rust-winapi-0.2)
        ("rust-winapi-build" ,rust-winapi-build-0.1)
        ("rust-winapi-util" ,rust-winapi-util-0.1)
        ("rust-wincolor" ,rust-wincolor-1.0)
        ("rust-winpty-sys" ,rust-winpty-sys)
        ("rust-ws2-32-sys" ,rust-ws2-32-sys-0.2)
        ("rust-x11-clipboard" ,rust-x11-clipboard)
        ("rust-yaml-rust" ,rust-yaml-rust-0.4)
        ("rust-zip" ,rust-zip))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-xdg-utils-reference
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((xdg-utils (assoc-ref inputs "xdg-utils")))
               (substitute* "alacritty_terminal/src/config/mouse.rs"
                 (("xdg-open")
                  (string-append xdg-utils "/bin/xdg-open"))))))

         (replace 'install
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (gzip (string-append
                           (assoc-ref inputs "gzip") "/bin/gzip"))
                    (tic (string-append
                          (assoc-ref inputs "ncurses") "/bin/tic"))
                    (lib-path (lambda (in)
                                (string-append
                                 (assoc-ref inputs in) "/lib")))
                    (additional-library-paths
                     (string-join (map lib-path
                                       '("expat"
                                         "fontconfig"
                                         "freetype"
                                         "gcc-lib"
                                         "libx11"
                                         "libxcb"
                                         "libxcursor"
                                         "libxi"
                                         "libxrandr"
                                         "libxxf86vm"
                                         "mesa"))
                                  ":"))
                    (target "target/release/alacritty"))

               ;; Binary
               (use-modules (ice-9 popen)
                            (ice-9 textual-ports))
               (let* ((cmd (string-append
                            (assoc-ref inputs "patchelf")
                            "/bin/patchelf --print-rpath " target))
                      (pipe (open-input-pipe cmd))
                      (old-rpath (get-string-all pipe)))
                 (invoke
                  "patchelf" "--set-rpath"
                  (string-append old-rpath ":" additional-library-paths)
                  target)
                 (close-pipe pipe))
               (install-file target (string-append out "/bin"))

               ;; Completions
               (install-file
                "extra/completions/_alacritty"
                (string-append out "/share/zsh/site-functions"))
               (install-file
                "extra/completions/alacritty.bash"
                (string-append out "/etc/bash_completion.d"))
               (install-file
                "extra/completions/alacritty.fish"
                (string-append out "/share/fish/vendor_completions.d"))

               ;; .desktop file
               (install-file
                "extra/linux/alacritty.desktop"
                (string-append out "/share/applications"))

               ;; Manpages
               (mkdir-p (string-append out "/share/man/man1"))
               (call-with-output-file
                   (string-append out "/share/man/man1/alacritty.1.gz")
                 (lambda (f)
                   (use-modules (ice-9 popen) (ice-9 binary-ports))
                   (let* ((cmd (string-append gzip " -c extra/alacritty.man"))
                          (pipe (open-input-pipe cmd))
                          (man (get-bytevector-all pipe)))
                     (put-bytevector f man)
                     (close-pipe pipe))))

               ;; Terminfo
               (mkdir-p (string-append out "/share/terminfo/"))
               (invoke
                tic "-x"
                "-o" (string-append out "/share/terminfo/")
                "extra/alacritty.info")
               #t))))))
    (outputs '("out" "terminfo"))
    (home-page "https://github.com/jwilm/alacritty")
    (synopsis "GPU accelerated terminal emulator")
    (description "GPU accelerated terminal emulator")
    (license license:asl2.0)))
