;;pengpengxp's org-mode
;;;use the newly org-mode
;; (add-to-list 'load-path (concat SITE-LISP "org-8.2.7c/lisp"))
;; (add-to-list 'load-path (concat SITE-LISP "org-8.2.7c/contrib/lisp"))

(require 'evil)
(require 'org)
;;; ----------------------------------------------------------------------
;;; hook
;;; ----------------------------------------------------------------------
(add-hook 'org-mode-hook '(lambda ()
			    (toggle-word-wrap -1)
			    (auto-fill-mode 0)
			    (visual-line-mode 1)

			    ;; 在normal是用回车就是查字典，其它还就是`org-return'
			    (peng-local-set-key (kbd "<return>") 'org-return)
			    (define-key evil-normal-state-local-map (kbd "RET") 'view-stardict-in-buffer)
			    (define-key evil-normal-state-local-map (kbd "<return>") 'view-stardict-in-buffer)

			    (peng-local-set-key (kbd "<f5> <f5>") 'peng-org-latex-insert-math)

			    (define-key evil-normal-state-local-map (kbd "C-c C-n") 'outline-next-visible-heading)
			    (define-key evil-visual-state-local-map (kbd "C-c C-n") 'outline-next-visible-heading)

			    (define-key evil-normal-state-local-map (kbd "C-c C-u") 'outline-up-heading)
			    (define-key evil-visual-state-local-map (kbd "C-c C-u") 'outline-up-heading)

			    (define-key evil-visual-state-local-map (kbd "j") 'next-line)
			    (define-key evil-visual-state-local-map (kbd "<down>") 'next-line)
			    (define-key evil-visual-state-local-map (kbd "k") 'previous-line)
			    (define-key evil-visual-state-local-map (kbd "<up>") 'previous-line)

			    (define-key evil-normal-state-local-map (kbd "j") 'next-line)
			    (define-key evil-normal-state-local-map (kbd "<down>") 'next-line)
			    (define-key evil-normal-state-local-map (kbd "C-n") 'next-line)
			    (define-key evil-normal-state-local-map (kbd "l") 'forward-char)
			    (define-key evil-normal-state-local-map (kbd "h") 'backward-char)
			    (define-key evil-normal-state-local-map (kbd "k") 'previous-line)
			    (define-key evil-normal-state-local-map (kbd "<up>") 'previous-line)
			    (define-key evil-normal-state-local-map (kbd "C-p") 'previous-line)
			    (define-key evil-normal-state-local-map (kbd "SPC v") 'peng-org-latex-export-to-pdf-and-open)
			    (define-key evil-normal-state-local-map (kbd "SPC cv") 'peng-org-view)
			    (define-key evil-normal-state-local-map (kbd "<f5> cv") 'peng-org-view)
			    (define-key evil-insert-state-local-map (kbd "<M-tab>") 'ispell-complete-word)
			    (define-key evil-emacs-state-local-map (kbd "<M-tab>") 'ispell-complete-word)
			    (local-set-key (kbd "<C-tab>") 'other-window)
			    (local-set-key (kbd "<C-return>") 'org-insert-heading-respect-content)
			    (peng-local-set-key (kbd "C-c (") 'reftex-citation)
			    (peng-local-set-key (kbd "C-c )") 'reftex-reference)
			    (peng-local-set-key (kbd "<f9>") 'peng-org-latex-export-to-pdf-and-open-no-content)
			    (peng-local-set-key (kbd "<f10>") 'peng-org-latex-export-to-pdf-and-open)
			    (setq truncate-lines nil)
			    (yas-minor-mode 1)
			    (local-set-key (kbd "C-c a") 'org-agenda)

			    (if (not (display-graphic-p))
			      (progn
				(peng-local-set-key (kbd "<tab>") 'org-cycle)
				(peng-local-set-key (kbd "TAB") 'org-cycle)
				))
			    (peng-local-set-key (kbd "C-c &") 'org-mark-ring-goto)

			    (setq org-agenda-files ORG-AGENDA-FILES)
			    (setq org-directory ORG-HOME)
			    ;; (org-indent-mode 1)	;不显示那么多个*
			    (setq org-return-follows-link t) ;超连接可以使用回车打开
			    (if (display-graphic-p)
			      (local-set-key (kbd "<s-return>") 'org-insert-subheading))
			    ))
;;; ----------------------------------------------------------------------

;;; 利用 highlight-regexp 高亮指定的正则表达式

(defun peng-highlight ()
  (interactive)
  (highlight-regexp "`.*'" 'language-lock-face)
)

; org mode 中开启高亮
(add-hook 'org-mode-hook (lambda ()
			   (hi-lock-mode 1)
			   (peng-highlight)))

;;; ----------------------------------------------------------------------
;;; 如果yas-expand失败后，tab作用就是之前的，一般是org-cycle。对于这个
;;; [tab]还不是很理解。
;;; ----------------------------------------------------------------------
(add-hook 'org-mode-hook
          (let ((original-command (lookup-key org-mode-map [tab])))
            `(lambda ()
               (setq yas-fallback-behavior
                     '(apply ,original-command))
               (local-set-key [tab] 'yas-expand))))
;;; ----------------------------------------------------------------------


;;; ----------------------------------------------------------------------
;; 设置org-mode中对各种Babel语言支持，这样就可以通过`C-c C-c'执行这些命
;; 令了
;;; ----------------------------------------------------------------------
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (emacs-lisp . t)
   (C . t)
   (perl . t)
   (sh . t)
   (python . t)
   (latex . t)
   (js . t)
   (ruby . t)
   (ditaa . t)
   (R . t)
   ))
;;; 可以禁止`C-c C-c`在code block中进行执行命令，但是我不需要
;; (setq org-babel-no-eval-on-ctrl-c-ctrl-c nil)

;;; 每次执行的时候不再询问了yes-or-no了
(setq org-confirm-babel-evaluate nil)
;;; ----------------------------------------------------------------------

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; for the footnote: insert footnote inline by default
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-footnote-define-inline  t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; personal function for org
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun peng-org-latex-insert-math ()
  "To insert math convenient in org or latex"
  (interactive)
  (insert " \\(\\)")
  (goto-char (- (point) 2)))

(defun peng-org-view ()
  "Veiw the pdf file generated by current org source file"
  (interactive)
  (let ((TEMPBASE (format "%s" (file-name-base))))
    (peng-async-shell-command (concat "open "
				      TEMPBASE
				      ".pdf"))))

(defun peng-org-latex-export-to-pdf-and-open ()
  "Export the org source file to pdf, delete the intermediate
file and open the pdf file."
  (interactive)
  (save-excursion
      (let ((TEMPFILE (message "%s" (file-name-base))))
	(progn
	  (shell-command (concat "rm -rf " TEMPFILE ".pdf"))
	  (org-latex-export-to-latex)
	  (compile (concat "xelatex "
			   (concat TEMPFILE ".tex")
			   ";xelatex "
			   (concat TEMPFILE ".tex")
			   ";xelatex "
			   (concat TEMPFILE ".tex")
			   (concat  ";rm -rf " TEMPFILE ".bbl " TEMPFILE ".blg " 
				    TEMPFILE ".out " TEMPFILE ".log " TEMPFILE ".aux " 
				    TEMPFILE ".toc" ";rm -f " TEMPFILE ".tex"
				    ";open " TEMPFILE ".pdf")))
	  ))))

(defun peng-org-latex-export-to-pdf-and-open-no-content ()
  "Export the org source file to pdf, delete the intermediate
file and open the pdf file."
  (interactive)
  (save-excursion
      (let ((TEMPFILE (message "%s" (file-name-base))))
	(progn
	  (shell-command (concat "rm -rf " TEMPFILE ".pdf"))
	  (org-latex-export-to-latex)
	  (compile (concat "xelatex "
			   (concat TEMPFILE ".tex")
			   ;; ";xelatex "
			   ;; (concat TEMPFILE ".tex")
			   ;; ";xelatex "
			   ;; (concat TEMPFILE ".tex")
			   (concat  ";rm -rf " TEMPFILE ".bbl " TEMPFILE ".blg " 
				    TEMPFILE ".out " TEMPFILE ".log " TEMPFILE ".aux " 
				    TEMPFILE ".toc" ";rm -f " TEMPFILE ".tex"
				    ";open " TEMPFILE ".pdf")))
	  ))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; convert all marked org files to pdf. I copied from internet
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'dired+)
;; (defun peng-dired-org-to-pdf ()
;;   (interactive)
;;   (mapc
;;    (lambda (f)
;;      (with-current-buffer
;;          (find-file-noselect f)
;;        (org-latex-export-to-pdf)))
;;    (dired-get-marked-files)))
(defun peng-dired-org-to-pdf ()
  "convert the marked org files to pdf in dired-mode.
otherwise,you need to input a directory name. this function will
try to convert all of the org files in the directory you just
type to pdf automatically"
  (interactive)
  (let ((files
         (if (eq major-mode 'dired-mode)
             (dired-get-marked-files)
           (let ((default-directory (read-directory-name "dir: ")))
             (mapcar #'expand-file-name 
                     (file-expand-wildcards "*.org"))))))
    ;; (message "%s" files)
    (mapc
     (lambda (f)
       (with-current-buffer
           (find-file-noselect f)
         (org-latex-export-to-pdf)))
     files)
    ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun peng-org-latex-export-to-pdf-and-open-with-bib ()
  "Export the org source file to pdf, delete the intermediate
file and open the pdf file. also compile the bibliography"
  (interactive)
  (save-excursion
      (let ((TEMPFILE (message "%s" (file-name-base))))
	(progn
	  (shell-command (concat "rm -rf " TEMPFILE ".pdf"))
	  (org-latex-export-to-latex)
	  (compile (concat "xelatex "
			   (concat TEMPFILE ".tex")
			   ";bibtex "
			   (concat TEMPFILE ".aux")
			   ";xelatex "
			   (concat TEMPFILE ".tex")
			   ";xelatex "
			   (concat TEMPFILE ".tex")
			   (concat  ";rm -rf " TEMPFILE ".bbl " TEMPFILE ".blg " 
				    TEMPFILE ".out " TEMPFILE ".log " TEMPFILE ".aux " 
				    TEMPFILE ".toc" ";rm -f " TEMPFILE ".tex"
				    ";open " TEMPFILE ".pdf")))
	  ))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-org)
