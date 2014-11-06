;;; ibuffer mode
(defun peng-ibuffer-mode ()
  (hl-line-mode 1)
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


(provide 'init-ibuffer)
