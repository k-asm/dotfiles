;; package.el
(require 'package)
(add-to-list 'package-archives '("melpa"     . "http://melpa.milkbox.net/packages/")  t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)
(load "~/.emacs.d/packages")

;; http://coderepos.org/share/browser/lang/elisp/init-loader/init-loader.el
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")

(eval-when-compile (require 'cl))
