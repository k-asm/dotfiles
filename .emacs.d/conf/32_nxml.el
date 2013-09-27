(add-hook 'nxml-mode-hook
          (lambda ()
            (setq auto-fill-mode -1)
            (setq nxml-slash-auto-complete-flag t)      ; スラッシュの入力で終了タグを自動補完
            (setq nxml-child-indent 4)                  ; タグのインデント幅
            (setq nxml-attribute-indent 4)              ; 属性のインデント幅
            (setq tab-width 4)
            (setq indent-tab-mode -1)
            ))
