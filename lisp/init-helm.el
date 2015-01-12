;;; use helm to complete
(add-to-list 'load-path (concat SITE-LISP "helm"))
(require 'helm-config)
(require 'helm-etags+)

(helm-mode 1)
;;; make sure Enter do what I want
(setq helm-exit-idle-delay 0)
;;; rebinding the tab
(define-key helm-map (kbd "TAB") 'helm-next-line)
(define-key helm-map (kbd "<backtab>") 'helm-previous-line)
;; For find-file etc.
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
;; For helm-find-files etc.
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)

(setq helm-completing-read-handlers-alist '((lusty-buffer-explorer)
					    (lusty-file-explorer)
					    (lusty-sudo-explorer)
					    (describe-function . helm-completing-read-symbols)
					    (describe-variable . helm-completing-read-symbols)
					    (debug-on-entry . helm-completing-read-symbols)
					    (find-function . helm-completing-read-symbols)
					    (find-tag . helm-completing-read-with-cands-in-buffer)
					    (ffap-alternate-file)
					    (tmm-menubar)
					    ;; (find-file . ido) ;set ido manner to find file
					    ))

(peng-global-set-key (kbd "M-s o") 'helm-occur)
(peng-global-set-key (kbd "M-s s") 'helm-occur-from-isearch)
(peng-global-set-key (kbd "M-s i") 'helm-imenu)

(provide 'init-helm)
