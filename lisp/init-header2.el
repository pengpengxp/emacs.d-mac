(require 'header2)
;;;; 这是参考header2.el中的代码，把这些定义成宏
(defsubst peng-email-address ()
  "Insert my own email address"
  (insert header-prefix-string "Email: " "pengpengxppri@gmail.com" "\n"))
(defsubst peng-header-author ()
  "Insert my own email address"
  (insert header-prefix-string "Author: " "pengpengxp" "\n"))

;;;; 根据原始的`make-header-hook'自己定制了一下
(setq make-header-hook '(
			 header-title
			 header-blank
			 header-file-name
			 header-description
			 peng-header-author
			 peng-email-address
			 ;; header-maintainer
			 ;; header-copyright
			 header-creation-date
			 header-version
			 header-modification-date
			 ;; header-pkg-requires
			 ;; header-modification-author
			 ;; header-update-count
			 ;; header-url
			 ;; header-doc-url
			 ;; header-keywords
			 ;; header-compatibility
			 ;; header-blank
			 ;; header-lib-requires
			 ;; header-end-line
			 ;; header-commentary
			 ;; header-blank
			 ;; header-blank
			 ;; header-blank
			 ;; header-end-line
			 ;; header-history
			 ;; header-blank
			 header-blank
			 header-end-line
			 ;; header-free-software
			 header-code
			 header-eof
			 ))
(provide 'init-header2)

