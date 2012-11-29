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

;; tab->space
(setq-default indent-tabs-mode nil)

;; right-side > return
(setq truncate-lines nil)
(setq truncate-partial-width-windows nil)

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

;; auto-complete
;; (package-install 'auto-complete)
(require 'auto-complete)
(global-auto-complete-mode t)

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

