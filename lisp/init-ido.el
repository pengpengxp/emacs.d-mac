;; Use C-f during file selection to switch to regular find-file
(require 'ido)
(require 'ido-vertical-mode)
(require 'ido-complete-space-or-hyphen)
(require 'idomenu)

(require 'ido-better-flex)
(ido-better-flex/disable)

;; (define-key minibuffer-local-map [tab] 'ido-exit-minibuffer) ;这样的<tab>才是我想要的。但是开启后`helm'用着不行了

(ido-mode t)
(ido-vertical-mode 1)
(ido-toggle-regexp)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; (setq ido-use-filename-at-point 'guess)	;可以自动识别当前`point'在的目录。好像没太大用

;;; 设定ido显示的排列方式
(setq ido-file-extensions-order '(".org" ".c" ".lisp" ".sh" ".tex" ".pdf" ".txt" ".emacs" ".xml" ".el" ".ini" ".cfg" ".cnf"))

;;; 这句以后可以设置变量`completion-ignored-extensions'来让`ido'ignore这些东西
(setq ido-ignore-extensions t)
;;; ignore case when search
(setq ido-case-fold t)


;;; *****************************from the wiki***********************************
(defun peng-ido-find-tag ()
  "Find a tag using ido"
  (interactive)
  (tags-completion-table)
  (let (tag-names)
    (mapatoms (lambda (x)
		(push (prin1-to-string x t) tag-names))
	      tags-completion-table)
    (find-tag (ido-completing-read "Tag: " tag-names))))

;; ;;; SPC选择，回车直接打开目录
;; (defun ido-smart-select-text ()
;;   "Select the current completed item.  Do NOT descend into directories."
;;   (interactive)
;;   (when (and (or (not ido-require-match)
;; 		 (if (memq ido-require-match
;; 			   '(confirm confirm-after-completion))
;; 		     (if (or (eq ido-cur-item 'dir)
;; 			     (eq last-command this-command))
;; 			 t
;; 		       (setq ido-show-confirm-message t)
;; 		       nil))
;; 		 (ido-existing-item-p))
;; 	     (not ido-incomplete-regexp))
;;     (when ido-current-directory
;;       (setq ido-exit 'takeprompt)
;;       (unless (and ido-text (= 0 (length ido-text)))
;; 	(let ((match (ido-name (car ido-matches))))
;; 	  (throw 'ido
;; 		 (setq ido-selected
;; 		       (if match
;; 			   (replace-regexp-in-string "/\\'" "" match)
;; 			 ido-text)
;; 		       ido-text ido-selected
;; 		       ido-final-text ido-text)))))
;;     (exit-minibuffer)))
;; (eval-after-load "ido"
;;   '(define-key ido-common-completion-map "\C-m" 'ido-smart-select-text))
;;; *****************************from the wiki***********************************
(peng-global-set-key (kbd "M-s M-s") 'idomenu)

(provide 'init-ido)
