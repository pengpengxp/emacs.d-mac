(setq EVIL-DIR (concat SITE-LISP "evil/"))
(add-to-list 'load-path EVIL-DIR)
(add-to-list 'load-path (concat EVIL-DIR "evil-surround"))
(add-to-list 'load-path (concat EVIL-DIR "evil-nerd-commenter"))
(add-to-list 'load-path (concat EVIL-DIR "evil-visualstar"))
(add-to-list 'load-path (concat EVIL-DIR "evil-leader"))
(add-to-list 'load-path (concat EVIL-DIR "evil-numbers"))
(require 'evil)

(require 'evil-surround)
(require 'evil-nerd-commenter)
(require 'evil-visualstar)
(require 'evil-leader)
(evilnc-default-hotkeys)
(global-evil-surround-mode 1)
(evil-mode 1)

(require 'evil-numbers)
(define-key evil-normal-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt)

;;; 设置这些模式的默认evil模式
(evil-set-initial-state 'ibuffer-mode 'emacs)
(evil-set-initial-state 'bookmark-bmenu-mode 'emacs)
(evil-set-initial-state 'Info-mode 'emacs)
(evil-set-initial-state 'compilation-mode 'emacs)
(evil-set-initial-state 'help-mode 'emacs)
(evil-set-initial-state 'dired-mode 'emacs)
(evil-set-initial-state 'compilation-mode 'emacs)
(evil-set-initial-state 'apropos-mode 'emacs)
(evil-set-initial-state 'magit-mode  'emacs)
(evil-set-initial-state 'magit-process-mode 'emacs)
(evil-set-initial-state 'mew-draft-mode 'emacs)
(evil-set-initial-state 'mew-summary-mode 'emacs)
(evil-set-initial-state 'mew-message-mode 'emacs)
(evil-set-initial-state 'bm-show-mode 'emacs)
(evil-set-initial-state 'Man-mode 'emacs)


;;; esc就是退出insert模式。不再是emacs中的esc
(setq evil-esc-delay 0)

;;; evil-commenter config
(setq evilnc-hotkey-comment-operator ",,")

;;;设置evil各个模式cursor的形状
(setq evil-insert-state-cursor '("black" box))
(setq evil-emacs-state-cursor '("black" box))

;; ***************************************************************copy
;; remove all keybindings from insert-state keymap,it is VERY VERY important
(setcdr evil-insert-state-map nil) 

;;;把emacs模式下的按键绑定到Insert模式下
(define-key evil-insert-state-map
  (read-kbd-macro evil-toggle-key) 'evil-emacs-state)


;; but [escape] should switch back to normal state
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;;; use "kj" to return normal mode from insert mode 
;;; 这个函数不是很懂
(define-key evil-insert-state-map "k" #'cofi/maybe-exit)
(evil-define-command cofi/maybe-exit ()
  :repeat change
  (interactive)
  (let ((modified (buffer-modified-p)))
    (insert "k")
    (let ((evt (read-event (format "Insert %c to exit insert state" ?j)
			   nil 0.5)))
      (cond
       ((null evt) (message ""))
       ((and (integerp evt) (char-equal evt ?j))
	(delete-char -1)
	(set-buffer-modified-p modified)
	(push 'escape unread-command-events))
       (t (setq unread-command-events (append unread-command-events
					      (list evt))))))))
;; ***************************************************************copy

;; ;;; evil-define-key
;; use ',' as prefix key
(define-prefix-command 'peng-evil-global-map)
(define-key evil-normal-state-map (kbd ",") 'peng-evil-global-map)
(define-key evil-motion-state-map (kbd ",") 'peng-evil-global-map)

;; ;;; normal-map
(define-key evil-normal-state-map (kbd "DEL") 'delete-other-windows)
(define-key evil-normal-state-map "ei " 'find-file)
(define-key evil-normal-state-map ",," 'evilnc-comment-operator)
(define-key evil-normal-state-map ",1" 'delete-other-windows)
(define-key evil-normal-state-map ",0" 'delete-window)
(define-key evil-normal-state-map ",2" 'split-window-below)
(define-key evil-normal-state-map ",3" 'split-window-right)
(define-key evil-normal-state-map ",u" 'winner-undo)
(define-key evil-normal-state-map ",r" 'winner-redo)
(define-key evil-normal-state-map ",h" 'eshell)
(define-key evil-normal-state-map ",p" 'switch-to-buffer)
(define-key evil-normal-state-map ",n" 'save-buffer)
(define-key evil-normal-state-map ",k" 'kill-buffer)
(define-key evil-normal-state-map ",w" 'eshell)
(define-key evil-normal-state-map ",b" 'ibuffer)
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

;; ;;; motion map
(define-key evil-motion-state-map "ei " 'find-file)
(define-key evil-motion-state-map ",1" 'delete-other-windows)
(define-key evil-motion-state-map ",0" 'delete-window)
(define-key evil-motion-state-map ",2" 'split-window-below)
(define-key evil-motion-state-map ",3" 'split-window-right)
(define-key evil-motion-state-map ",u" 'winner-undo)
(define-key evil-motion-state-map ",r" 'winner-redo)
(define-key evil-motion-state-map ",h" 'eshell)
(define-key evil-motion-state-map ",p" 'switch-to-buffer)
(define-key evil-motion-state-map ",n" 'save-buffer)
(define-key evil-motion-state-map ",k" 'kill-buffer)
(define-key evil-motion-state-map ",w" 'eshell)
(define-key evil-motion-state-map ",b" 'ibuffer)
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
(define-key minibuffer-local-map [escape] 'helm-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'helm-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'helm-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'helm-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'helm-keyboard-quit)

(provide 'init-evil)
