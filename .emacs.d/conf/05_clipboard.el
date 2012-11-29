(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(if (or (eq system-type 'darwin) (eq system-type 'mac))
    (progn
      (setq interprogram-cut-function 'paste-to-osx)
      (setq interprogram-paste-function 'copy-from-osx)))

;; clipboard setting
;; (setq interprogram-paste-function      
;;       (lambda ()
;;         (shell-command-to-string "xsel -b -o")))
;; (setq interprogram-cut-function      
;;       (lambda (text &optional rest)
;;         (let* ((process-connection-type nil)
;;                (proc (start-process "xsel" "*Messages*" "xsel" "-b" "-i")))
;;           (process-send-string proc text)
;;           (process-send-eof proc))))
