(require 'popwin)

(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:special-display-config
      '(("*helm" :regexp t :height 0.4)))
