(define-module (accelbread packages emacs-xyz)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix cvs-download)
  #:use-module (guix download)
  #:use-module (guix bzr-download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix hg-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system emacs)
  #:use-module (guix build-system glib-or-gtk)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages aspell)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages chez)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages code)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages dictionaries)
  #:use-module (gnu packages djvu)
  #:use-module (gnu packages ebook)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages haskell-apps)
  #:use-module (gnu packages ibus)
  #:use-module (gnu packages java)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages telephony)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages tex)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages tcl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages lesstif)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages image)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages lisp-xyz)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages music)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages w3m)
  #:use-module (gnu packages web)
  #:use-module (gnu packages wget)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages node)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages acl)
  #:use-module (gnu packages mail)
  #:use-module (gnu packages messaging)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages racket)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages scheme)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages speech)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages fribidi)
  #:use-module (gnu packages gd)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages password-utils)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages sphinx)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages shellutils)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages video)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages wordnet)
  #:use-module (gnu packages photo)
  #:use-module (gnu packages uml)
  #:use-module (gnu packages finance)
  #:use-module (guix utils)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match))

(define-public emacs-eshell-vterm
  (package
    (name "emacs-eshell-vterm")
    (version "20211024.1443")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/iostapyshyn/eshell-vterm.git")
               (commit "f2212dbfa51aa4b67efda55304b2b3811e8e0625")))
        (sha256
          (base32 "02q1iyh77m7vg9cip7c9wzpiggnsbhhicfs5rqzpc5d7n70gbk2p"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-vterm))
    (home-page "https://github.com/iostapyshyn/eshell-vterm")
    (synopsis "Vterm for visual commands in eshell")
    (description
      "This package provides a global minor mode allowing eshell to use vterm for
visual commands.")
    (license license:gpl3)))

(define-public emacs-auto-minor-mode
  (package
    (name "emacs-auto-minor-mode")
    (version "20180527.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://stable.melpa.org/packages/auto-minor-mode-"
               version
               ".el"))
        (sha256
          (base32 "1xk2vp2pvzc695ghcybb2r3gnmyv81wqxp174kkr0ln5bdayb4mb"))))
    (build-system emacs-build-system)
    (home-page "https://github.com/joewreschnig/auto-minor-mode")
    (synopsis "Enable minor modes by file name and contents")
    (description
      "This package lets you enable minor modes based on file name and contents.  To
find the right modes, it checks filenames against patterns in
‘auto-minor-mode-alist’ and file contents against ‘auto-minor-mode-magic-alist’.
 These work like the built-in Emacs variables ‘auto-mode-alist’ and
‘magic-mode-alist’.")
    (license license:gpl3)))

(define-public emacs-git-modes
  (package
    (name "emacs-git-modes")
    (version "1.4.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://stable.melpa.org/packages/git-modes-"
               version
               ".tar"))
        (sha256
          (base32 "155pw54hh90pnjqx899570my2v4qrrglvbgqj687c2wnx0iilywn"))))
    (build-system emacs-build-system)
    (home-page "https://github.com/magit/git-modes")
    (synopsis "Major modes for editing Git configuration files")
    (description
      "This package provides several major modes for editing Git configuration files.")
    (license license:gpl3)))

(define-public emacs-cmake-mode
  (package
    (name "emacs-cmake-mode")
    (version "3.22.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://stable.melpa.org/packages/cmake-mode-"
               version
               ".el"))
        (sha256
          (base32 "1ghqn5g077q0kndpf6nmbrfjqc52d4c3y4gs4q437n7z7nv3isqy"))))
    (build-system emacs-build-system)
    (home-page "unspecified")
    (synopsis "major-mode for editing CMake sources")
    (description
      "This package provides syntax highlighting and indentation for CMakeLists.txt and
*.cmake source files.")
    (license license:bsd-3)))

(define-public emacs-zig-mode
  (package
    (name "emacs-zig-mode")
    (version "20211227.1108")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/ziglang/zig-mode.git")
               (commit "1ef8a13b93b3bdd20f86727b3a71572b02c421ef")))
        (sha256
          (base32 "06qgphf7341jyyzq2j9qpac6g7xj61kkvx70j82xg89r1ckrd37w"))))
    (build-system emacs-build-system)
    (home-page "https://github.com/zig-lang/zig-mode")
    (synopsis "A major mode for the Zig programming language")
    (description
      "This package provides a major mode for the Zig programming languages.")
    (license license:gpl3)))

(define-public emacs-cargo
  (package
    (name "emacs-cargo")
    (version "0.4.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://stable.melpa.org/packages/cargo-"
               version
               ".tar"))
        (sha256
          (base32 "1mk5lz9hl48q00qy028b3pbb1nmh8fp84074ijw8ynsxpn8dldc8"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-rust-mode))
    (home-page "unspecified")
    (synopsis "Emacs Minor Mode for Cargo, Rust's Package Manager.")
    (description
      "Cargo Minor mode.  Provides a number of key combinations and functions for
managing Cargo.")
    (license license:gpl3)))
