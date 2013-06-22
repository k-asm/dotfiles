;; load environment value
(load-file (expand-file-name "~/.emacs.d/shellenv.el"))
(dolist (path (reverse (split-string (getenv "PATH") ":")))
  (add-to-list 'exec-path path))

;; defun

(defun eshell-cd-default-directory ()
  (interactive)
  (let ((dir default-directory))
    (eshell)
    (cd dir)
    (eshell-interactive-print (concat "cd " dir "\n"))
    (eshell-emit-prompt)))
(define-key global-map (kbd "C-c d") 'eshell-cd-default-directory)

(defun my-count-words-region (start end)
  (interactive "r")
  (save-excursion
    (let ((count 0))
      (goto-char start)
      (while (<= (point) end)
        (forward-word)
        (setq count (1+ count)))
      (message "this region includes %d words." (1- count)))))

(defun my-count-words-buffer ()
  (interactive)
  (my-count-words-region (point-min) (point-max)))

(defun my-count-lines-region (start end)
  (interactive "r")
  (save-excursion
    (let ((count 0))
      (goto-char start)
      (while (/= (point) end)
        (forward-line)
        (setq count (1+ count)))
      (message "this region includes %d lines." count))))

(defun my-count-lines-buffer ()
  (interactive)
  (my-count-lines-region (point-min) (point-max)))

(defun find-library-file (library)
  (interactive "sFind library file: ")
  (let ((path (cons "" load-path)) exact match elc test found)
    (while (and (not match) path)
      (setq test (concat (car path) "/" library)
            match (if (condition-case nil
                          (file-readable-p test)
                        (error nil))
                      test)
            path (cdr path)))
    (setq path (cons "" load-path))
    (or match
        (while (and (not elc) path)
          (setq test (concat (car path) "/" library ".elc")
                elc (if (condition-case nil
                            (file-readable-p test)
                          (error nil))
                        test)
                path (cdr path))))
    (setq path (cons "" load-path))
    (while (and (not match) path)
      (setq test (concat (car path) "/" library ".el")
            match (if (condition-case nil
                          (file-readable-p test)
                        (error nil))
                      test)
            path (cdr path)))
    (setq found (or match elc))
    (if found
        (progn
          (find-file found)
          (and match elc
               (message "(library file %s exists)" elc)
               (sit-for 1))
          (message "Found library file %s" found))
      (error "Library file \"%s\" not found." library))))
