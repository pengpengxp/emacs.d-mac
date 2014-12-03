;;pengpengxp's org-mode
;;;use the newly org-mode
;; (add-to-list 'load-path (concat SITE-LISP "org-8.2.7c/lisp"))
;; (add-to-list 'load-path (concat SITE-LISP "org-8.2.7c/contrib/lisp"))

(require 'evil)
(require 'org)
;;; ----------------------------------------------------------------------
;;; 设置环境变量
;;; ----------------------------------------------------------------------
(setq ORG-HOME "/home/pengpengxp/gtd")
(setq ORG-AGENDA-FILES (list (concat ORG-HOME "/inbox.org")
			     (concat ORG-HOME "/book.org")
			     (concat ORG-HOME "/dreams.org")
			     (concat ORG-HOME "/note.org")
			     (concat ORG-HOME "/test.org")
			     (concat ORG-HOME "/Tips.org")
			     ))
(setq ORG-REFILE-FILES (list (concat ORG-HOME "/book.org")
			     (concat ORG-HOME "/dreams.org")
			     (concat ORG-HOME "/finished.org")
			     (concat ORG-HOME "/inbox.org")
			     (concat ORG-HOME "/note.org")
			     (concat ORG-HOME "/README.org")
			     (concat ORG-HOME "/test.org")
			     (concat ORG-HOME "/blog.org")
			     (concat ORG-HOME "/Tips.org")
			     (concat ORG-HOME "/trash.org")
			     ))


;;; ----------------------------------------------------------------------
;;; hook
;;; ----------------------------------------------------------------------
(add-hook 'org-mode-hook '(lambda ()
			    (auto-fill-mode 1)
			    (define-key evil-normal-state-local-map (kbd "j") 'next-line)
			    (define-key evil-normal-state-local-map (kbd "C-n") 'next-line)
			    (define-key evil-normal-state-local-map (kbd "k") 'previous-line)
			    (define-key evil-normal-state-local-map (kbd "C-p") 'previous-line)
			    (local-set-key (kbd "<tab>") 'org-cycle)
			    (local-set-key (kbd "<C-tab>") 'other-window)
			    (local-set-key (kbd "<C-return>") 'org-insert-heading-respect-content)
			    (peng-local-set-key (kbd "<return>") 'org-return)
			    (setq truncate-lines nil)
			    (yas-minor-mode 1)
			    (local-set-key (kbd "C-c a") 'org-agenda)
			    (peng-local-set-key (kbd "C-c &") 'org-mark-ring-goto)
			    (setq org-agenda-files ORG-AGENDA-FILES)
			    (setq org-directory ORG-HOME)
			    (org-indent-mode 1)	;不显示那么多个*
			    (setq org-return-follows-link t) ;超连接可以使用回车打开
			    (when window-system
			      (local-set-key (kbd "<s-return>") 'org-insert-subheading))
			    ))
(add-hook 'org-agenda-mode-hook '(lambda ()
				   (delete-other-windows)
				   (linum-on)
				   (hl-line-mode 1)
				   ))
;;; ----------------------------------------------------------------------

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
;;;refile in several files,here is in the all org-agenda-files
;;; ----------------------------------------------------------------------
(setq org-refile-targets (quote ((nil :maxlevel . 9)
				 (ORG-REFILE-FILES :maxlevel . 9))))
;;; ----------------------------------------------------------------------

;; (setq org-refile-use-outline-path ORG-HOME)
;; (setq org-refile-targets (quote ((nil :maxlevel . 9))))

;;; 所有可能的状态
(setq org-todo-keywords '((sequence "TODO(t!)" 
				    "DOING(n)"
				    "WAITING(w)" ;waiting for others
                                    "SOMEDAY(s)" ;I'll do it someday
				    "Dreams(i)"
				    "Tips(p)"
				    "Important-Day(j)"
				    "|"
				    "DONE(d@/!)"
				    "ABORT(a@/!)"
				    )))
(setq org-capture-templates 
      '(("t" "News" entry (file+datetree (concat ORG-HOME "/inbox.org"))
	 "*  TODO  [#A]  %?\n %T")

	("i" "Dreams" entry (file+datetree (concat ORG-HOME "/dreams.org"))
	 "*  Dreams  %?\n %T")

	("s" "SOMEDAY" entry (file+datetree (concat ORG-HOME "/inbox.org"))
	 "*  SOMEDAY  %?\n %T")

	("p" "Tips" entry (file+datetree (concat ORG-HOME "/Tips.org"))
	 "*  Tips  %?\n %T")

	("b" "Book" entry (file+datetree (concat ORG-HOME "/book.org"))
	 "*  SOMEDAY  %?\n %T")

	("n" "Notes" entry (file+datetree (concat ORG-HOME "/note.org"))
	 "*  TODO  %?\n %T")

	("j" "Important-Day" entry (file+datetree (concat ORG-HOME "/note.org"))
	 "*  Important-Day  %?\n %T")

	("a" "Account" table-line (file+headline (concat ORG-HOME "/account.org.gpg") "Web accounts")
	 "|")

	("k" "test" entry (file+datetree (concat ORG-HOME "/test.org") "Tasks")
	 "* TODO  %?  \n %T")
	))

(setq org-default-notes-file (concat ORG-HOME "/inbox.org"))

(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c b") 'org-iswitchb)

;;; 定制自己的org-agenda选项。这样Ctrl-a以后可供选择。
(setq org-agenda-custom-commands
      '(
	("d" "Agenda and Home-related tasks"
	 (
	  (agenda "")
	  (todo "DOING")
	  (todo "WAITING")
	  ))
	("w" "things WAITING"
	 (
	  (agenda "")
	  (todo "WAITING")
	  ))
	("o" "things TODO"
	 (
	  (agenda "")
	  (todo "TODO")
	  ))
	;; ("h" . "h for peng's dispatcher") ; description for "h" prefix
	("ht" todo "TODO")
	("hn" todo "DOING")
	("hd" todo "DONE")
	("hw" todo "WAITING")
	("hi" todo "Dreams")
	("hp" todo "Tips")
	("hs" todo "SOMEDAY")
	))

;;;默认显示一天的事件
(setq org-agenda-span 'day)


(provide 'init-org)
