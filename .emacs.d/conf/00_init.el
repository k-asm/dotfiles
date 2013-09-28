(defvar run-linux
  (equal system-type 'gnu/linux))
(defvar run-darwin
  (equal system-type 'darwin))

(defvar run-x
  (equal window-system 'x))
(defvar run-cocoa
  (equal window-system 'ns))

;; use utf-8
(set-language-environment 'Japanese)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
