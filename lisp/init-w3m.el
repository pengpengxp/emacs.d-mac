;; ;; pengpengxp's w3m-mode
(add-to-list 'load-path (concat SITE-LISP "emacs-w3m"))
(require 'w3m-load)
(provide 'w3m-e23)
(require 'w3m-lnum)
(setq w3m-home-page "www.baidu.com") ;set your home page
(autoload 'w3m "w3m" "Interface for w3m on Emacs." t)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
(autoload 'w3m-search "w3m-search" "Search words using emacs-w3m." t)
(setq w3m-use-toolbar t)
(setq browse-url-browser-function 'w3m-browse-url)                 ;set w3m as emacs's default browser默认还是不启用算了

;; 默认显示图片
(setq w3m-default-display-inline-images t)
(setq w3m-default-toggle-inline-images t)

(defun pengpengxp-w3m-mode ()
  (evil-emacs-state 1)
  (setq evil-insert-state-cursor '("black" box))
  (setq evil-emacs-state-cursor '("black" box))
  (setq w3m-lnum-mode 1)
  (setq truncate-lines nil) ;; 一行显示不完就换行。不要显示到另外一页
  (local-set-key (kbd "C-j") 'view-stardict-in-buffer)
  ;; for X-emacs
  (local-set-key (kbd "<C-return>") 'view-stardict-in-buffer)
  (local-set-key (kbd "<down>") 'evil-next-line)
  (local-set-key (kbd "<up>") 'evil-previous-line)
  (local-set-key (kbd "<left>") 'evil-backward-char)
  (local-set-key (kbd "<right>") 'evil-forward-char)
  (local-set-key (kbd "DEL") 'delete-window) ;;?????useless
  (evil-define-key 'normal evil-normal-state-local-map (kbd "r") 'w3m-redisplay-this-page)
  )
(add-hook 'w3m-mode-hook 'pengpengxp-w3m-mode)

(provide 'init-w3m)
