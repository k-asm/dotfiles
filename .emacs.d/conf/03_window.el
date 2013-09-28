(if (display-graphic-p)
    (progn
      (cond (run-linux
             (progn
               (setq initial-frame-alist
                     (append (list '(width . 100)
                                   '(height . 40))
                             initial-frame-alist))
               (set-default-font "ricty-13.5")))
            (run-darwin
             (progn
               (setq initial-frame-alist
                     (append (list '(width . 160)
                                   '(height . 45))
                             initial-frame-alist))
               (set-default-font "ricty-14"))))
      (if (>= emacs-major-version 23)
          (progn
            (set-fontset-font (frame-parameter nil 'font)
                              'japanese-jisx0208
                              '("ricty" . "unicode-bmp"))
            (setq initial-frame-alist
                  (append (list '(alpha . 95)) initial-frame-alist))))))

(setq default-frame-alist initial-frame-alist)
(setq frame-title-format (format "emacs@%s : %%f" (system-name)))

(when (require 'color-theme)
  (color-theme-initialize)
  (when (require 'color-theme-solarized)
    (color-theme-solarized-dark)))

(set-face-background 'whitespace-trailing "red4")
