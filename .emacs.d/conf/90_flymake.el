(require 'flymake)

(global-set-key "\C-ce" 'flymake-goto-next-error)
(global-set-key "\C-cE" 'flymake-goto-prev-error)

(set-face-background 'flymake-errline "red4")
(set-face-background 'flymake-warnline "dark slate blue")

(defun flymake-c-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-inplace))
	 (local-file  (file-relative-name
		       temp-file
		       (file-name-directory buffer-file-name))))
    (list "clang" (list "-Wall" "-Wextra" "-fsyntax-only" "-v" local-file))))
(push '("\\.c$" flymake-cc-init) flymake-allowed-file-name-masks)
(add-hook 'c-mode-hook 'flymake-mode-on)

(defun flymake-cc-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-inplace))
	 (local-file  (file-relative-name
		       temp-file
		       (file-name-directory buffer-file-name))))
    (list "clang++" (list "-Wall" "-Wextra" "-fsyntax-only" "-std=c++11" "-v" local-file))))
(push '("\\.cpp$" flymake-cc-init) flymake-allowed-file-name-masks)
(add-hook 'c++-mode-hook 'flymake-mode-on)

(defun flymake-ruby-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
	 (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" local-file))))
(push '("\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(add-hook 'ruby-mode-hook 'flymake-mode-on)

(require 'plenv)
(defun flymake-perl-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
	 (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    ;; (list (guess-plenv-perl-path) (list "-Ilocal/lib/perl5/" "-wc" local-file))))
    (list (guess-plenv-perl-path) (list "-wc" local-file))))
(push '("\\.pl$" flymake-perl-init) flymake-allowed-file-name-masks)
(push '("\\.pm$" flymake-perl-init) flymake-allowed-file-name-masks)
(push '("\\.t$" flymake-perl-init) flymake-allowed-file-name-masks)
(add-hook 'cperl-mode-hook 'flymake-mode-on)

(eval-after-load "perl-completion"
  '(progn
     (defadvice flymake-start-syntax-check-process 
       (around flymake-start-syntax-check-lib-path activate) 
       (plcmp-with-set-perl5-lib ad-do-it))))

(defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
  (setq flymake-check-was-interrupted t))
(ad-activate 'flymake-post-syntax-check)

(defun display-error-message ()
  (message (get-char-property (point) 'help-echo)))
(defadvice flymake-goto-prev-error (after flymake-goto-prev-error-display-message)
  (display-error-message))
(defadvice flymake-goto-next-error (after flymake-goto-next-error-display-message)
  (display-error-message))
(ad-activate 'flymake-goto-prev-error 'flymake-goto-prev-error-display-message)
(ad-activate 'flymake-goto-next-error 'flymake-goto-next-error-display-message)

