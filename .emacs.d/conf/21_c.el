;; google-c-style
(require 'google-c-style)
(setq auto-mode-alist
      (append '(("\\.h\\(\\..+\\)?$" . c++-mode))
              auto-mode-alist))
(add-hook 'c-mode-hook 'google-set-c-style)
(add-hook 'c-mode-hook 'google-make-newline-indent)
(add-hook 'c++-mode-hook 'google-set-c-style)
(add-hook 'c++-mode-hook 'google-make-newline-indent)

;; c-mode-hook
(defun my-c-common-mode ()
  (c-toggle-hungry-state 1)
  (gtags-mode 1))
(add-hook 'c-mode-hook 'my-c-common-mode)

;; c++-mode-hook
(defun my-c++-common-mode ()
  (c-toggle-hungry-state 1)
  (gtags-mode 1))
(add-hook 'c++-mode-hook 'my-c++-common-mode)
