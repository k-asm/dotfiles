(require 'flycheck)

(define-key global-map (kbd "C-c e") 'flycheck-next-error)
(define-key global-map (kbd "C-c E") 'flycheck-previous-error)

(add-hook 'c-mode-hook 'flycheck-mode)
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'ruby-mode-hook 'flycheck-mode)
