(require 'company)

(add-hook 'prog-mode-hook 'global-company-mode)
(add-hook 'cmake-mode-hook 'global-company-mode)
(add-hook 'after-init-hook 'global-company-mode)

;;; use `C-n C-p' to select
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

(global-set-key (kbd "C-c o") 'company-complete)
(setq company-require-match nil)

;;; space don't run the complete
(setq company-auto-complete nil)

(eval-after-load 'company
  '(progn
     (add-to-list 'company-backends 'company-cmake)
     ;; can't work with TRAMP
     (setq company-backends (delete 'company-ropemacs company-backends))
     ;; (setq company-backends (delete 'company-capf company-backends))
     ;; I don't like the downcase word in company-dabbrev
     ;; for languages use camel case naming convention
     (setq company-dabbrev-downcase nil)
     (setq company-show-numbers t)
     ;; (setq company-begin-commands '(self-insert-command))
     (setq company-idle-delay 0.2)
     (setq company-clang-insert-arguments nil)
     ))

(provide 'init-company-mode)
