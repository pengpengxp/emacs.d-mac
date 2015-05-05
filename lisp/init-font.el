;;; my favourite font

;;; 在X-window下才这样设置字体
;; (if (display-graphic-p)
;;     (progn 
;;       (set-frame-font "Monaco-15")
;;       (set-fontset-font t 'han (font-spec :family "Hiragino Sans GB W3" :size 18))
;;       )
;;   )

;;; 设置这样一个固定宽度的字体，它应该既有英文字体也有中文字体。所以表
;;; 格这些就不用纠结了。
(set-frame-font "仿宋-16")

;;; 设置新的`frame'的字体
(add-to-list 'default-frame-alist
	     '(font . "仿宋-16"))

;; (require 'chinese-fonts-setup)

(provide 'init-font)
