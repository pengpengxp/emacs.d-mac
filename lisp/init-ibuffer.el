(require 'init-keys)
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

;;; 默认不显示`*'开头的buffer
(require 'ibuf-ext)
(add-to-list 'ibuffer-never-show-predicates "^\\*")
(add-to-list 'ibuffer-never-show-predicates "TAGS")

;;; 下面两个函数用来自己使用，分别绑定在`ibuffer-mode'中梆到`f'和`a'上
(defun peng-ibuffer-filter-fun ()
  "进滤一些无用的buffer再显示"
  (interactive)
  (setq ibuffer-never-show-predicates nil)
  (add-to-list 'ibuffer-never-show-predicates "^\\*")
  (add-to-list 'ibuffer-never-show-predicates "TAGS")
  (ibuffer)
  )
(defun peng-ibuffer-show-all-buffer ()
  "显示所有buffer"
  (interactive)
  (setq ibuffer-never-show-predicates nil)
  (ibuffer)
  )

;;; ibuffer mode
(defun peng-ibuffer-mode ()
  (hl-line-mode 1)
  ;; (define-key (current-local-map) (kbd ",") peng-evil-insert-map)
  ;; (define-key (current-local-map) (kbd "SPC") peng-evil-normal-map)
  (define-key evil-normal-state-local-map (kbd "SPC") peng-evil-normal-map)
  (peng-local-set-key (kbd "RET") 'ibuffer-visit-buffer)

  (peng-local-set-key (kbd "a") 'peng-ibuffer-show-all-buffer)
  (peng-local-set-key (kbd "f") 'peng-ibuffer-filter-fun)
  
  )
(add-hook 'ibuffer-mode-hook 'peng-ibuffer-mode)

(provide 'init-ibuffer)
