;; (setq pengpengxp-comma-map (make-sparse-keymap))

;;; 等待我写一出自己的`keymap'

;; (define-prefix-command 'pengpengxp-comma-map)
;; (global-set-key (kbd ",") 'pengpengxp-comma-map)
;; (defun peng-real-insert-comma ()
;;   (interactive)
;;   (insert ","))

;; (define-key pengpengxp-comma-map (kbd ",") 'peng-real-insert-comma)
;; (define-key pengpengxp-comma-map (kbd "x") ctl-x-map)
;; (define-key pengpengxp-comma-map (kbd "x f") 'find-file)



;; (defvar special-mode-map
;;   (let ((map (make-sparse-keymap)))
;;     (suppress-keymap map)
;;     (define-key map "q" 'quit-window)
;;     map))

;;;-------------------------------------------------------------------
;;; 
;;; M-c-key
;;; 
;;;-------------------------------------------------------------------
(setq peng-M-c-map (make-sparse-keymap))

(define-key peng-M-c-map (kbd "x") 'kill-region)
(define-key peng-M-c-map (kbd "c") 'capitalize-word)
(define-key peng-M-c-map (kbd "l") 'downcase-word)
(define-key peng-M-c-map (kbd "u") 'upcase-word)
(define-key peng-M-c-map (kbd "b") 'wg-switch-to-workgroup)
(define-key peng-M-c-map (kbd "k") 'ido-kill-buffer)
(define-key peng-M-c-map (kbd "M-i") 'idomenu)
(define-key peng-M-c-map (kbd "M-o") 'helm-occur)

;; (define-key peng-M-c-map (kbd "M-a") 'helm-ag-this-file)
;; (define-key peng-M-c-map (kbd "M-m") 'shell-command)
;; (define-key peng-M-c-map (kbd "M-A") 'helm-ag-this-file)

(define-key peng-M-c-map (kbd "M-a") 'peng-mark-to-beginning-of-line)
(define-key peng-M-c-map (kbd "M-e") 'peng-mark-to-end-of-line)
(define-key peng-M-c-map (kbd "M-l") 'peng-mark-line)
(define-key peng-M-c-map (kbd "M-m") 'peng-mark-back-to-indentation)
(define-key peng-M-c-map (kbd "M-w") 'peng-mark-current-word)

(define-key peng-M-c-map (kbd "M-f") 'ido-find-file)
(define-key peng-M-c-map (kbd "M-s") 'swiper)
(define-key peng-M-c-map (kbd "M-j") 'ido-bookmark-jump)
(define-key peng-M-c-map (kbd "M-b") 'wg-switch-to-workgroup)
(define-key peng-M-c-map (kbd "M-r") 'ido-recentf-find-file)
(define-key peng-M-c-map (kbd "M-z") 'ace-jump-zap-to-char)
(define-key peng-M-c-map (kbd "M-d") 'darkroom-mode)
(define-key peng-M-c-map (kbd "M-y") 'yas-ido-expand)
(define-key peng-M-c-map (kbd "C-x C-f") 'ido-find-file)

(define-key peng-M-c-map (kbd "go") 'peng-ibuffer-filter-org-mode)
(define-key peng-M-c-map (kbd "gc") 'peng-ibuffer-filter-c-mode)
(define-key peng-M-c-map (kbd "ge") 'peng-ibuffer-filter-emacs-lisp-mode)
(define-key peng-M-c-map (kbd "gs") 'peng-ibuffer-filter-sql-mode)
(define-key peng-M-c-map (kbd "gd") 'peng-ibuffer-filter-dired-mode)
(define-key peng-M-c-map (kbd "gp") 'peng-ibuffer-filter-c++-mode)

(define-key global-map (kbd "M-c") peng-M-c-map)
(define-key global-map (kbd "M-z") 'ace-jump-zap-to-char)

(peng-global-set-key (kbd "M-x") 'smex)


;;; peng goto key binding, use avy
(peng-global-set-key (kbd "M-g M-c") 'avy-goto-char-2)
(peng-global-set-key (kbd "M-g M-g") 'avy-goto-char)
(peng-global-set-key (kbd "M-g M-l") 'avy-goto-line)
(peng-global-set-key (kbd "M-g M-w") 'avy-goto-word-1)


;;;-------------------------------------------------------------------
;;; 
;;; evil-key
;;; 
;;;-------------------------------------------------------------------
;; (define-prefix-command 'peng-evil-normal-map)
;;; 定义一个自己的evil-normal-map，这个map是在normal模式下绑定到SPC中
;;; 的。
(setq peng-evil-normal-map (make-sparse-keymap))

;;; `universal-argument'
(define-key peng-evil-normal-map (kbd "u") 'universal-argument)

;;; define two special key for personal use
;; (require 'init-evil-spc-map)

;;; 自己`hack'evil的各状态的快捷键

;;; 定义从`SPC'和`comma'触发的快捷键
;;; normal map

;;; ----------------------------------------------------------------------
;;; 
;;; `:'使用`SPC :'或`;'来调用命令
;;; 
;;; ----------------------------------------------------------------------
(define-key peng-evil-normal-map (kbd ":") 'smex)
(define-key peng-evil-normal-map (kbd ";") 'smex)

;;; ----------------------------------------------------------------------
;;; 
;;; x-map
;;; 
;;; ----------------------------------------------------------------------
(setq peng-space-ctl-x-map (copy-keymap ctl-x-map))

(define-key peng-space-ctl-x-map (kbd "f") 'find-file)
(define-key peng-space-ctl-x-map (kbd "s") 'shell-command)
(define-key peng-space-ctl-x-map (kbd "p") 'pwd)
;;; x-c-map
(setq peng-space-x-c-map (make-sparse-keymap))
(define-key peng-space-x-c-map (kbd "c") 'calendar)
(define-key peng-space-ctl-x-map (kbd "c") peng-space-x-c-map)

(define-key peng-evil-normal-map (kbd "x") peng-space-ctl-x-map)

;;; ----------------------------------------------------------------------
;;; 
;;; h-map 帮助文档
;;; 
;;; ----------------------------------------------------------------------
(define-key peng-evil-normal-map (kbd "h") help-map) ;这个默认进入帮助

;;; ----------------------------------------------------------------------
;;; 
;;; a-map
;;; 
;;; ----------------------------------------------------------------------
(setq peng-space-a-map (make-sparse-keymap))
(define-key peng-space-a-map (kbd  "c")  'calc-dispatch)
(define-key peng-space-a-map (kbd  "d")  'dired)
(define-key peng-space-a-map (kbd  "p")  'proced)
(define-key peng-space-a-map (kbd  "u")  'undo-tree-visualize)
(define-key peng-space-a-map (kbd  "se") 'eshell)
(define-key peng-space-a-map (kbd  "si") 'shell)
(define-key peng-space-a-map (kbd  "sm") 'multi-term)
(define-key peng-evil-normal-map (kbd "a") peng-space-a-map)

;;; ----------------------------------------------------------------------
;;; 
;;; b-map
;;; 
;;; ----------------------------------------------------------------------
(setq peng-space-b-map (make-sparse-keymap))
(define-key peng-space-b-map (kbd "0")  'beginning-of-buffer)
(define-key peng-space-b-map (kbd "$")  'end-of-buffer)
(define-key peng-space-b-map (kbd "K")  'kill-other-buffers)
(define-key peng-space-b-map (kbd "k")  'ido-kill-buffer)
(define-key peng-space-b-map (kbd "n")  'switch-to-next-buffer)
(define-key peng-space-b-map (kbd "p")  'switch-to-prev-buffer)
(define-key peng-space-b-map (kbd "r")  'rename-current-buffer-file)
(define-key peng-space-b-map (kbd "w")  'read-only-mode)
(define-key peng-space-b-map (kbd "b")  'ibuffer)
(define-key peng-space-b-map (kbd "l")  'lusty-buffer-explorer)
;;; buffer-filter
(define-key peng-space-b-map (kbd "go") 'peng-ibuffer-filter-org-mode)
(define-key peng-space-b-map (kbd "gc") 'peng-ibuffer-filter-c-mode)
(define-key peng-space-b-map (kbd "ge") 'peng-ibuffer-filter-emacs-lisp-mode)
(define-key peng-space-b-map (kbd "gs") 'peng-ibuffer-filter-sql-mode)
(define-key peng-space-b-map (kbd "gd") 'peng-ibuffer-filter-dired-mode)
(define-key peng-space-b-map (kbd "gp") 'peng-ibuffer-filter-c++-mode)

(define-key peng-evil-normal-map (kbd "b") peng-space-b-map)
;; "bR"  'spacemacs/safe-revert-buffer
;; "b C-k" 'kill-matching-buffers-rudely
;; "bb"  'spacemacs/alternate-buffer ;; switch back and forth between two last buffers
;; "TAB" 'spacemacs/alternate-buffer
;; "be"  'spacemacs/safe-erase-buffer


;;; ----------------------------------------------------------------------
;;; 
;;; f-map
;;; 
;;; ----------------------------------------------------------------------
(setq peng-space-f-map (make-sparse-keymap))
;; (define-key peng-space-f-map (kbd  "F") 'helm-find-files)
(define-key peng-space-f-map (kbd  "f") 'ido-find-file)
(define-key peng-space-f-map (kbd  "F") 'peng-ido-fasd-find-file)
(define-key peng-space-f-map (kbd  "g") 'rgrep)
(define-key peng-space-f-map (kbd  "j") 'dired-jump)
(define-key peng-space-f-map (kbd  "S") 'evil-write-all)
(define-key peng-space-f-map (kbd  "s") 'lusty-sudo-explorer)
(define-key peng-space-f-map (kbd  "l") 'lusty-file-explorer)
(define-key peng-evil-normal-map (kbd "f") peng-space-f-map)
;; "fo" 'spacemacs/open-in-external-app
;; "fy" 'show-and-copy-buffer-filename
;; "fD"  'delete-current-buffer-file
;; "fei" 'find-user-init-file
;; "fes" 'find-spacemacs-file
;; "fec" 'find-contrib-file
;; "fed" 'find-dotfile
;; "fev" 'spacemacs/display-and-copy-version

;;; ----------------------------------------------------------------------
;;; 
;;; w-map
;;; 
;;; ----------------------------------------------------------------------
(setq peng-space-w-map (make-sparse-keymap))
(define-key peng-space-w-map (kbd "c") 'delete-window)
(define-key peng-space-w-map (kbd "d") 'toggle-current-window-dedication)
(define-key peng-space-w-map (kbd "H") 'evil-window-move-far-left)
(define-key peng-space-w-map (kbd "h") 'evil-window-left)
(define-key peng-space-w-map (kbd "J") 'evil-window-move-very-bottom)
(define-key peng-space-w-map (kbd "j") 'evil-window-down)
(define-key peng-space-w-map (kbd "K") 'evil-window-move-very-top)
(define-key peng-space-w-map (kbd "k") 'evil-window-up)
(define-key peng-space-w-map (kbd "L") 'evil-window-move-far-right)
(define-key peng-space-w-map (kbd "l") 'evil-window-right)
(define-key peng-space-w-map (kbd "m") 'toggle-maximize-buffer)
(define-key peng-space-w-map (kbd "M") 'toggle-maximize-centered-buffer)
(define-key peng-space-w-map (kbd "o") 'other-frame)
(define-key peng-space-w-map (kbd "R") 'rotate-windows)
(define-key peng-space-w-map (kbd "s") 'split-window-below)
(define-key peng-space-w-map (kbd "S") 'split-window-below-and-focus)
(define-key peng-space-w-map (kbd "-") 'split-window-below)
(define-key peng-space-w-map (kbd "U") 'winner-redo)
(define-key peng-space-w-map (kbd "u") 'winner-undo)
(define-key peng-space-w-map (kbd "v") 'split-window-right)
(define-key peng-space-w-map (kbd "V") 'split-window-right-and-focus)
(define-key peng-space-w-map (kbd "w") 'other-window)
(define-key peng-space-w-map (kbd "/") 'split-window-right)
(define-key peng-evil-normal-map (kbd "w") peng-space-w-map)
;; (define-key peng-space-w-map (kbd "b") 'switch-to-minibuffer-window)
;; (define-key peng-space-w-map (kbd "2") 'layout-double-columns)
;; (define-key peng-space-w-map (kbd "3") 'layout-triple-columns)

;;; ----------------------------------------------------------------------
;;; 
;;; g-map
;;; 
;;; ----------------------------------------------------------------------
(setq peng-space-g-map (make-sparse-keymap))
;;; buffer filter
(define-key peng-space-g-map (kbd "l") 'ace-jump-line-mode)
(define-key peng-space-g-map (kbd "w") 'ace-jump-word-mode)
(define-key peng-space-g-map (kbd "g") 'goto-line)
(define-key peng-space-g-map (kbd "c") 'goto-char)
(define-key peng-space-g-map (kbd "n") 'next-error)
(define-key peng-space-g-map (kbd "p") 'previous-error)
(define-key peng-evil-normal-map (kbd "g") peng-space-g-map)

;;; ----------------------------------------------------------------------
;;; 
;;; c-map
;;; 
;;; ----------------------------------------------------------------------
(setq peng-space-c-map (copy-keymap mode-specific-map))
;;; c-c-map 按`SPC c SPC'后的所有搪键绑定
(setq peng-space-c-c-map (make-sparse-keymap))
(define-key peng-space-c-c-map (kbd "b") 'ace-jump-buffer-with-configuration)
(define-key peng-space-c-map (kbd "SPC") peng-space-c-c-map)
;;; ----------------------------------------------------------------------
;;; c-x-map 按`SPC c x'后的绑定，for org-mode
(setq peng-space-c-x-map (make-sparse-keymap))
(define-key peng-space-c-x-map (kbd "s") 'org-schedule)
(define-key peng-space-c-x-map (kbd "d") 'org-deadline)
(define-key peng-space-c-x-map (kbd "p") 'org-set-property)
(define-key peng-space-c-x-map (kbd "i") 'org-clock-in)
(define-key peng-space-c-x-map (kbd "o") 'org-clock-out)
(define-key peng-space-c-x-map (kbd "w") 'org-cut-special)
(define-key peng-space-c-x-map (kbd "y") 'org-paste-special)
(define-key peng-space-c-x-map (kbd "c") 'org-copy-special)
(define-key peng-space-c-map (kbd "x") peng-space-c-x-map)
;;; ----------------------------------------------------------------------
(define-key peng-space-c-map (kbd "b") 'wg-switch-to-workgroup)
(define-key peng-space-c-map (kbd "c") 'org-capture)

(define-key peng-evil-normal-map (kbd "c") peng-space-c-map)

;;; ----------------------------------------------------------------------
;;; 
;;; others
;;; 
;;; ----------------------------------------------------------------------
(define-key evil-normal-state-map (kbd "M-n") 'scroll-up-command)
(define-key evil-normal-state-map (kbd "\\") 'evil-search-forward)
;; (define-key evil-normal-state-map (kbd "/") 'swiper)
(define-key evil-normal-state-map "m" 'point-to-register)
(define-key evil-normal-state-map "'" 'jump-to-register)
(define-key evil-normal-state-map "-" 'split-window-below)
(define-key evil-normal-state-map "|" 'split-window-right)
(define-key evil-normal-state-map "q" 'View-quit)
(define-key evil-normal-state-map (kbd "C-n") 'evil-next-line)
(define-key evil-normal-state-map (kbd "C-r") 'isearch-backward)
(define-key evil-normal-state-map (kbd "C-p") 'evil-previous-line)
(define-key evil-normal-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-normal-state-map (kbd "M-.") 'find-tag)
(define-key evil-normal-state-map (kbd "C-b") 'backward-char)
(define-key evil-normal-state-map (kbd "C-f") 'forward-char)
(define-key evil-normal-state-map (kbd "K") 'man)

(define-key evil-motion-state-map "-" 'split-window-below)
(define-key evil-motion-state-map "|" 'split-window-right)
(define-key evil-motion-state-map "m" 'point-to-register)
(define-key evil-motion-state-map "'" 'jump-to-register)
(define-key evil-motion-state-map (kbd "C-n") 'evil-next-line)
(define-key evil-motion-state-map (kbd "C-r") 'isearch-backward)
(define-key evil-motion-state-map (kbd "C-p") 'evil-previous-line)
(define-key evil-motion-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-motion-state-map (kbd "M-.") 'find-tag)

 ;;; visual-map
(define-key evil-visual-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-visual-state-map (kbd "C-b") 'backward-char)
(define-key evil-visual-state-map (kbd "C-f") 'forward-char)

;; evil quit
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)

(define-key minibuffer-local-map [escape] 'keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'keyboard-quit)

(define-key evil-normal-state-map (kbd "DEL") 'delete-other-windows)
(define-key evil-motion-state-map (kbd "DEL") 'delete-other-windows)
(define-key evil-normal-state-map (kbd "<backspace>") 'delete-other-windows)
(define-key evil-motion-state-map (kbd "<backspace>") 'delete-other-windows)
(define-key evil-normal-state-map "ei " 'find-file)
(define-key evil-motion-state-map "ei " 'find-file)

(define-key peng-evil-normal-map (kbd "d") 'kill-this-buffer)
(define-key peng-evil-normal-map (kbd "xx") 'smex)
(define-key peng-evil-normal-map (kbd "z") 'smex)

(define-key peng-evil-normal-map (kbd ",") 'evilnc-comment-operator)
(define-key peng-evil-normal-map (kbd "q") 'kill-buffer-and-window)
(define-key peng-evil-normal-map (kbd "j") 'ido-bookmark-jump)
(define-key peng-evil-normal-map (kbd "SPC") 'ace-jump-char-mode)
(define-key peng-evil-normal-map (kbd "t") 'bm-toggle)
(define-key peng-evil-normal-map (kbd "e") 'shell-switcher-switch-buffer)
(define-key peng-evil-normal-map (kbd "B") 'bookmark-bmenu-list)
(define-key peng-evil-normal-map (kbd "r") 'ido-recentf-find-file)
(define-key peng-evil-normal-map (kbd "s") 'save-buffer)
(define-key peng-evil-normal-map (kbd "TAB") 'peng-switch-to-other-buffer)
(define-key peng-evil-normal-map (kbd "<backtab>") 'switch-to-buffer)
(define-key peng-evil-normal-map (kbd "1") 'delete-other-windows)
(define-key peng-evil-normal-map (kbd "0") 'delete-window)
(define-key peng-evil-normal-map (kbd "2") 'split-window-below)
(define-key peng-evil-normal-map (kbd "3") 'split-window-right)
(define-key peng-evil-normal-map (kbd "DEL") 'delete-other-windows)
(define-key peng-evil-normal-map (kbd "xg") 'peng-goto-scratch)


;;; ----------------------------------------------------------------------
;;; 
;;; 把SPC和`,'绑定到我自己的`peng-evil-normal-map'上
;;; 
;;; ----------------------------------------------------------------------
(define-key evil-normal-state-map (kbd "SPC") peng-evil-normal-map)
(define-key evil-normal-state-map (kbd ",") peng-evil-normal-map)
(define-key evil-motion-state-map (kbd "SPC") peng-evil-normal-map)
(define-key evil-motion-state-map (kbd ",") peng-evil-normal-map)

;;; ----------------------------------------------------------------------
;;; 
;;; `,'在insert的时候还是比较奇怪，所以关闭了它
;;; 
;;; ----------------------------------------------------------------------
;; ;;; insert map
;; (define-prefix-command 'peng-evil-insert-map)
(setq peng-evil-insert-map (make-sparse-keymap))
;; (setq peng-evil-insert-map (copy-keymap peng-evil-normal-map))
;; ;;; insert中的需要可以输入`,'
;; (define-key peng-evil-insert-map (kbd ",") (lambda ()
;; 					     (interactive)
;; 					     (insert ",")))

;; ;; 使用`,.'来返回到normal
;; (define-key peng-evil-insert-map (kbd ".") #'evil-normal-state)
;; (define-key peng-evil-insert-map (kbd "s") #'peng-save-buffer-inter-evil-normal)

;; ;;; `,'使用相同的map
;; (define-key evil-insert-state-map (kbd ",") peng-evil-insert-map)

;; ;; 在minibuffer中这样也可以退出
;; (define-key minibuffer-local-map (kbd ",g") 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-map (kbd ",,") 'minibuffer-keyboard-quit)


;;;-------------------------------------------------------------------
;;; 
;; f8-map, make emacs like other apps
;;; 
;;;-------------------------------------------------------------------
(setq peng-f8-map (make-sparse-keymap))

(define-key peng-f8-map (kbd "c") 'xah-copy-line-or-region)
(define-key peng-f8-map (kbd "x") 'xah-cut-line-or-region)
(define-key peng-f8-map (kbd "v") 'yank)

(peng-global-set-key (kbd "<f8>") peng-f8-map)

;;; f9-map
(setq peng-f9-map (make-sparse-keymap))
(define-key peng-f9-map (kbd "<f9>") 'shell-command) ;test
(peng-global-set-key (kbd "<f9>") peng-f9-map)

;;;-------------------------------------------------------------------
;;; 
;;; f5-map use for compiling and eye protection
;;; 
;;;-------------------------------------------------------------------
(setq peng-f5-map (make-sparse-keymap))

;;; for compile
(define-key peng-f5-map (kbd "<f5>") 'compile)
(define-key peng-f5-map (kbd "r") 'recompile)
(define-key peng-f5-map (kbd "l") 'peng-list-current-file-tags)

;;;F5 for eye protected
(define-key peng-f5-map (kbd "ee") 'peng-eyerest-show-rest)
(define-key peng-f5-map (kbd "er") 'peng-eyerest-restart)
(define-key peng-f5-map (kbd "ep") 'peng-eyerest-pause)
(define-key peng-f5-map (kbd "ec") 'peng-eyerest-continue)
(define-key peng-f5-map (kbd "eg") 'peng-eye-gymnistic)
(define-key peng-f5-map (kbd "es") 'peng-eyerest-reset)
(define-key peng-f5-map (kbd "ek") 'peng-eyerest-kill)
;;;F5 for eye protected

(peng-global-set-key (kbd "<f5>") peng-f5-map)

;;;-------------------------------------------------------------------
;;; 
;;; f6-map
;;; 
;;;-------------------------------------------------------------------
(setq peng-f6-map (make-sparse-keymap))
(peng-global-set-key (kbd "<f6>") peng-f6-map)

;;; 在当前文件夹快速打开文件管理器
(define-key peng-f6-map (kbd "e") '(lambda ()
				       (interactive)
				       (peng-async-shell-command (concat "nautilus " 
									 default-directory
									 "&"))))
(define-key peng-f6-map (kbd "n") '(lambda ()
				       (interactive)
				       (peng-async-shell-command (concat "dolphin " 
									 default-directory
									 "&"))))
;;; 在当前文件夹快速打开终端
(define-key peng-f6-map (kbd "t") '(lambda ()
				       (interactive)
				       (peng-async-shell-command (concat "gnome-terminal && ls "
									 " "
									 default-directory
									 " &"))))
(peng-global-set-key (kbd "<f12>") 'view-stardict-in-buffer)

;;;-------------------------------------------------------------------
;;; 
;; global-key settings
;;; 
;;;-------------------------------------------------------------------
(peng-global-set-key (kbd "<delete>") 'view-stardict-in-buffer)
(peng-global-set-key (kbd "C-c m") 'magit-status)

;;; MISC
(peng-global-set-key (kbd "C-M-0") 'delete-window)
(peng-global-set-key (kbd "C-M-1") 'delete-other-windows)
(peng-global-set-key (kbd "C-M-2") 'split-window-below)
(peng-global-set-key (kbd "C-M-3") 'split-window-right)
(peng-global-set-key (kbd "<C-tab>") '(lambda ()
					(interactive)
					(switch-to-buffer (other-buffer))))

;; (peng-global-set-key (kbd "<C-tab>") 'other-window)
(peng-global-set-key (kbd "<M-tab>") 'switch-to-buffer)

(peng-global-set-key (kbd "s-v") 'view-mode)
(peng-global-set-key (kbd "C-+") 'text-scale-increase)
(peng-global-set-key (kbd "C--") 'text-scale-decrease)
(peng-global-set-key (kbd "\C-cn") 'autopair-mode)
(peng-global-set-key (kbd "C-x C-b") 'ibuffer)

;; (peng-global-set-key (kbd "<C-up>") 'enlarge-window)
;; (peng-global-set-key (kbd "<C-down>") 'shrink-window)
(peng-global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(peng-global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)

;;; M-c-x-map for ido
(setq peng-M-c-x-map (make-sparse-keymap))
(define-key peng-M-c-x-map (kbd "i") 'peng-ido-insert-ls-and-grep)
(define-key peng-M-c-x-map (kbd "j") 'peng-ido-jump)

(peng-global-set-key (kbd "M-c M-x") peng-M-c-x-map)



;;; global map for cscope

(setq peng-cscope-map (make-sparse-keymap))
(define-key peng-cscope-map (kbd "A") 'cscope-unset-initial-directory)
(define-key peng-cscope-map (kbd "B") 'cscope-display-buffer-toggle)
(define-key peng-cscope-map (kbd "C") 'cscope-find-called-functions)
(define-key peng-cscope-map (kbd "D") 'cscope-dired-directory)
(define-key peng-cscope-map (kbd "E") 'cscope-edit-list-of-files-to-index)
(define-key peng-cscope-map (kbd "G") 'cscope-find-global-definition-no-prompting)
(define-key peng-cscope-map (kbd "I") 'cscope-index-files)
(define-key peng-cscope-map (kbd "L") 'cscope-create-list-of-files-to-index)
(define-key peng-cscope-map (kbd "N") 'cscope-next-file)
(define-key peng-cscope-map (kbd "P") 'cscope-prev-file)
(define-key peng-cscope-map (kbd "S") 'cscope-tell-user-about-directory)
(define-key peng-cscope-map (kbd "W") 'cscope-tell-user-about-directory)
(define-key peng-cscope-map (kbd "a") 'cscope-set-initial-directory)
(define-key peng-cscope-map (kbd "b") 'cscope-display-buffer)
(define-key peng-cscope-map (kbd "c") 'cscope-find-functions-calling-this-function)
(define-key peng-cscope-map (kbd "d") 'cscope-find-global-definition)
(define-key peng-cscope-map (kbd "e") 'cscope-find-egrep-pattern)
(define-key peng-cscope-map (kbd "f") 'cscope-find-this-file)
(define-key peng-cscope-map (kbd "g") 'cscope-find-global-definition)
(define-key peng-cscope-map (kbd "i") 'cscope-find-files-including-file)
(define-key peng-cscope-map (kbd "n") 'cscope-next-symbol)
(define-key peng-cscope-map (kbd "p") 'cscope-prev-symbol)
(define-key peng-cscope-map (kbd "s") 'cscope-find-this-symbol)
(define-key peng-cscope-map (kbd "t") 'cscope-find-this-text-string)
(define-key peng-cscope-map (kbd "u") 'cscope-pop-mark)

(define-key evil-normal-state-map (kbd "SPC v") peng-cscope-map)



(provide 'init-keys)
