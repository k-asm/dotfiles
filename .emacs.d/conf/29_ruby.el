(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '(".gemspec$" . enh-ruby-mode))

;; C-c C-s inf-ruby
(defun enh-ruby-mode-setup()
  (require 'ruby-block)
  (require 'ruby-end)
  (ruby-block-mode t)
  (setq enh-ruby-deep-arglist t)
  (setq enh-ruby-bounce-deep-indent t)
  (local-set-key (kbd "C-c s") 'yari)
  (local-set-key (kbd "C-c d") 'yari-anything))
(add-hook 'enh-ruby-mode-hook 'enh-ruby-mode-setup)

