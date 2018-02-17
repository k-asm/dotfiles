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

;; http://d.hatena.ne.jp/mooz/20100119/p1
;; http://d.hatena.ne.jp/khiker/20100119/window_resize
(defun window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
              -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
              -1))
        action c)
    (catch 'end-flag
      (while t
        (setq action
              (read-key-sequence-vector (format "size[%dx%d]"
                                                (window-width)
                                                (window-height))))
        (setq c (aref action 0))
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))
              ((= c ?h)
               (shrink-window-horizontally dx))
              ((= c ?j)
               (enlarge-window dy))
              ((= c ?k)
               (shrink-window dy))
              ;; otherwise
              (t
               (let ((last-command-char (aref action 0))
                     (command (key-binding action)))
                 (when command
                   (call-interactively command)))
               (message "Quit")
               (throw 'end-flag t)))))))
(define-key global-map (kbd "C-c C-r") 'window-resizer)
