(defun ac-cc-mode-setup ()
  (require 'auto-complete-clang-async)
  (setq ac-auto-start t)
  (setq ac-clang-complete-executable "~/.emacs.d/clang-complete")
  (setq ac-sources (append '(ac-source-clang-async
                             ac-source-gtags)
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
;; (defun my-c-mode-hook ()
;;   (c-set-style "stroustrup")
;;   (setq indent-tabs-mode nil)
;;   (define-key c-mode-base-map "\C-m" 'newline-and-indent))
;; (add-hook 'c-mode-hook 'my-c-mode-hook)
(defun my-c-common-mode ()
  (c-toggle-hungry-state 1)
  (gtags-mode 1))
(add-hook 'c-mode-common-hook 'my-c-common-mode)

;; c++-mode-hook
;; (defun my-c++-mode-hook ()
;;   (c-set-style "k&r")
;;   (setq indent-tabs-mode nil)
;;   (define-key c-mode-base-map "\C-m" 'newline-and-indent))
;; (add-hook 'c++-mode-hook 'my-c++-mode-hook)
(defun my-c++-common-mode ()
  (c-toggle-hungry-state 1)
  (gtags-mode 1))
(add-hook 'c++-mode-common-hook 'my-c++-common-mode)

