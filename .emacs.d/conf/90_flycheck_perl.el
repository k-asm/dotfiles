(flycheck-define-checker perl-libs
  "A Perl syntax checker using the Perl interpreter.

This syntax checker uses Project::Libs to add module directories.

See URL `http://www.perl.org'."
  :command ("perl" "-MProject::Libs" "-w" "-c" source-inplace)
  :error-patterns
  ((error line-start (minimal-match (message))
          " at " (file-name) " line " line
          (or "." (and ", " (zero-or-more not-newline))) line-end))
  :modes (perl-mode cperl-mode))

(defvar flycheck-perl-exclude-list
  '( cpanfile
    ))

(defun my/flycheck-cperl-mode-hook()
  (let ((name (file-name-nondirectory buffer-file-name)))
    (if (and name (loop for x in flycheck-perl-exclude-list
                        when (string= name x)
                        collect x))
        ;; flycheck off
        (flycheck-mode -1)
      (progn
        ;; flycheck on
        (flycheck-mode 1)
        (setq flycheck-checker 'perl-libs)))))

(add-hook 'cperl-mode-hook 'my/flycheck-cperl-mode-hook)
