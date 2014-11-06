;;;eim
(add-to-list 'load-path (concat SITE-LISP "emacs-eim"))
(autoload 'eim-use-package "eim" "Another emacs input method")

;; Tooltip 暂时还不好用
(setq eim-use-tooltip nil)

(register-input-method
 "eim-wb" "euc-cn" 'eim-use-package
 "五笔" "汉字五笔输入法" "wb.txt")
(register-input-method
 "eim-py" "euc-cn" 'eim-use-package
 "拼音" "汉字拼音输入法" "py.txt")

(require 'eim-extra)
(global-set-key (kbd "<C-backspace>") 'toggle-input-method)
;; 用 ; 暂时输入英文
(global-set-key (kbd ";") 'eim-insert-ascii)
(peng-global-set-key (kbd "s-;") 'eim-insert-ascii)

(setq default-input-method "eim-py")

(add-hook 'eim-active-hook '(lambda ()
			      (setq eim-page-length 9)))

(provide 'init-eim)
