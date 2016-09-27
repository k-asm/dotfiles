(require 'helm-config)
(require 'helm-gtags)
(require 'helm-ag)

(helm-mode 1)
(define-key global-map (kbd "M-x")     'helm-M-x)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-c h")   'helm-mini)

(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)

(add-hook 'helm-gtags-mode-hook
          '(lambda ()
              (local-set-key (kbd "C-c t") 'helm-gtags-find-tag)
              (local-set-key (kbd "C-c R") 'helm-gtags-find-rtag)
              (local-set-key (kbd "C-c s") 'helm-gtags-find-symbol)
              (local-set-key (kbd "C-t")   'helm-gtags-pop-stack)))

(setq helm-ag-base-command "ag --nocolor --nogroup --hidden")
(define-key global-map (kbd "C-c g") 'helm-ag)
