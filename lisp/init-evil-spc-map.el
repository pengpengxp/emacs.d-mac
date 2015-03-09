;;; init-evil-spc-map.el --- 
;; 
;; Filename: init-evil-spc-map.el
;; 
;; Description: 这是专门为evil定义的以SPC开头的快捷键
;; 
;; TODO: 前缀问题。比如SPC xrg就绑定不上。
;; 
;; Author: pengpengxp
;; Email: pengpengxppri@gmail.com
;; Created: 二  1月 27 20:38:39 2015 (+0800)
;; Version: 
;; Last-Updated: 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:


(define-prefix-command 'peng-evil-spc-map)
(define-key evil-normal-state-map (kbd "SPC x") 'peng-evil-spc-map)
(define-key evil-normal-state-map (kbd "SPC xr") 'peng-evil-spc-map)
(define-key evil-normal-state-map (kbd "SPC c") 'peng-evil-spc-map)

(define-key evil-normal-state-map (kbd "SPC SPC") 'evil-buffer)

(define-key evil-normal-state-map (kbd "SPC t") 'bm-toggle)
(define-key evil-normal-state-map (kbd "SPC w") 'save-buffer)

(define-key evil-normal-state-map (kbd "SPC xs") 'save-buffer)
(define-key evil-normal-state-map (kbd "SPC xb") 'switch-to-buffer)
(define-key evil-normal-state-map (kbd "SPC xk") 'kill-buffer)
(define-key evil-normal-state-map (kbd "SPC xf") 'find-file)
(define-key evil-normal-state-map (kbd "SPC xx") 'execute-extended-command)
(define-key evil-normal-state-map (kbd "SPC xg") '(lambda ()
						 (interactive) 
						 (switch-to-buffer "*scratch*")))

(define-key evil-normal-state-map (kbd "SPC xrm") 'bookmark-set)
(define-key evil-normal-state-map (kbd "SPC xrb") 'bookmark-jump)
(define-key evil-normal-state-map (kbd "SPC xrr") 'copy-rectangle-to-register)
(define-key evil-normal-state-map (kbd "SPC xr ") 'point-to-register)

;; (define-key evil-normal-state-map (kbd "SPC xrg") 'insert-register)
;; (define-key evil-normal-state-map (kbd "SPC xrj") 'jump-to-register)
;; (define-key evil-normal-state-map (kbd "SPC xry") 'yank-rectangle)

(define-key evil-normal-state-map (kbd "SPC e") 'eshell)
(define-key evil-normal-state-map (kbd "SPC d") 'kill-this-buffer)
(define-key evil-normal-state-map (kbd "SPC q") 'kill-buffer-and-window)
(define-key evil-normal-state-map (kbd "SPC b") 'ibuffer)
(define-key evil-normal-state-map (kbd "SPC B") 'bookmark-bmenu-list)
(define-key evil-normal-state-map (kbd "SPC r") 'recentf-open-files)
(define-key evil-normal-state-map (kbd "SPC TAB") 'switch-to-buffer)
(define-key evil-normal-state-map (kbd "SPC 1") 'delete-other-windows)
(define-key evil-normal-state-map (kbd "SPC 0") 'delete-window)
(define-key evil-normal-state-map (kbd "SPC 2") 'split-window-below)
(define-key evil-normal-state-map (kbd "SPC 3") 'split-window-right)
(define-key evil-normal-state-map (kbd "SPC DEL") 'delete-other-windows)

(define-key evil-normal-state-map (kbd "SPC go") 'peng-ibuffer-filter-org-mode)
(define-key evil-normal-state-map (kbd "SPC gc") 'peng-ibuffer-filter-c-mode)
(define-key evil-normal-state-map (kbd "SPC ge") 'peng-ibuffer-filter-emacs-lisp-mode)
(define-key evil-normal-state-map (kbd "SPC gs") 'peng-ibuffer-filter-sql-mode)
(define-key evil-normal-state-map (kbd "SPC gd") 'peng-ibuffer-filter-dired-mode)
(define-key evil-normal-state-map (kbd "SPC gp") 'peng-ibuffer-filter-c++-mode)

(define-key evil-normal-state-map (kbd "SPC hf") 'describe-function)
(define-key evil-normal-state-map (kbd "SPC hk") 'describe-key)
(define-key evil-normal-state-map (kbd "SPC hc") 'describe-key-briefly)
(define-key evil-normal-state-map (kbd "SPC hv") 'describe-variable)
(define-key evil-normal-state-map (kbd "SPC hm") 'describe-mode)
(define-key evil-normal-state-map (kbd "SPC hb") 'describe-bindings)
(define-key evil-normal-state-map (kbd "SPC hr") 'info-emacs-manual)
(define-key evil-normal-state-map (kbd "SPC hi") 'info)

(define-key evil-normal-state-map (kbd "SPC cu") 'winner-undo)
(define-key evil-normal-state-map (kbd "SPC cr") 'winner-redo)
(define-key evil-normal-state-map (kbd "SPC cm") 'shell-command)
(define-key evil-normal-state-map (kbd "SPC cc") 'org-capture)

(define-key evil-normal-state-map (kbd "SPC j") 'bookmark-jump)
(define-key evil-normal-state-map (kbd "SPC a") 'org-agenda)
(define-key evil-normal-state-map (kbd "SPC DEL") 'delete-other-windows)
(define-key evil-normal-state-map (kbd "SPC <backspace>") 'delete-other-windows)
(define-key evil-normal-state-map (kbd "SPC gg") '(lambda ()
						    (interactive)
						    (switch-to-buffer "*scratch*"))
  )

(provide 'init-evil-spc-map)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-evil-spc-map.el ends here
