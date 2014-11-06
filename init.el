;;; --------------------------------------------------------------------------------
;;; 设置环境变量
;;; --------------------------------------------------------------------------------
(setenv "PATH" (concat "/home/pengpengxp/peng_bin:" (getenv "PATH")))

(setq HOME (getenv "HOME"))
(setq DIR (concat HOME "/.emacs.d"))
(setq GTD (concat HOME "/gtd"))
(setq LISP (concat DIR "/lisp"))
(setq SITE-LISP (concat DIR "/site-lisp"))
(add-to-list 'load-path DIR)
(add-to-list 'load-path SITE-LISP)
(add-to-list 'load-path LISP)
(let ((default-directory SITE-LISP))	;Don't add load-path after plugins every time
  (normal-top-level-add-subdirs-to-load-path))

;;; my plugins
(require 'init-peng-copyfun)		;;;; some function I copyed from others
(require 'init-peng-prifun)		;;;; load function wrote by pengpengxp

;;; load each mode I have configured
(require 'init-evil)
(require 'init-evil-leader)

;;; other plugins
(require 'init-scheme)
(require 'init-org)
(require 'init-org-export)
(require 'init-emacs-lisp)
(require 'init-w3m)
(require 'init-latex)
(require 'init-compilation)
(require 'init-sundry)
(require 'init-eshell)
(require 'init-sql)
(require 'init-ibuffer)
(require 'init-shell-script)
(require 'init-dired)
(require 'init-cuda)
(require 'init-yasnippet)
(require 'init-auto-complete)

(require 'init-helm)
;; (require 'init-ido)
;; (require 'init-icicles)
;; (require 'init-smex)

(require 'init-eim)
(require 'init-auctex)			;;;;you need to install auctex first
(require 'init-smartparens)
(require 'init-window-numbering)
(require 'init-powerline)
(require 'init-guide-key)
(require 'init-lusty-explorer)		; 和helm有些其别。平时没怎么用到
(require 'init-shell-pop)
;; (require 'init-flycheck)		;感觉用处不是很大？？
(require 'init-uniquify)		;make the buffer unique
(require 'init-weibo)
(require 'init-paredit)
(require 'init-slime)
(require 'init-magit)
(require 'init-mew)

;;; don't use too often
;; (require 'init-bm)

;;; plugins need no addtional settings
(require 'autopair)
(require 'ascii)
(require 'hide-region)
(require 'multi-term)
(require 'stardict)
(require 'dash)
(require 'iedit)

;;; pengpengxp's own mode
(require 'init-cc-mode)
(require 'init-bookmark-bmemu-mode)
(require 'init-Info-mode)

;;; set my default tags table
(require 'init-tags)

;;; load my macro
(require 'init-macro)

;;; global settings need to put at last,since It may use some function provided above
(require 'init-font)
(require 'init-global)

;;; require the test file
(require 'init-test)

(provide 'init)
