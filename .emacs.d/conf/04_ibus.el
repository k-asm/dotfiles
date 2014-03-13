;; from http://www.emacswiki.org/emacs/LoadingLispFiles
(defmacro with-library (symbol &rest body)
      `(condition-case nil
           (progn
             (require ',symbol)
             ,@body)
         (error (message (format "I guess we don't have %s available." ',symbol))
                nil)))
    (put 'with-library 'lisp-indent-function 1)

(if run-linux
    (if run-x
        ;; x
        (progn
          ;; need apt ibus-el
          (with-library ibus
          (ibus-define-common-key ?\C-\s nil)
          (ibus-define-common-key ?\C-/ nil)
          (add-hook 'after-init-hook 'ibus-mode-on)
          (setq ibus-cursor-color '("limegreen" "white" "blue"))
          (define-key global-map (kbd "C-\\") 'ibus-toggle)))
      ;; terminal
      (progn
        ;; need apt emacs-mozc emacs-mozc-bin
        (with-library mozc
        (set-language-environment "Japanese")
        (setq default-input-method "japanese-mozc")
        (setq mozc-candidate-style 'overlay)
        (define-key global-map (kbd "C-\\") 'toggle-input-method)
        ;; nn -> ん
        (setq quail-japanese-use-double-n t)
        ;; dired で文字化けする
        (prefer-coding-system 'utf-8)))))
