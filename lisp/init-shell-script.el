;;shell-script-mode 
;;sh-mode is the alias of shell-script-mode
(defun peng-shell-script-mode ()
  (hl-line-mode 1))
(add-hook 'sh-mode-hook 'peng-shell-script-mode)

(provide 'init-shell-script)
