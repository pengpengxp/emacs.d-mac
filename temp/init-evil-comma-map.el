;;; init-evil-comma-map.el --- 
;; 
;; Filename: init-evil-comma-map.el
;; 
;; Description: 这是专门为evil定义的以,开头的快捷键
;; 
;; Author: pengpengxp
;; Email: pengpengxppri@gmail.com
;; Created: 二  1月 27 20:41:16 2015 (+0800)
;; Version: 
;; Last-Updated: 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; use ',' as prefix key
(define-prefix-command 'peng-evil-comma-map)
(define-key evil-normal-state-map (kbd ",") 'peng-evil-comma-map)
(define-key evil-normal-state-map (kbd ",h") 'peng-evil-comma-map)
(define-key evil-motion-state-map (kbd ",") 'peng-evil-comma-map)
(define-key evil-motion-state-map (kbd ",h") 'peng-evil-comma-map)

;; ;;; normal-map
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; for test
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-key evil-normal-state-map ",xs" 'save-buffer)
(define-key evil-normal-state-map ",xb" 'switch-to-buffer)
(define-key evil-normal-state-map ",xk" 'kill-buffer)
(define-key evil-normal-state-map ",xf" 'find-file)
(define-key evil-normal-state-map ",xx" 'execute-extended-command)
(define-key evil-normal-state-map ",xg" '(lambda ()
					   (interactive) 
					   (switch-to-buffer "*scratch*")))

(define-key evil-normal-state-map ",xrm" 'bookmark-set)
(define-key evil-normal-state-map ",xrb" 'bookmark-jump)
(define-key evil-normal-state-map ",xrr" 'copy-rectangle-to-register)
(define-key evil-normal-state-map ",xrg" 'insert-register)
(define-key evil-normal-state-map ",xr " 'point-to-register)
(define-key evil-normal-state-map ",xrj" 'jump-to-register)
(define-key evil-normal-state-map ",xry" 'yank-rectangle)

(define-key evil-normal-state-map ",cj" 'bookmark-jump)
(define-key evil-normal-state-map ",ca" 'org-agenda)
(define-key evil-normal-state-map ",cc" 'org-capture)
(define-key evil-normal-state-map ",cu" 'winner-undo)
(define-key evil-normal-state-map ",cr" 'winner-redo)
(define-key evil-normal-state-map ",c " 'ace-jump-mode)
(define-key evil-normal-state-map ",cm" 'shell-command)

(define-key evil-normal-state-map ",hk" 'describe-key)
(define-key evil-normal-state-map ",hf" 'describe-function)
(define-key evil-normal-state-map ",hm" 'describe-mode)
(define-key evil-normal-state-map ",hv" 'describe-variable)
(define-key evil-normal-state-map ",hr" 'info-emacs-manual)
(define-key evil-normal-state-map ",hi" 'info)

(define-key evil-normal-state-map ",gg" '(lambda ()
					   (interactive) 
					   (switch-to-buffer "*scratch*")))
(define-key evil-normal-state-map (kbd ",go") 'peng-ibuffer-filter-org-mode)
(define-key evil-normal-state-map (kbd ",gc") 'peng-ibuffer-filter-c-mode)
(define-key evil-normal-state-map (kbd ",ge") 'peng-ibuffer-filter-emacs-lisp-mode)
(define-key evil-normal-state-map (kbd ",gs") 'peng-ibuffer-filter-sql-mode)
(define-key evil-normal-state-map (kbd ",gd") 'peng-ibuffer-filter-dired-mode)
(define-key evil-normal-state-map (kbd ",gp") 'peng-ibuffer-filter-c++-mode)

(define-key evil-normal-state-map ",q" 'kill-buffer-and-window)
(define-key evil-normal-state-map ",d" 'kill-this-buffer)
(define-key evil-normal-state-map ",j" 'bookmark-jump)
(define-key evil-normal-state-map ",e" 'eshell)
(define-key evil-normal-state-map ",w" 'save-buffer)
(define-key evil-normal-state-map (kbd ", B") 'bookmark-bmenu-list)
;; (define-key evil-normal-state-map (kbd ",r") 'recentf-open-files)
(define-key evil-normal-state-map (kbd ", DEL") 'delete-other-windows)
(define-key evil-normal-state-map (kbd ", <backspace>") 'delete-other-windows)

(define-key evil-normal-state-map ",," 'evilnc-comment-operator)
(define-key evil-normal-state-map ",1" 'delete-other-windows)
(define-key evil-normal-state-map ",0" 'delete-window)
(define-key evil-normal-state-map ",2" 'split-window-below)
(define-key evil-normal-state-map ",3" 'split-window-right)
(define-key evil-normal-state-map ",b" 'ibuffer)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (define-key evil-normal-state-map ",u" 'winner-undo)
;; (define-key evil-normal-state-map ",r" 'winner-redo)
;; (define-key evil-normal-state-map ",h" 'eshell)
;; (define-key evil-normal-state-map ",p" 'switch-to-buffer)
;; (define-key evil-normal-state-map ",n" 'save-buffer)
;; (define-key evil-normal-state-map ",k" 'kill-buffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; motion map
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-key evil-motion-state-map ",1" 'delete-other-windows)
(define-key evil-motion-state-map ",0" 'delete-window)
(define-key evil-motion-state-map ",2" 'split-window-below)
(define-key evil-motion-state-map ",3" 'split-window-right)
;; (define-key evil-motion-state-map ",u" 'winner-undo)
;; (define-key evil-motion-state-map ",r" 'winner-redo)
;; (define-key evil-motion-state-map ",h" 'eshell)
;; (define-key evil-motion-state-map ",p" 'switch-to-buffer)
;; (define-key evil-motion-state-map ",n" 'save-buffer)
;; (define-key evil-motion-state-map ",k" 'kill-buffer)
;; (define-key evil-motion-state-map ",w" 'eshell)
(define-key evil-motion-state-map ",b" 'ibuffer)

(provide 'init-evil-comma-map)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-evil-comma-map.el ends here
