;; from http://d.hatena.ne.jp/syohex/20130904/1378310201
(require 'magit)

(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))
(defun my/magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))
(define-key magit-status-mode-map (kbd "q") 'my/magit-quit-session)
(defadvice git-commit-commit (after move-to-magit-buffer activate)
  (delete-window))
