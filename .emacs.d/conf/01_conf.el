;; 対応する括弧を光らせる
(show-paren-mode t)

;; 行数，列数をつける
(line-number-mode t)
(column-number-mode t)

;; 色をつける
(global-font-lock-mode t)
(setq transient-mark-mode t)

;; ctrl-k で行全体を削除
(setq kill-whole-line t)
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

;; シンボリックリンクを開く時の質問を省略する
(setq vc-follow-symlinks t)

;; tab->space
(setq-default indent-tabs-mode nil)

;; right-side > return
(setq truncate-lines nil)
(setq truncate-partial-width-windows nil)

;; electric-pair-mode
(when (>= emacs-major-version 24)
  (electric-pair-mode t))

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

;; mouse-wheel ON
(mouse-wheel-mode t)
(setq mouse-wheel-follow-mouse t)

;; hiline
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
     (:background  "#98FB98"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)

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

