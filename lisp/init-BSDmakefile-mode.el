
(add-hook 'makefile-bsdmake-mode-hook '(lambda ()
					 (interactive)
					 (peng-local-set-key (kbd "C-c C-v") 'compile)
					 ))

(add-hook 'makefile-mode-hook '(lambda ()
					 (interactive)
					 (peng-local-set-key (kbd "C-c C-v") 'compile)
					 ))
(provide 'init-BSDmakefile-mode)
