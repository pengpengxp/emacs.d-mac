;;; --------------------------------------------------------------------------------
;;; 设置环境变量
;;; --------------------------------------------------------------------------------
(setenv "PATH" (shell-command-to-string "bash -i -c 'echo -n $PATH' 2>/dev/null"))

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

;;; load each mode I have configured
;; (require 'init-peng-copyfun)		;;;; some function I copyed from others
(require 'init-peng-prifun)		;;;; load function wrote by pengpengxp
(require 'init-evil)
(require 'init-w3m)
(require 'stardict)

(require 'init-helm)

(require 'init-font)
(require 'init-global)
(desktop-save-mode -1)

(w3m)
