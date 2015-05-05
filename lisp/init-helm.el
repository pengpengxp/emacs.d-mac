;;; use helm to complete
(add-to-list 'load-path (concat SITE-LISP "helm"))
(require 'helm-config)
(require 'helm-etags+)
(require 'helm-ag)

;;; 默认不打开
(helm-mode -1)

;;; make sure Enter do what I want
(setq helm-exit-idle-delay 0)
;;; rebinding the tab
(define-key helm-map (kbd "TAB") 'helm-next-line)
(define-key helm-map (kbd "<backtab>") 'helm-previous-line)

;; For find-file etc.This is very helpful when I'm familliar with TAB
;; complesion
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "<tab>") 'helm-execute-persistent-action)

;;; 在`eshell'中使用helm时这样会好一点
(define-key helm-comp-read-map (kbd "TAB") 'helm-confirm-and-exit-minibuffer)
(define-key helm-comp-read-map (kbd "<tab>") 'helm-confirm-and-exit-minibuffer)
(define-key helm-comp-read-map (kbd "<C-tab>") 'helm-confirm-and-exit-minibuffer)

(require 'helm-eshell)
(define-key helm-esh-completion-map (kbd "<tab>") 'helm-confirm-and-exit-minibuffer)
(define-key helm-esh-completion-map (kbd "<C-tab>") 'helm-confirm-and-exit-minibuffer)

;; For helm-find-files etc.
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)

(setq helm-completing-read-handlers-alist '(
					    (lusty-buffer-explorer)
					    (lusty-file-explorer)
					    (lusty-sudo-explorer)
					    (ffap-alternate-file)
					    (tmm-menubar)
					    ;; (describe-function . helm-completing-read-symbols)
					    ;; (describe-variable . helm-completing-read-symbols)
					    ;; (debug-on-entry . helm-completing-read-symbols)
					    ;; (find-function . helm-completing-read-symbols)
					    ;; (find-tag . helm-completing-read-with-cands-in-buffer)
					    ;; 修改下面的，前端都变为ido的了
					    (describe-function . ido)
					    (describe-variable . ido)
					    (debug-on-entry . ido)
					    (find-function . ido)
					    (find-tag . ido)
					    (find-file . ido)
					    ))

(peng-global-set-key (kbd "M-s o") 'helm-occur)
(peng-global-set-key (kbd "M-s s") 'helm-occur-from-isearch)
(peng-global-set-key (kbd "M-s i") 'helm-imenu)
(peng-global-set-key (kbd "M-s a") 'helm-ag-this-file)
(peng-global-set-key (kbd "M-s A") 'helm-ag)
(peng-global-set-key (kbd "M-s p") 'helm-ag-pop-stack)

(provide 'init-helm)
