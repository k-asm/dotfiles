(defun ac-cc-mode-setup ()
  (setq ac-auto-start t)
  (setq ac-sources (append '(ac-source-gtags)
                           ac-sources))
  (ac-clang-launch-completion-process))

(add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
(add-hook 'c++-mode-common-hook 'ac-cc-mode-setup)

;; google-c-style
(require 'google-c-style)
(setq auto-mode-alist
      (append '(("\\.h\\(\\..+\\)?$" . c++-mode))
              auto-mode-alist))
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(add-hook 'c++-mode-common-hook 'google-set-c-style)
(add-hook 'c++-mode-common-hook 'google-make-newline-indent)

;; c-mode-hook
(defun my-c-common-mode ()
  (c-toggle-hungry-state 1)
  (gtags-mode 1))
(add-hook 'c-mode-common-hook 'my-c-common-mode)

;; c++-mode-hook
(defun my-c++-common-mode ()
  (c-toggle-hungry-state 1)
  (gtags-mode 1))
(add-hook 'c++-mode-common-hook 'my-c++-common-mode)
