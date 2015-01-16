;;; This is pengpengxp's global settings
(setq backup-inhibited t)
(desktop-save-mode 1)

;; my personal information
(setq user-full-name "pengpengxp")
(setq user-mail-address "pengpengxppri@gmail.com")

;;; 光标不要闪动
(blink-cursor-mode -1)

;;; 开始不需要使用menu-bar，scroll-bar这些
(menu-bar-mode -1)

;; (when window-system
;;   (scroll-bar-mode -1))

(if (display-graphic-p)
    (scroll-bar-mode -1))

;; Only start server mode if I'm not root
(unless (string-equal "root" (getenv "USER"))
  (require 'server)
  (unless (server-running-p) (server-start)))

;;; 关闭process的时候不需要询问。
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
	    kill-buffer-query-functions))

;;;copy from wangyin
(setq kill-ring-max 200)
(setq scroll-margin 3
      scroll-conservatively 10000)
(setq default-major-mode 'text-mode)
(mouse-avoidance-mode 'banish)
;;;copy from wangyin

;;pengpengxp's global settings

;;; f5-map use for compiling and eye protection
(define-prefix-command 'F5-map)
(global-set-key (kbd "<f5>") 'F5-map)
;;; for compile
(peng-global-set-key (kbd "<f5> <f5>") 'compile)
(peng-global-set-key (kbd "<f5> r") 'recompile)
(peng-global-set-key (kbd "<f5> l") 'peng-list-current-file-tags)

;;;F5 for eye protected
(peng-global-set-key (kbd "<f5> ee") 'peng-eyerest-show-rest)
(peng-global-set-key (kbd "<f5> er") 'peng-eyerest-restart)
(peng-global-set-key (kbd "<f5> ep") 'peng-eyerest-pause)
(peng-global-set-key (kbd "<f5> ec") 'peng-eyerest-continue)
(peng-global-set-key (kbd "<f5> eg") 'peng-eye-gymnistic)
(peng-global-set-key (kbd "<f5> es") 'peng-eyerest-reset)
(peng-global-set-key (kbd "<f5> ek") 'peng-eyerest-kill)
;;;F5 for eye protected

;;; f6-map use for calling the system applications
(define-prefix-command 'F6-map)
(global-set-key (kbd "<f6>") 'F6-map)
;;; 在当前文件夹快速打开文件管理器
(peng-global-set-key (kbd "<f6> e") '(lambda ()
				       (interactive)
				       (peng-async-shell-command (concat "thunar " 
							      default-directory
							      "&"))))
(peng-global-set-key (kbd "<f6> n") '(lambda ()
				       (interactive)
				       (peng-async-shell-command (concat "nautilus " 
							      default-directory
							      "&"))))
;;; 在当前文件夹快速打开终端
(peng-global-set-key (kbd "<f6> t") '(lambda ()
				       (interactive)
				       (peng-async-shell-command (concat "gnome-terminal && ls "
									 " "
									 default-directory
									 " &"))))

;; f8-map the global key binding are all here
(define-prefix-command 'F8-map)
(global-set-key (kbd "<f8>") 'F8-map)

(peng-global-set-key (kbd "<f8> j") 'bookmark-jump)
(peng-global-set-key (kbd "<f8> w") 'save-buffer)
(peng-global-set-key (kbd "<f8> f") 'find-file)
(peng-global-set-key (kbd "<f8> d") 'kill-this-buffer)
(peng-global-set-key (kbd "<f8> q") 'kill-buffer-and-window)
(peng-global-set-key (kbd "<f8> r") 'recentf-open-files)
(peng-global-set-key (kbd "<f8> a") 'org-agenda)
(peng-global-set-key (kbd "<f8> s") 'peng-toggle-gnome-terminal)
(peng-global-set-key (kbd "<f8> <backspace>") 'delete-other-windows)
(peng-global-set-key (kbd "<f8> <return>") 'delete-window)
(peng-global-set-key (kbd "<f8> gg") 'peng-goto-scratch)
(peng-global-set-key (kbd "<f8> gn") 'peng-toggle-gnome-terminal)
(peng-global-set-key (kbd "<f8> go") 'peng-ibuffer-filter-org-mode)
(peng-global-set-key (kbd "<f8> ge") 'peng-ibuffer-filter-emacs-lisp-mode)
(peng-global-set-key (kbd "<f8> gd") 'peng-ibuffer-filter-dired-mode)
(peng-global-set-key (kbd "<f8> gc") 'peng-ibuffer-filter-c-mode)
(peng-global-set-key (kbd "<f8> gp") 'peng-ibuffer-filter-c++-mode)
(peng-global-set-key (kbd "<f8> <tab>") 'switch-to-buffer)
(peng-global-set-key (kbd "<f8> e") 'eshell)
(peng-global-set-key (kbd "<f8> x") 'execute-extended-command)
(peng-global-set-key (kbd "<f8> h k") 'describe-key)
(peng-global-set-key (kbd "<f8> h f") 'describe-function)
(peng-global-set-key (kbd "<f8> h v") 'describe-variable)
(peng-global-set-key (kbd "<f8> h r") 'info-emacs-manual)
(peng-global-set-key (kbd "<f8> 1") 'delete-other-windows)
(peng-global-set-key (kbd "<f8> 0") 'delete-window)
(peng-global-set-key (kbd "<f8> 2") 'split-window-below)
(peng-global-set-key (kbd "<f8> 3") 'split-window-right)
(peng-global-set-key (kbd "<f8> c u") 'winner-undo)
(peng-global-set-key (kbd "<f8> c r") 'winner-redo)
(peng-global-set-key (kbd "<f8> c m") 'shell-command)
(peng-global-set-key (kbd "<f8> c c") 'org-capture)
(peng-global-set-key (kbd "<f8> c l") 'calendar)
(peng-global-set-key (kbd "<f8> b") 'ibuffer)
(peng-global-set-key (kbd "<f8> <f8>") '(lambda ()
					  (interactive)
					  (switch-to-buffer (other-buffer))))
(peng-global-set-key (kbd "<f8> zf") 'w3m-find-file)
(peng-global-set-key (kbd "<f8> zb") 'w3m-browse-url)


;;; f9 map for using pengpengxp's personal function
(define-prefix-command 'F9-map)
(global-set-key (kbd "<f9>") 'F9-map)
(peng-global-set-key (kbd "<f9> ce") 'peng-change-current-file-to-executable)

(peng-global-set-key (kbd "<f12>") 'view-stardict-in-buffer)
(peng-global-set-key (kbd "<delete>") 'view-stardict-in-buffer)
(peng-global-set-key (kbd "C-c m") 'magit-status)

;;; MISC
(peng-global-set-key (kbd "C-M-0") 'delete-window)
(peng-global-set-key (kbd "C-M-1") 'delete-other-windows)
(peng-global-set-key (kbd "C-M-2") 'split-window-below)
(peng-global-set-key (kbd "C-M-3") 'split-window-right)
;; (peng-global-set-key (kbd "<C-tab>") '(lambda ()
;; 				   (interactive)
;; 				   (switch-to-buffer (other-buffer))))
(peng-global-set-key (kbd "<C-tab>") 'other-window)
(peng-global-set-key (kbd "s-v") 'view-mode)
(peng-global-set-key (kbd "C-+") 'text-scale-increase)
(peng-global-set-key (kbd "C--") 'text-scale-decrease)
(peng-global-set-key (kbd "\C-cn") 'autopair-mode)
(peng-global-set-key (kbd "C-x C-b") 'ibuffer)
(peng-global-set-key (kbd "<C-up>") 'enlarge-window)
(peng-global-set-key (kbd "<C-down>") 'shrink-window)
(peng-global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(peng-global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)

;;;use for the alias `ls --color=auto`,if you don't use it,there will be some garbled
;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; other
(display-time)
(show-paren-mode t)

;; ;;;the set for cuda .cu file
;; (setq auto-mode-alist
;;       (append
;;        ;;File name ends in '.cu'
;;        '(("\\.cu\\'". c-mode))
;;        auto-mode-alist))

;;;; the following should give fullscreen mode when F11 is depressed,I find it from the internet
;;; only usefull in Xemacs,you don't need it in terminal 
;; (when window-system
;;   (progn
;;     (peng-global-set-key [f11] '(lambda ()
;; 			     (interactive)
;; 			     (set-frame-parameter nil 'fullscreen
;; 						  (if (frame-parameter nil 'fullscreen) nil 'fullboth))
;; 			     ;; ;; If you want the fullscreen emacs to be very minimal (no tool bar, scroll bar, or menu bar, also add:
;; 			     (progn
;; 			       (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))  ;; no toolbar
;; 			       (menu-bar-mode -1) ;;no menubar
;; 			       ;; (scroll-bar-mode -1) ;; no scroll bar
;; 			       )))))

(if (display-graphic-p)
  (progn
    (peng-global-set-key [f11] '(lambda ()
			     (interactive)
			     (set-frame-parameter nil 'fullscreen
						  (if (frame-parameter nil 'fullscreen) nil 'fullboth))
			     ;; ;; If you want the fullscreen emacs to be very minimal (no tool bar, scroll bar, or menu bar, also add:
			     (progn
			       (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))  ;; no toolbar
			       (menu-bar-mode -1) ;;no menubar
			       ;; (scroll-bar-mode -1) ;; no scroll bar
			       )))))
;; for winner-mode
(winner-mode 1)
(peng-global-set-key (kbd "C-c u") 'winner-undo)
(peng-global-set-key (kbd "C-c r") 'winner-redo)

;;; open recentf-file-mode
(recentf-mode 1)

;;scroll smoothly in emacs
;;(setq scroll-conservatively 10000)
;; (load "smooth-scroll.el")

;;; y/n replace yes/no
(setq yes-or-no-p 'y-or-n-p)

;;; use registor easily
(peng-global-set-key (kbd "C-x SPC") 'point-to-register)
(peng-global-set-key (kbd "C-x j") 'jump-to-register)

;;; MISC
(peng-unshow-all-tools)
(setq column-number-mode t)
;; goto scratch easily
(peng-global-set-key (kbd "C-x C-g") 'peng-goto-scratch)

;; split windows horizontal by default
(setq split-height-threshold nil)
(setq split-width-threshold 0)

;;; use easypg to encrypt my secret files
;;don't want to input the password after each modifying
(setq epa-file-cache-passphrase-for-symmetric-encryption t)

;;; revert-buffer automaticcally
(global-auto-revert-mode 1)

;;; 这样以后，应该每次使用narrow这些都不需要提醒了
(put 'narrow-to-region 'disabled nil)

(provide 'init-global)
