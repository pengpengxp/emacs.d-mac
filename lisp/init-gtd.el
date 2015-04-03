;;; init-gtd.el --- 
;; 
;; Filename: init-gtd.el
;; 
;; Description: gtd config file
;; 
;; Author: pengpengxp
;; Email: pengpengxppri@gmail.com
;; Created: 一  1月 12 16:22:13 2015 (+0800)
;; Version: 
;; Last-Updated: 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:


(require 'evil)
(require 'org)

;;; ----------------------------------------------------------------------
;;; 设置环境变量
;;; ----------------------------------------------------------------------

(setq ORG-HOME (concat HOME "/org/gtd"))

(setq ORG-AGENDA-FILES (list (concat ORG-HOME "/inbox.org")
			     ;; (concat ORG-HOME "/book.org")
			     (concat ORG-HOME "/dreams.org")
			     (concat ORG-HOME "/note.org")
			     (concat ORG-HOME "/test.org")
			     (concat ORG-HOME "/Tips.org")
			     ))
(setq ORG-REFILE-FILES (list 
			;; (concat ORG-HOME "/book.org")
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

(add-hook 'org-agenda-mode-hook '(lambda ()
				   (delete-other-windows)
				   (linum-on)
				   (hl-line-mode 1)
				   ))

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
      '(("t" "New TODO item" entry (file(concat ORG-HOME "/inbox.org"))
	 "*  TODO  [#C]  %?\n  %T")

	("i" "Dreams" entry (file(concat ORG-HOME "/dreams.org"))
	 "*  Dreams  %?\n %T")

	;; ("s" "SOMEDAY" entry (file+datetree (concat ORG-HOME "/inbox.org"))
	;;  "*  SOMEDAY  %?\n %T")

	;; ("p" "Tips" entry (file+datetree (concat ORG-HOME "/Tips.org"))
	;;  "*  Tips  %?\n %T")

	;; ("b" "Book" entry (file+datetree (concat ORG-HOME "/book.org"))
	;;  "*  SOMEDAY  %?\n %T")

	("n" "Notes" entry (file(concat ORG-HOME "/note.org"))
	 "*  %?\n %T")

	("j" "Important-Day" entry (file+datetree (concat ORG-HOME "/note.org"))
	 "*  Important-Day  %?\n %T")

	;; ("a" "Account" table-line (file+headline (concat ORG-HOME "/account.org.gpg") "Web accounts")
	;;  "|")

	("l" "link" entry (file(concat ORG-HOME "/inbox.org"))
	 "* TODO  %(peng-get-chrome-current-tab-url-to-org-capture)  \n %T")

	("k" "test" entry (file(concat ORG-HOME "/test.org") "Tasks")
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

(provide 'init-gtd)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-gtd.el ends here
