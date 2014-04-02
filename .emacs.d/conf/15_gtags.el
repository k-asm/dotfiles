;; gtags
;; apt install global
;; cf: http://qiita.com/yewton@github/items/d9e686d2f2a092321e34
(setq gtags-prefix-key "\C-c")
(setq gtags-mode-hook
      '(lambda ()
         (define-key gtags-mode-map "\C-ct" 'gtags-find-tag)
         (define-key gtags-mode-map "\C-cr" 'gtags-find-rtag)
         (define-key gtags-mode-map "\C-cs" 'gtags-find-symbol)
         (define-key gtags-mode-map "\C-cf" 'gtags-parse-file2)
         (define-key gtags-mode-map "\C-cT" 'gtags-pop-stack)))

(defun gtags-parse-file2 ()
  (interactive)
  (if (gtags-get-rootpath)
      (let*
          ((root (gtags-get-rootpath))
           (path (buffer-file-name))
           (gtags-path-style 'root)
           (gtags-rootdir root))
        (if (string-match (regexp-quote root) path)
            (gtags-goto-tag
             (replace-match "" t nil path)
             "f" nil)
          ;; delegate to gtags-parse-file
          (gtags-parse-file)))
    ;; delegate to gtags-parse-file
    (gtags-parse-file)))

(defun update-gtags ()
  (interactive)
  (let ((rootdir (gtags-get-rootpath)))
    (when rootdir
      (let ((default-directory rootdir)
            (buffer (get-buffer-create "*gtags*")))
        (set-process-sentinel
         (start-file-process "gtags" buffer "gtags" "-iv")
         (lambda (process event)
           (cond
            ((string-match-p "finished" event)
             (message "GTAGS successfully updated."))
            ((string-match-p "abnormally" event)
             (message "update GTAGS error")))))))))
(add-hook 'after-save-hook 'update-gtags)
