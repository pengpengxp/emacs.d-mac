;;; my favourite font

;;; 在X-window下才这样设置字体
(when window-system
    (progn 
      (set-frame-font "Monaco-13")
      (set-fontset-font t 'han (font-spec :family "Hiragino Sans GB W3" :size 20))
      )
  )

(provide 'init-font)

