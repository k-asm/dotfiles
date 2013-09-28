(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '(".gemspec$" . ruby-mode))

;; C-c C-s inf-ruby
(defun ruby-mode-setup()
  (require 'ruby-block)
  (require 'ruby-end)
  (ruby-block-mode t)
  (setq tab-width 2)
  (setq ruby-indent-level tab-width)
  (setq ruby-deep-indent-paren-style nil)
  (setq ruby-block-highlight-toggle t)
  (local-set-key (kbd "C-c s") 'yari)
  (local-set-key (kbd "C-c d") 'yari-anything))
(add-hook 'ruby-mode-hook 'ruby-mode-setup)

;; http://willnet.in/13
(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))
