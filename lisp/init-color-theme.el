;;; init-color-theme.el --- 
;; 
;; Filename: init-color-theme.el
;; 
;; Description: initial my theme
;; 
;; Author: pengpengxp
;; Email: pengpengxppri@gmail.com
;; Created: 二  1月  6 15:05:08 2015 (+0800)
;; Version: 
;; Last-Updated: 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; emacs 24 offer this theme, it is good. But color-theme offer me
;;; the more choices
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (when window-system
;;   ;; (load-theme 'manoj-dark nil nil)
;;   ;; (enable-theme 'manoj-dark)
;;   (load-theme 'deeper-blue nil nil)
;;   (enable-theme 'deeper-blue)
;;   )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; you can use 'color-theme-select to try the themes
(require 'color-theme)
(color-theme-initialize)

;;; I don't understand why I must load it rather than only require it?
(load-file (concat SITE-LISP "/color-theme-6.6.0/emacs-colors-solarized.el"))
(require 'color-theme-solarized)

(color-theme-solarized-dark)

(provide 'init-color-theme)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-color-theme.el ends here
