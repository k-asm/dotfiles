(if run-x
    (progn
      (setq initial-frame-alist
            (append (list '(width . 100)
                          '(height . 40))
                    initial-frame-alist))
      (set-default-font "ricty-13.5")))

(if (and run-cocoa (display-graphic-p))
    (progn
      (setq initial-frame-alist
            (append (list '(width . 160)
                          '(height . 45))
                    initial-frame-alist))
      (set-default-font "ricty-14")))

(if (and (>= emacs-major-version 23) (display-graphic-p))
    (progn
      (set-fontset-font (frame-parameter nil 'font)
                        'japanese-jisx0208
                        '("ricty" . "unicode-bmp"))
      (setq initial-frame-alist
            (append (list '(alpha . 95)) initial-frame-alist))))

(setq default-frame-alist initial-frame-alist)
(setq frame-title-format (format "emacs@%s : %%f" (system-name)))

(when (require 'color-theme)
  (color-theme-initialize)
  (when (require 'color-theme-solarized)
    (color-theme-solarized-dark)))

(set-face-background 'whitespace-trailing "red4")
