(require 'auto-complete)
(require 'auto-complete-config)

(ac-config-default)
(setq ac-auto-start 2)   ; 2文字以上の単語の時補完を開始する
(setq ac-use-menu-map t) ; C-n, C-p で補完を選択

(global-auto-complete-mode t)
