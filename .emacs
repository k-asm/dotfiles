(add-to-list 'load-path "~/.emacs.d/elisp")

(require 'package)
(add-to-list 'package-archives '("melpa"     . "http://melpa.milkbox.net/packages/")  t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)
(load "~/.emacs.d/packages")

(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")

(eval-when-compile (require 'cl))
