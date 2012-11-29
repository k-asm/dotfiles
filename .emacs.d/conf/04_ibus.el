(if (eq system-type 'gnu/linux)
    (progn
      (require 'ibus)
      (ibus-define-common-key ?\C-\s nil)
      (ibus-define-common-key ?\C-/ nil)
      (add-hook 'after-init-hook 'ibus-mode-on)
      (setq ibus-cursor-color '("limegreen" "white" "blue"))
      (global-set-key "\C-\\" 'ibus-toggle)))
