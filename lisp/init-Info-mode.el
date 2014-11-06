(add-hook 'Info-mode-hook '(lambda ()
			     (interactive)
			     (setq evil-emacs-state-cursor 'box)))

(provide 'init-Info-mode)
