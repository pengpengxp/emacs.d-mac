(add-hook 'bookmark-bmenu-mode-hook '(lambda ()
				       (interactive)
				       (hl-line-mode)
				       ))
;;;for bookmark
(setq bookmark-save-flag 1)		;let bookmark auto-saved when I change it
(define-key global-map (kbd "C-c j") 'bookmark-jump)

(provide 'init-bookmark-bmemu-mode)
