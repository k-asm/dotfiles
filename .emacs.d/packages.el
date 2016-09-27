(require 'cl)

(defvar installing-package-list
  '( init-loader
     auto-complete
     markdown-mode
     ruby-block
     ruby-end
     google-c-style
     cperl-mode
     popwin
     diminish
     autopair
     flycheck
     web-mode
     enh-ruby-mode
     exec-path-from-shell
     helm
     helm-ag
     helm-gtags
    ))

(let ((not-installed (loop for x in installing-package-list
                           when (not (package-installed-p x))
                           collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))
