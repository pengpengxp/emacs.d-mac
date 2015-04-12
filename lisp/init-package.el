;;; ----------------------------------------------------------------------
;;; 增加一些仓库
;;; ----------------------------------------------------------------------

;; (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;                          ("marmalade" . "http://marmalade-repo.org/packages/")
;;                          ("melpa" . "http://melpa.milkbox.net/packages/")))

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(provide 'init-package)



;;; 执行下面，如果没有安装对应的软件包，则会自己自动安装
;; (defvar prelude-packages
;;   '(ack-and-a-half auctex clojure-mode coffee-mode deft expand-region
;;                    gist groovy-mode haml-mode haskell-mode inf-ruby
;;                    magit magithub markdown-mode paredit projectile python
;;                    sass-mode rainbow-mode scss-mode solarized-theme
;;                    volatile-highlights yaml-mode yari zenburn-theme)
;;   "A list of packages to ensure are installed at launch.")

;; (defun prelude-packages-installed-p ()
;;   (loop for p in prelude-packages
;;         when (not (package-installed-p p)) do (return nil)
;;         finally (return t)))

;; (unless (prelude-packages-installed-p)
;;   ;; check for new packages (package versions)
;;   (message "%s" "Emacs Prelude is now refreshing its package database...")
;;   (package-refresh-contents)
;;   (message "%s" " done.")
;;   ;; install the missing packages
;;   (dolist (p prelude-packages)
;;     (when (not (package-installed-p p))
;;       (package-install p))))
