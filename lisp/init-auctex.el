;;;; use the auctex
;;;; WATCH OUT:you must have installed the texlive
;;; when you install,you need to make and make install

(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq Tex-auto-save t)
(setq Tex-parse-self t)
(setq-default Tex-master nil)

;;;;use evince to open pdf file
(setq TeX-output-view-style (quote (("^pdf$" "." "evince %o %(outpage)"))))
;;;;use xelatex to compile latex file
(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
	    (setq TeX-command-default "XeLaTeX")
	    (company-mode-on)
	    (autopair-on)
	    ))
;;; the keybinding
(add-hook 'LaTeX-mode-hook
	  '(lambda ()
	    (define-key evil-normal-state-local-map (kbd "SPC v") '(lambda ()
								     (interactive)
								     (let* ((basefile (file-name-base)))
								       (compile (concat "tex "
											(concat basefile ".tex")
											" '\\end'"
											";evince "
											(concat basefile ".dvi")
											))
								       )))
	    ))
(add-hook 'LaTeX-mode-hook '(lambda ()
			      (interactive)
			      (peng-local-set-key (kbd "<f8> v") 'peng-compile-current-file-as-plain-tex)
			      (define-key evil-normal-state-local-map (kbd "SPC v") 'peng-compile-current-file-as-plain-tex)
			      (peng-local-set-key (kbd "<f8> l") 'peng-compile-current-latex-file-to-pdf)
			      (define-key evil-normal-state-local-map (kbd "SPC l") 'peng-compile-current-latex-file-to-pdf)
			      ))

(setq auto-mode-alist
      (append
       ;; the original tex-mode can't be use
       '(("\\.tex\\'". latex-mode))
       auto-mode-alist))

(provide 'init-auctex)
