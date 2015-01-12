;;; init-ace-jump.el --- 
;; 
;; Filename: init-ace-jump.el
;; 
;; Description: use ace-jump to quikly jump in emacs-mode or evil-insert-mode
;; 
;; Author: pengpengxp
;; Email: pengpengxppri@gmail.com
;; Created: 五  1月  9 08:27:14 2015 (+0800)
;; Version: 
;; Last-Updated: 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:

;; (require 'ace-jump-mode)
(require 'evil)

(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ---- some personal setting
(setq ace-jump-word-mode-use-query-char t)
(setq ace-jump-mode-submode-list '(
				  ace-jump-char-mode
				  ace-jump-word-mode
				  ace-jump-line-mode
				  ))
(setq ace-jump-mode-case-fold nil)

;; you can select the key you prefer to
(peng-global-set-key (kbd "C-c SPC") 'ace-jump-mode)
;; (define-key evil-normal-state-map (kbd "f") 'ace-jump-mode)
;; (define-key evil-normal-state-map (kbd "F") 'evil-find-char)


(provide 'init-ace-jump.el)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ace-jump.el ends here
