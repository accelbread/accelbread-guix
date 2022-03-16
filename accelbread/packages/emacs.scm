(define-module (accelbread packages emacs)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (gnu packages)
  #:use-module (gnu packages aspell)
  #:use-module (gnu packages base)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages image)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages webkit)
  #:use-module (accelbread packages emacs-xyz))

(define-public emacs-accelbread
  (let ((commit "48038cb2b2191980b3862be2c7d408e6ba6ee0d8")
        (revision "0"))
    (package
     (inherit emacs-next)
     (name "emacs-accelbread")
     (version (git-version "29.0.50" revision commit))
     (source
      (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://git.savannah.gnu.org/git/emacs.git/")
             (commit commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ma9ml4vkm2bsvmcs09phy78hq4fl5mqwhmzfmii46l4dbvwgkag"))))
     (arguments
      (substitute-keyword-arguments
       (package-arguments emacs-next)
       ((#:make-flags flags ''())
        `(cons* "NATIVE_FULL_AOT=1" ,flags))
       ((#:configure-flags flags ''())
        `(cons* "--with-native-compilation" "--with-pgtk"
                "--with-xwidgets" "--with-imagemagick" ,flags))
       ((#:phases phases)
        `(modify-phases
          ,phases
          (add-before
           'configure 'set-libgccjit-path
           (lambda* (#:key inputs #:allow-other-keys)
                    (let ((libgccjit-libdir
                           (string-append (assoc-ref inputs "libgccjit")
                                          "/lib/gcc/" %host-type "/"
                                          ,(package-version libgccjit) "/")))
                      (setenv "LIBRARY_PATH"
                              (string-append libgccjit-libdir ":"
                                             (getenv "LIBRARY_PATH"))))
                    #t))
          (add-after
           'unpack 'patch-driver-options
           (lambda* (#:key inputs #:allow-other-keys)
                    (substitute*
                     "lisp/emacs-lisp/comp.el"
                     (("\\(defcustom native-comp-driver-options nil")
                      (format
                       #f "(defcustom native-comp-driver-options '(~s ~s ~s ~s)"
                       (string-append
                        "-B" (assoc-ref inputs "binutils") "/bin/")
                       (string-append
                        "-B" (assoc-ref inputs "glibc") "/lib/")
                       (string-append
                        "-B" (assoc-ref inputs "libgccjit") "/lib/")
                       (string-append
                        "-B" (assoc-ref inputs "libgccjit") "/lib/gcc/"))))
                    #t))))))
     (native-inputs
      (modify-inputs (package-native-inputs emacs-next)
                     (prepend gcc)))
     (inputs
      `(("glibc" ,glibc)
        ("libgccjit" ,libgccjit)
        ("webkitgtk" ,webkitgtk-with-libsoup2)
        ("imagemagick" ,imagemagick)
        ("lcms" ,lcms)
        ("libwebp" ,libwebp)
        ,@(package-inputs emacs-next)))
     (propagated-inputs
      (modify-inputs (package-propagated-inputs emacs-next)
                     (prepend aspell
                              aspell-dict-en))))))
