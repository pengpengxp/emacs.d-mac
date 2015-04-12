;;; --------------------------------------------------------------------------------
;;; 设置环境变量
;;; --------------------------------------------------------------------------------
(setenv "PATH" (shell-command-to-string "bash -i -c 'echo -n $PATH' 2>/dev/null"))

(setq HOME (getenv "HOME"))
(setq DIR (concat HOME "/.emacs.d"))
;;(setq GTD (concat HOME "/gtd"))
(setq LISP (concat DIR "/lisp"))
(setq SITE-LISP (concat DIR "/site-lisp"))
;; (add-to-list 'load-path DIR)
(add-to-list 'load-path SITE-LISP)
(add-to-list 'load-path LISP)
(let ((default-directory SITE-LISP))	;Don't add load-path after plugins every time
  (normal-top-level-add-subdirs-to-load-path))

(require 'init-el-get)

;; for mac
(require 'init-mac.el)

;;; my plugins
(require 'init-peng-copyfun)		;;;; some function I copyed from others
(require 'init-peng-prifun)		;;;; load function wrote by pengpengxp

;;; load each mode I have configured
(require 'init-evil)
(require 'init-evil-leader)

;;; to config the elpa
(require 'init-package)

;;;;; other plugins
(require 'init-scheme)
(require 'init-org)
(require 'init-gtd)
(require 'init-org-export)
(require 'init-org-page)
(require 'init-emacs-lisp)
;;(require 'init-w3m)
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
(require 'init-company-mode)		;company is the alternative for me
(require 'init-header2)
(require 'init-auto-insert)
(require 'init-outline-minor-mode.el)
(require 'init-color-theme)
(require 'init-ace-jump.el)
(require 'init-sr-speedbar)
;; (require 'init-tabbar)
(require 'init-deft)
(require 'init-markdown)
(require 'init-helm)

;;; the use of dash
(require 'helm-dash)			; do not need dash
(require 'init-dash)			; use dash in emacs

;; (require 'init-ido-cb.el)
;; (require 'init-ido)
;; (require 'init-icicles)
;; (require 'init-smex)

(require 'init-eim)
;; (require 'init-chinese-pyim)

(require 'init-auctex)			;;;;you need to install auctex first
(require 'init-smartparens)
(require 'init-window-numbering)
;; (require 'init-powerline)
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
(require 'init-expand-region)
(require 'init-calendar)
(require 'init-gnus)
(require 'init-smart-tab)
(require 'init-calfw)
(require 'alarm)
(require 'pinyin-search)
(require 'init-mustache)
(require 'init-xcscope)
(require 'cdlatex)
(require 'init-term-mode)
(require 'init-ispell)

;;; hydra需要配置，暂时不用
;; (require 'hydra)
;; (require 'hydra-ox)

;; (require 'init-ecb)			; 代码浏览起来更加好，但是应该需要更多的资源

;;; don't use too often
;; (require 'init-bm)

;;; plugins need no addtional settings
(require 'autopair)
(require 'ascii)
(require 'hide-region)
(require 'init-multi-term)
(require 'stardict)
(require 'dash)
(require 'iedit)

;;; pengpengxp's own mode
(require 'init-cc-mode)
(require 'init-bookmark-bmemu-mode)
(require 'init-Info-mode)
(require 'init-ruby)
;; (require 'init-java.el)
(require 'init-visual-line-mode)
(require 'init-BSDmakefile-mode)

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
