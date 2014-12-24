;;; init-ruby.el --- 
;; 
;; Filename: init-ruby.el
;; Description: initial pengpengxp's ruby mode
;; Author: pengpengxp
;; Email: pengpengxppri@gmail.com
;; Created: 三 12月 24 19:29:10 2014 (+0800)
;; Version: 
;; Last-Updated: 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:
(require 'init-peng-prifun)

(defun peng-ruby-mode ()
  (peng-local-set-key (kbd "SPC v") 'peng-run-current-script)
  (autopair-on)
  )

(add-hook 'ruby-mode-hook 'peng-ruby-mode)

(provide 'init-ruby)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ruby.el ends here
