(setq mouse-drag-copy-region nil)
(setq x-select-enable-primary nil)
(setq x-select-enable-clipboard t)
(setq select-active-regions t)

(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (setenv "__CF_USER_TEXT_ENCODING" "0x1F5:0x8000100:14")
      (process-send-string proc text)
      (process-send-eof proc))))

(if run-darwin
    (progn
      (setq interprogram-cut-function 'paste-to-osx)
      (setq interprogram-paste-function 'copy-from-osx)))

;; clipboard setting
;; apt install xsel
(if run-linux
    (progn
      (setq interprogram-paste-function
            (lambda ()
              (shell-command-to-string "xsel -b -o")))
      (setq interprogram-cut-function
            (lambda (text &optional rest)
              (let* ((process-connection-type nil)
                     (proc (start-process "xsel" "*Messages*" "xsel" "-b" "-i")))
                (process-send-string proc text)
                (process-send-eof proc))))))

