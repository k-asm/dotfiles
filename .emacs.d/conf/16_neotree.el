(require 'neotree)

(setq neo-show-hidden-files t)
(setq neo-keymap-style 'concise)
(setq neo-smart-open t)
(when neo-persist-show
  (add-hook 'popwin:before-popup-hook
            (lambda () (setq neo-persist-show nil)))
  (add-hook 'popwin:after-popup-hook
            (lambda () (setq neo-persist-show t))))

(define-key global-map (kbd "C-c n") 'neotree-toggle)
