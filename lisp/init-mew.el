(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)

;; Optional setup (Read Mail menu):
(setq read-mail-command 'mew)

;; Optional setup (e.g. C-xm for sending a message):
(autoload 'mew-user-agent-compose "mew" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'mew-user-agent
      'mew-user-agent-compose
      'mew-draft-send-message
      'mew-draft-kill
      'mew-send-hook))

;;; use smtp to send mail
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;my public mailbox
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq mew-name "Xie Peng") ;; (user-full-name)
(setq mew-user "pengpengxppub") ;; (user-login-name)
(setq mew-mail-domain "sina.com")
(setq mew-smtp-server "smtp.sina.com")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; use imap to receive mail
;; my sina mail
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;my public mailbox
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq mew-proto "%")
;; (setq mew-imap-user "pengpengxppub")  ;; (user-login-name)
;; (setq mew-imap-server "imap.sina.com")    ;; if not localhost
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;my private mailbox
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq mew-proto "%")
(setq mew-imap-user "pengpengxppri")  ;; (user-login-name)
(setq mew-imap-server "imap.sina.com")    ;; if not localhost
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; qq mail
;; (setq mew-proto "%")
;; (setq mew-imap-user "474364048")  ;; (user-login-name)
;; (setq mew-imap-server "imap.qq.com")    ;; if not localhost

(setq mew-use-cached-passwd t)		;保存密码到内存。
;; (setq mew-use-master-passwd t)		;保存密码到文件，有主密码
(provide 'init-mew)
