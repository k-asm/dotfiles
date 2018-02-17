;; mac の場合、gls を使う
(if run-darwin
    (setq insert-directory-program "gls"))

;; うるさいので詳細は表示しない
(add-hook 'dired-mode-hook 'dired-hide-details-mode)

;; diredから"r"でファイル名をインライン編集する
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

(require 'dired-toggle)
(define-key global-map (kbd "C-c n") 'dired-toggle)

(require 'dired-subtree)
(define-key dired-mode-map (kbd "i") 'dired-subtree-insert)
(define-key dired-mode-map (kbd "TAB") 'dired-subtree-remove)
(setq dired-subtree-use-backgrounds nil)
