;; C
(require 'google-c-style)
(setq auto-mode-alist
      (append '(("\\.h\\(\\..+\\)?$" . c++-mode))
              auto-mode-alist))
(add-hook 'c-mode-hook 'google-set-c-style)
(add-hook 'c-mode-hook 'google-make-newline-indent)
(add-hook 'c++-mode-hook 'google-set-c-style)
(add-hook 'c++-mode-hook 'google-make-newline-indent)

(defun my-c-common-mode ()
  (c-toggle-hungry-state 1))
(add-hook 'c-mode-hook 'my-c-common-mode)

(defun my-c++-common-mode ()
  (c-toggle-hungry-state 1))
(add-hook 'c++-mode-hook 'my-c++-common-mode)

;; Ruby
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '(".gemspec$" . enh-ruby-mode))

(defun enh-ruby-mode-setup()
  (require 'ruby-block)
  (require 'ruby-end)
  (ruby-block-mode t)
  (setq enh-ruby-deep-arglist t)
  (setq enh-ruby-bounce-deep-indent t))
(add-hook 'enh-ruby-mode-hook 'enh-ruby-mode-setup)

;; Perl
(defalias 'perl-mode 'cperl-mode)
(add-to-list 'auto-mode-alist '("\\.t\\'"      . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.psgi\\'"   . cperl-mode))
(add-to-list 'auto-mode-alist '("\cpanfile\\'" . cperl-mode))

(defun my-perl-common-mode ()
  (setq cperl-electric-lbrace-space nil)
  (setq cperl-electric-parens nil)
  (setq cperl-indent-parens-as-block t)
  (setq cperl-close-paren-offset -4)
  (setq cperl-indent-level 4)
  (setq cperl-label-offset -4)
  (setq cperl-continued-statement-offset 2)
  (setq cperl-highlight-variables-indiscriminately t)
  (setq cperl-indent-subs-specially nil))
(add-hook 'cperl-mode-hook 'my-perl-common-mode)

;; Markdown
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tx$"    . web-mode))

;; golang
(require 'go-autocomplete)
