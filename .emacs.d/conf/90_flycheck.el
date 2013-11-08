(require 'flycheck)
(define-key global-map (kbd "C-c e") 'flycheck-next-error)
(define-key global-map (kbd "C-c E") 'flycheck-previous-error)
