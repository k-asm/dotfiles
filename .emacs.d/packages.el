(require 'cl)

(defvar installing-package-list
  '( auto-complete
     autopair
     diminish
     exec-path-from-shell
     flycheck
     helm
     helm-ag
     helm-gtags
     init-loader
     neotree
     popwin
     cperl-mode
     enh-ruby-mode
     markdown-mode
     web-mode
     google-c-style
     ruby-block
     ruby-end
    ))

(let ((not-installed (loop for x in installing-package-list
                           when (not (package-installed-p x))
                           collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))
