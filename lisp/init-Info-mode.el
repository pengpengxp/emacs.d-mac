(add-hook 'Info-mode-hook '(lambda ()
			     (setq evil-emacs-state-cursor 'box)
			     (local-set-key (kbd "<tab>") 'Info-next-reference)
			     ))

;;; pengpengxp's evil-info-mode
(require 'evil)
(evil-set-initial-state 'Info-mode 'normal)
(add-hook 'Info-mode-hook '(lambda ()
			     (interactive)
			     (define-key evil-normal-state-local-map (kbd "<tab>") 'Info-next-reference)
			     (define-key evil-normal-state-local-map (kbd "TAB") 'Info-next-reference)
			     (define-key evil-normal-state-local-map (kbd "<backtab>") 'Info-prev-reference)
			     (define-key evil-normal-state-local-map (kbd "B") 'Info-history-back)
			     (define-key evil-normal-state-local-map (kbd "^") 'Info-up)
			     (define-key evil-normal-state-local-map (kbd "d") 'Info-directory)
			     (define-key evil-normal-state-local-map (kbd "q") 'Info-exit)
			     (define-key evil-normal-state-local-map (kbd "n") 'Info-next)
			     (define-key evil-normal-state-local-map (kbd "p") 'Info-prev)
			     (define-key evil-normal-state-local-map (kbd "i") 'Info-menu)
			     ))

(provide 'init-Info-mode)
