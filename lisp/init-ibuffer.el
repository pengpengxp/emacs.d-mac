;;; ibuffer mode
(defun peng-ibuffer-mode ()
  (hl-line-mode 1)
  (define-key (current-local-map) (kbd ",") peng-evil-insert-map)
  (define-key (current-local-map) (kbd "SPC") peng-evil-insert-map)
  (peng-local-set-key (kbd "RET") 'ibuffer-visit-buffer)
  )
(add-hook 'ibuffer-mode-hook 'peng-ibuffer-mode)

;;;ibuffer filter
(setq ibuffer-saved-filters
      '(
	("org"
	 ((or 
	   (mode . org-mode)
	   )))
	("c"
	 ((or 
	   (mode . c-mode)
	   )))
	("cpp"
	 ((or 
	   (mode . c++-mode)
	   (mode . c-mode)
	   )))
	("lisp"
	 ((or 
	   (mode . emacs-lisp-mode)
	   )))
	("sql"
	 ((or 
	   (mode . sql-mode)
	   (mode . sql-interactive-mode)
	   )))
	("dired"
	 ((or 
	   (mode . dired-mode)
	   )))
	))
(defun peng-ibuffer-filter-c-mode ()
  (interactive)
  (ibuffer)
  (ibuffer-switch-to-saved-filters "c"))
(defun peng-ibuffer-filter-c++-mode ()
  (interactive)
  (ibuffer)
  (ibuffer-switch-to-saved-filters "cpp"))
(defun peng-ibuffer-filter-org-mode ()
  (interactive)
  (ibuffer)
  (ibuffer-switch-to-saved-filters "org"))
(defun peng-ibuffer-filter-emacs-lisp-mode ()
  (interactive)
  (ibuffer)
  (ibuffer-switch-to-saved-filters "lisp"))
(defun peng-ibuffer-filter-sql-mode ()
  (interactive)
  (ibuffer)
  (ibuffer-switch-to-saved-filters "sql"))
(defun peng-ibuffer-filter-dired-mode ()
  (interactive)
  (ibuffer)
  (ibuffer-switch-to-saved-filters "dired"))


;;; 不显示某些buffer
;;; 不显示`*'开头的buffer
(require 'ibuf-ext)
(add-to-list 'ibuffer-never-show-predicates "^\\*")
(add-to-list 'ibuffer-never-show-predicates "TAGS")

(provide 'init-ibuffer)
