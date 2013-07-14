(setq initial-frame-alist
      (append (list '(cursor-type . box)
                    '(cursor-color . "RoyalBlue1")
                    '(mouse-color . "RoyalBlue1"))
              initial-frame-alist))

(if run-x
    (progn
      (setq initial-frame-alist
            (append (list '(width . 100)
                          '(height . 40))
                    initial-frame-alist))
      (set-default-font "ricty-13.5")))

(if run-cocoa
    (progn
      (setq initial-frame-alist
            (append (list '(width . 160)
                          '(height . 45))
                    initial-frame-alist))
      (set-default-font "ricty-14")))

(if (>= emacs-major-version 23)
    (progn
      (set-fontset-font (frame-parameter nil 'font)
                        'japanese-jisx0208
                        '("ricty" . "unicode-bmp"))
      (setq initial-frame-alist 
            (append (list '(alpha . 80)) initial-frame-alist))))

(if (or run-x run-cocoa)
    (progn
      (set-face-background 'default "black")
      (set-face-foreground 'default "azure3")
      (set-face-background 'fringe "black")
      (set-face-background 'region "SkyBlue")
      (set-face-foreground 'region "black")
      (set-face-background 'mode-line "grey10")
      (set-face-foreground 'mode-line "SkyBlue")
      (set-face-background 'highlight "grey10")
      (set-face-foreground 'highlight "red")))

(setq default-frame-alist initial-frame-alist)
(setq frame-title-format (format "emacs@%s : %%f" (system-name)))
