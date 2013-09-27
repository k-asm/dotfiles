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

;; (defun ac-ruby-mode-setup ()
;;    (require 'rcodetools)
;;    (require 'auto-complete-ruby)
;;    (make-local-variable 'ac-omni-completion-sources)
;;    (setq ac-omni-completion-sources '(("\\.\\=" . (ac-source-rcodetools)))))
;; (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)

;; (require 'anything-rcodetools)
;; (setq rct-find-tag-if-available nil)
;; (setq rct-get-all-methods-command "PAGER=cat fri -l")

;; (defun ac-ruby-mode-setup ()
;;   (local-set-key (kbd "M-RET") 'rct-complete-symbol)
;;   (local-set-key (kbd "C-c d") 'rct-ri)
;;   (local-set-key (kbd "C-c C-d") 'xmp))
;; (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)

;; ;; start fastri-server
;; (defun start-fastri-server()
;;   (let*
;;       ((progname "fastri-server")
;;        (buffname (format "*%S*" progname)))
;;     (start-process progname buffname progname)))
;; (start-fastri-server)

