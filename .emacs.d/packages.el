(require 'cl)

(defvar installing-package-list
  '( init-loader
     auto-install
     plenv
     auto-complete
     haml-mode
     sass-mode
     js2-mode
     markdown-mode
     inf-ruby
     ruby-block
     ruby-end
     google-c-style
     auto-complete-clang-async
     flymake
     yari
     gist
     cperl-mode
     lua-mode
     magit
     color-theme-solarized
     yaml-mode
     popwin
     ag
     wgrep-ag
    ))

(let ((not-installed (loop for x in installing-package-list
                           when (not (package-installed-p x))
                           collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))

