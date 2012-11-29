;; verilog
(defun my-verilog-mode-hook ()
  (setq verilog-auto-newline nil)
  (setq verilog-auto-indent-on-newline nil)
  (setq verilog-auto-endcomments t)
  (setq verilog-indent-begin-after-if t)
  (setq verilog-indent-tabs-mode nil)
  (setq verilog-tab-always-indent t))
(add-hook 'verilog-mode-hook 'my-verilog-mode-hook)

