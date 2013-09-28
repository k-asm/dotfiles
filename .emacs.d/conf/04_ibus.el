(if run-linux
    (if run-x
        ;; x
        (progn
          ;; need apt ibus-el
      (require 'ibus)
      (ibus-define-common-key ?\C-\s nil)
      (ibus-define-common-key ?\C-/ nil)
      (add-hook 'after-init-hook 'ibus-mode-on)
      (setq ibus-cursor-color '("limegreen" "white" "blue"))
      (define-key global-map (kbd "C-\\") 'ibus-toggle))
      ;; terminal
      (progn
        ;; need apt emacs-mozc emacs-mozc-bin
        (require 'mozc)
        (set-language-environment "Japanese")
        (setq default-input-method "japanese-mozc")
        (setq mozc-candidate-style 'overlay)
        (define-key global-map (kbd "C-\\") 'toggle-input-method)
        ;; nn -> ん
        (setq quail-japanese-use-double-n t)
        ;; dired で文字化けする
        (prefer-coding-system 'utf-8))))
