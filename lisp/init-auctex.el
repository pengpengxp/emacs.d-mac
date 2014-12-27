;;;; use the auctex
;;;; WATCH OUT:you must have installed the texlive
;;; when you install,you need to make and make install
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq Tex-auto-save t)
(setq Tex-parse-self t)
(setq-default Tex-master nil)

;;;;use xelatex to compile latex file

(require 'tex)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; peng-bib是默认的
;;;
;;; peng-bib-inter可以修改
;;; 
;;; 为了这个东西，我重新编译了auctex。之前都是默认安装到
;;; /usr/local/share/emacs/site-lisp，但是我在emacs中找不到一些函数，最
;;; 后，重新编译到~/.emacs.d/site-lisp/auctex/下面，就什么都能找到了。
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'TeX-expand-list '("%b" (lambda nil
				       (file-name-base))))
(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-compile nil t))
	    (add-to-list 'TeX-command-list '("peng-bib-inter"
					     "rm -f %b.aux %b.toc %b.log %b.pdf %b.bbl %b.blg %b.toc;\
xelatex %t;bibtex %b.aux;xelatex %t;evince %b.pdf" 
					     TeX-run-compile t t))
	    (add-to-list 'TeX-command-list '("peng-bib" "rm -f %b.aux %b.toc %b.log %b.pdf %b.bbl %b.blg %b.toc;\
xelatex %t;bibtex %b.aux;xelatex %t;evince %b.pdf" 
					     TeX-run-compile nil t))
	    (setq TeX-command-default "peng-bib")
	    (company-mode-on)
	    (autopair-on)
	    (TeX-PDF-mode 1)
	    ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
			      (define-key evil-normal-state-local-map (kbd "SPC m") 'TeX-command-master)
			      (define-key evil-normal-state-local-map (kbd "SPC cv") 'TeX-view)
			      ))

(setq auto-mode-alist
      (append
       ;; the original tex-mode can't be use
       '(("\\.tex\\'". latex-mode))
       auto-mode-alist))

(provide 'init-auctex)










