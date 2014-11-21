(require 'company)

;;; use `C-n C-p' to select
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

(provide 'init-company-mode)
