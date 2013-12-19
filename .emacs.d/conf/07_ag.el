(require 'ag)
(require 'wgrep)

(add-hook 'ag-mode-hook
          (lambda ()
            (setq ag-highlight-search t)
            (setq ag-reuse-buffers t)))
