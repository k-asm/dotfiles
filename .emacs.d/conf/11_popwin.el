(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

(setq popwin:special-display-config
      '(("*anything" :regexp t :height 0.4)
        ("*compilation*" :height 0.4)
        ("*grep*" :stick t)))
