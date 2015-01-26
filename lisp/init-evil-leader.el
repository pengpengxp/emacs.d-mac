;;;evil-leader
(require 'evil)
(require 'bm)

;; 使用这个，evil-normal-state-local-map没有用。最后还是我自己绑定了

;; I find this is very usefullLESS
;; (global-evil-leader-mode 1)
;; (evil-leader/set-leader "<SPC>")
;; (evil-leader/set-key 
;;   "t" 'bm-toggle
;;   "w" 'save-buffer
;;   "SPC" 'evil-buffer
;;   "x" 'execute-extended-command
;;   "e" 'eshell
;;   "d" 'kill-this-buffer
;;   "q" 'kill-buffer-and-window
;;   "b" 'ibuffer
;;   "B" 'bookmark-bmenu-list
;;   "r" 'recentf-open-files
;;   "TAB" 'switch-to-buffer
;;   "1" 'delete-other-windows
;;   "0" 'delete-window
;;   "2" 'split-window-below
;;   "3" 'split-window-right
;;   "DEL" 'delete-other-windows
;;   "f" 'find-file
;;   "go" 'peng-ibuffer-filter-org-mode
;;   "gc" 'peng-ibuffer-filter-c-mode
;;   "ge" 'peng-ibuffer-filter-emacs-lisp-mode
;;   "gs" 'peng-ibuffer-filter-sql-mode
;;   "gd" 'peng-ibuffer-filter-dired-mode
;;   "gp" 'peng-ibuffer-filter-c++-mode
;;   "gg" '(lambda ()
;; 	  (interactive)
;; 	  (switch-to-buffer "*scratch*"))
;;   "hf" 'describe-function
;;   "hk" 'describe-key
;;   "hc" 'describe-key-briefly
;;   "hv" 'describe-variable
;;   "hm" 'describe-mode
;;   "hr" 'info-emacs-manual
;;   "hi" 'info
;;   "cu" 'winner-undo
;;   "cr" 'winner-redo
;;   "cm" 'shell-command
;;   "cc" 'org-capture
;;   "j" 'bookmark-jump
;;   "a" 'org-agenda
;;   "DEL" 'delete-other-windows
;;   "<backspace>" 'delete-other-windows
;;   )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-key evil-normal-state-map (kbd "SPC t") 'bm-toggle)   
(define-key evil-normal-state-map (kbd "SPC w") 'save-buffer)
(define-key evil-normal-state-map (kbd "SPC SPC") 'evil-buffer)
(define-key evil-normal-state-map (kbd "SPC x") 'execute-extended-command)
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
(provide 'init-evil-leader)

