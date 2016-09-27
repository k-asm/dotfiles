;; ディレクトリ
;;; mac の場合、gls を使う
(if run-darwin
    (setq insert-directory-program "gls"))

;;; diredを便利にする
(require 'dired-x)

;;; diredから"r"でファイル名をインライン編集する
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;;; 二画面ファイラっぽくする
(setq dired-dwim-target t)
