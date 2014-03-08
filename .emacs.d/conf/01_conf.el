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
(toggle-scroll-bar nil)
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

;; 関数名を表示する
(which-function-mode t)

;; tab->space
(setq-default indent-tabs-mode nil)

;; right-side > return
(setq truncate-lines nil)
(setq truncate-partial-width-windows nil)

;; electric-pair-mode
(when (>= emacs-major-version 24)
  (electric-pair-mode 0))

;; linum
(when (> emacs-major-version 22)
 (progn
   (require 'linum)
   (global-linum-mode t)))

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

;; mouse-wheel ON
(mouse-wheel-mode t)
(setq mouse-wheel-follow-mouse t)

;; hiline
(global-hl-line-mode)

;; カーソルの場所を保存する
(require 'saveplace)
(setq-default save-place t)

;; auto-complete
;; (package-install 'auto-complete)
(require 'auto-complete)
(global-auto-complete-mode t)
(require 'auto-complete-config)
(ac-config-default)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
(add-hook 'auto-complete-mode-hook 'ac-common-setup)

;; backup
(setq make-backup-files t)
(setq backup-directory-alist
  (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
    backup-directory-alist))

;; gtags
(autoload 'gtags-mode "gtags" "" t)
(setq gtags-mode-hook
      '(lambda ()
         (local-set-key "\M-t" 'gtags-find-tag)
         (local-set-key "\M-r" 'gtags-find-rtag)
         (local-set-key "\M-s" 'gtags-find-symbol)
         (local-set-key "\C-t" 'gtags-pop-stack)))

;; uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; whitespace
;;; 空白や長すぎる行を視覚化する。
(require 'whitespace)
;;; 1行が80桁を超えたら長すぎると判断する。
(setq whitespace-line-column 80)
(setq whitespace-style '(face              ; faceを使って視覚化する。
                         trailing          ; 行末の空白を対象とする。
                         lines-tail        ; 長すぎる行のうち
                                           ; whitespace-line-column以降のみを
                                           ; 対象とする。
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

;;; 部分一致の補完機能を使う
;;; p-bでprint-bufferとか
(when (<= emacs-major-version 23)
  (partial-completion-mode t))

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

;; 圧縮
;;; gzファイルも編集できるようにする
(auto-compression-mode t)

;; diff
;;; ediffを1ウィンドウで実行
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;;; diffのオプション
(setq diff-switches '("-u" "-p" "-N"))

;; 実行権
;;; ファイルの先頭に#!...があるファイルを保存すると実行権をつける
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; スペルチェック
(setq-default flyspell-mode t)
(setq ispell-dictionary "american")

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; autopair
(require 'autopair)
(autopair-global-mode t)

;; 終了する時に確認するようにする
(setq confirm-kill-emacs 'yes-or-no-p)

;; 矩形選択
(cua-mode t)
(setq cua-enable-cua-keys nil)
