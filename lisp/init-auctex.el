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

(provide 'init-auctex)