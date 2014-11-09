;;; ----------------------------------------------------------------------
;;; My personal information
;;; ----------------------------------------------------------------------
(setq user-full-name "pengpengxp")
(setq user-mail-address "pengpengxppub@sina.com")
;;; ----------------------------------------------------------------------

;;; ----------------------------------------------------------------------
;;; Use to read rss
;;; 
;;; Not perfect
;;; ----------------------------------------------------------------------
(setq gnus-nntp-server "news.cn99.com")
(setq gnus-fetch-old-headers '10)
(add-hook 'gnus-group-mode-hook '(lambda ()
				   (local-set-key (kbd "o") '(lambda ()
							       (interactive)
							       (gnus-group-list-all-groups 5)))
				))
;;; ----------------------------------------------------------------------

;;; ----------------------------------------------------------------------
;;; Receive mail setting
;;; 
;;; Have used it to receive mail
;;; ----------------------------------------------------------------------
;; (setq gnus-select-method
;;       '(nnimap "sina-public"
;; 	       (nnimap-address "imap.sina.com")
;; 	       (nnimap-user "pengpengxppub")
;; 	       (nnimap-server-port 993)
;; 	       (nnimap-stream ssl)
;; 	       ))
;;; ----------------------------------------------------------------------

;;; ----------------------------------------------------------------------
;;; Send mail setting
;;; 
;;;  Not test yet
;;; ----------------------------------------------------------------------
;; (setq message-send-mail-function 'smtpmail-send-it
;;       smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
;;       smtpmail-auth-credentials '(("smtp.gmail.com" 587
;; 				   "user@gmail.com" nil))
;;       smtpmail-default-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-service 587
;;       gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")
;;; ----------------------------------------------------------------------


(provide 'init-gnus)
