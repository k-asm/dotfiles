(add-hook 'c-mode-common-hook 'flycheck-mode)
(add-hook 'c++-mode-common-hook 'flycheck-mode)

;; https://github.com/flycheck/flycheck/issues/225
(defun flycheck-clang-include-local-dir ()
  "Add the current dir to the clang checker include list"
  (if (derived-mode-p 'c-mode 'c++-mode)
      (setq flycheck-clang-include-path
            (list (file-name-directory (buffer-file-name))))))
(add-hook 'flycheck-before-syntax-check-hook 'flycheck-clang-include-local-dir)
