(global-set-key [home] 'beginning-of-line)
(global-set-key [select] 'end-of-line)
(define-key global-map (kbd "C-a") 'beginning-of-line)
(define-key global-map (kbd "C-e") 'end-of-line)
(define-key global-map (kbd "M-g") 'goto-line)

(define-key global-map (kbd "C-c r") 'replace-regexp)
(define-key global-map (kbd "C-c q") 'query-replace-regexp)
(define-key global-map (kbd "C-c i") 'indent-region)

(define-key global-map (kbd "C-h") 'delete-backward-char)

(define-key global-map (kbd "C-x SPC") 'cua-set-rectangle-mark)

;; for minibuffer
(keyboard-translate ?\C-h ?\C-?)

;; command -> meta
(setq ns-command-modifier 'meta)
