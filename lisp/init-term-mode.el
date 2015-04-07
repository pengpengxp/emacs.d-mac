(add-hook 'term-mode-hook '(lambda ()
			     (interactive)
			     (company-mode -1)
			     ))

(provide 'init-term-mode)
