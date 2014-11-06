;;; for compilation mode
(defun peng-compilation-mode ()
  "cumstomize my compilation-mode"
  (local-set-key (kbd "DEL") (lambda ()
  		      (interactive)
  		      (bury-buffer)
  		      (delete-window)))
  (switch-to-buffer-other-window "*compilation*")
)
(add-hook 'compilation-mode-hook 'peng-compilation-mode)

(provide 'init-compilation)
