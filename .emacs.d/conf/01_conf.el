;; emacs server
(server-start)

;; 対応する括弧を光らせる
(show-paren-mode t)
;; ウィンドウ内に収まらないときだけ括弧内も光らせる
(setq show-paren-style 'mixed)

;; 行数，列数をつける
(line-number-mode t)
(column-number-mode t)

;; 色をつける
(global-font-lock-mode t)
(setq transient-mark-mode t)

;; ctrl-k で行全体を削除
(setq kill-whole-line t)
;; 最終行に必ず一行挿入する
(setq require-final-newline t)
;; バッファの最後でnewlineで新規行を追加するのを禁止する
(setq next-line-add-newlines nil)

;; 選択中に文字入れると削除
(delete-selection-mode t)

;; スクロールバー必要なし
(if run-x
    (toggle-scroll-bar nil))
;; ツールバー必要なし
(tool-bar-mode 0)
;; メニューバー必要なし
(menu-bar-mode 0)
;; ビジュアルベル必要なし
(setq visible-bell nil)
;; ビープ音必要なし
(setq ring-bell-function '(lambda ()))

;; カーソルの点滅をやめる
(blink-cursor-mode 0)

;; シンボリックリンクを開く時の質問を省略する
(setq vc-follow-symlinks t)

;; tab->space
(setq-default indent-tabs-mode nil)

;; right-side > return
(setq truncate-lines nil)
(setq truncate-partial-width-windows nil)

;; linum
(require 'linum)
(global-linum-mode t)

;; gdb
(setq gdb-many-windows t)
(setq gdb-use-separate-io-buffer t)

;; wind-move
(windmove-default-keybindings)
(setq windmove-wrap-around t)
;;; enable wind-move key in tmux
(global-set-key "\M-[1;2A" 'windmove-up)
(global-set-key "\M-[1;2B" 'windmove-down)
(global-set-key "\M-[1;2C" 'windmove-right)
(global-set-key "\M-[1;2D" 'windmove-left)

;; hiline
(global-hl-line-mode)

;; カーソルの場所を保存する
(require 'saveplace)
(setq-default save-place t)

;; backup
(setq make-backup-files t)
(setq backup-directory-alist
  (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
    backup-directory-alist))
(setq version-control     t)  ; 実行の有無
(setq kept-new-versions   5)  ; 最新の保持数
(setq kept-old-versions   1)  ; 最古の保持数
(setq delete-old-versions t)  ; 範囲外を削除

;; uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; whitespace
;;; 空白や長すぎる行を視覚化する。
(require 'whitespace)
(setq whitespace-style '(face              ; faceを使って視覚化する。
                         trailing          ; 行末の空白を対象とする。
                         tab-mark          ; タブは下の設定を利用して可視化する。
                         space-before-tab  ; タブの前にあるスペースを対象とする。
                         space-after-tab)) ; タブの後にあるスペースを対象とする。
(setq whitespace-display-mappings
      '((tab-mark   ?\t   [?\xBB ?\t]))) ; タブの代わりにこれを表示

;;; デフォルトで視覚化を有効にする。
(global-whitespace-mode 1)

;; 補完
;;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;;; 補完可能なものを随時表示
;;; 少しうるさい
(icomplete-mode 1)

;; 履歴
;;; 履歴数を大きくする
(setq history-length 10000)

;;; ミニバッファの履歴を保存する
(savehist-mode 1)

;;; 最近開いたファイルを保存する数を増やす
(setq recentf-max-saved-items 10000)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; autopair
(electric-pair-mode 0)
(require 'autopair)
(autopair-global-mode t)

;; 終了する時に確認するようにする
(setq confirm-kill-emacs 'yes-or-no-p)

;; 矩形選択
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; load environment value
(let ((envs '("PATH")))
  (exec-path-from-shell-copy-envs envs))
