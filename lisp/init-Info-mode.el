(add-hook 'Info-mode-hook '(lambda ()
			     (setq evil-emacs-state-cursor 'box)
			     (local-set-key (kbd "<tab>") 'Info-next-reference)
			     ))

(provide 'init-Info-mode)
