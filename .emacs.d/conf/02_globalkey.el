(global-set-key [home] 'beginning-of-line)
(global-set-key [select] 'end-of-line)
(global-set-key "\C-a" 'beginning-of-line)
(global-set-key "\C-e" 'end-of-line)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\C-cr" 'replace-string)
(global-set-key "\C-cl" 'load-file)

;; alt <-> meta
(custom-set-variables
 '(ns-alternate-modifier 'alt)
 '(ns-command-modifier 'meta))

