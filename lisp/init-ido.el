;; Use C-f during file selection to switch to regular find-file

;; `ido'中的空格不是我喜欢的，加上使用`ido-better-flex'可以满足但是
;; `smex'又太慢。暂时先不开了。

(require 'ido)
(require 'ido-vertical-mode)
(require 'ido-complete-space-or-hyphen)
(require 'idomenu)

(require 'ido-better-flex)
(ido-better-flex/disable)

;这样的<tab>才是我想要的。但是开启后`helm'用着不行了。关闭`ido-mode'就行。
(define-key minibuffer-local-map [tab] 'ido-exit-minibuffer) 

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

;;; 使用`ido'来跳转bookmark
(peng-global-set-key (kbd "C-c j")
    (lambda ()
      (interactive)
      (bookmark-jump
       (ido-completing-read "Jump to bookmark: " (bookmark-all-names)))))

(defun ido-yank ()
  "Select a kill to yank with `ido-completing-read'."
  (interactive)
  (insert-for-yank (ido-completing-read "Select kill: " kill-ring)))


(defun ido-sudo-find-file (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(defun ido-recentf-find-file ()
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file (find-file file))))

(defun ido-cache (pred &optional recalc)
  "Create a cache of symbols from `obarray' named after the
predicate PRED used to filter them."
  (let ((cache (intern (concat "ido-cache-" (symbol-name pred)))))
    (when (or recalc (not (boundp cache)))
      (set cache nil)
      (mapatoms (lambda (s)
                  (when (funcall pred s)
                    (push (symbol-name s) (symbol-value cache))))))
    (symbol-value cache)))

(defun ido-recalculate-all-caches ()
  "Recalculate the `ido-cache' of `functionp', `commandp' and
`boundp'."
  (interactive)
  (ido-cache 'commandp  t)
  (ido-cache 'functionp t)
  (ido-cache 'boundp    t)
  t)

(defun ido-describe-function (&optional at-point)
  "ido replacement for `describe-function'."
  (interactive "P")
  (describe-function
   (intern
    (ido-completing-read
     "Describe function: "
     (ido-cache 'functionp) nil nil
     (and at-point (function-called-at-point)
           (symbol-name it))))))

(defun ido-describe-variable (&optional at-point)
  "ido replacement for `describe-variable'."
  (interactive "P")
  (describe-variable
   (intern
    (ido-completing-read
     "Describe variable: "
     (ido-cache 'boundp) nil nil
     (and at-point (thing-at-point 'symbol) (format "%s" it))))))

(defun ido-describe-variable-at-point ()
  (interactive)
  (ido-describe-variable t))

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
