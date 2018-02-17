(require 'iflipb)
(setq iflipb-ignore-buffers nil)

(global-set-key (kbd "M-o") 'switch-to-next-buffer)
(global-set-key (kbd "M-O") 'switch-to-prev-buffer)
(global-set-key (kbd "M-h") 'iflipb-next-buffer)
(global-set-key (kbd "M-H") 'iflipb-previous-buffer)
