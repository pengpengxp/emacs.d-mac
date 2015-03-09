;;; 设置默认字体列表，按`C-c C-c'测试字体显示效果
(setq cfs--custom-set-fonts-names
      '(
        ("PragmataPro" "Monaco" "Consolas" "Menlof" "DejaVu Sans Mono" "Droid Sans Mono Pro" "Droid Sans Mono" "Inconsolata" "Source Code Pro" "Lucida Console" "Envy Code R" "Andale Mono" "Lucida Sans Typewriter" "monoOne" "Lucida Typewriter" "Panic Sans" "Bitstream Vera Sans Mono" "HyperFont" "PT Mono" "Ti92Pluspc" "Excalibur Monospace" "Courier New" "Courier" "Cousine" "Fira Mono" "Lekton" "Ubuntu Mono" "Liberation Mono" "M+ 1mn" "BPmono" "Free Mono" "Anonymous Pro" "ProFont" "ProFontWindows" "Latin Modern Mono" "Code 2002" "ProggyCleanTT" "ProggyTinyTT")
        ("黑体" "文泉驿等宽微米黑" "Microsoft Yahei" "Microsoft_Yahei" "微软雅黑" "Hiragino Sans GB" "文泉驿等宽正黑" "文泉驿正黑" "文泉驿点阵正黑" "新宋体" "宋体" "楷体_GB2312" "仿宋_GB2312" "幼圆" "隶书" "方正姚体" "方正舒体" "方正粗圆_GBK" "华文仿宋" "华文中宋" "华文彩云" "华文新魏" "华文细黑" "华文行楷")
        ("PragmataPro" "Courier New")
       ))

;;; 为每个字号(9 10.5 11.5 12.5 14 16 18 20 22)设置中文调整系数，使中英文等宽度。
(setq cfs--custom-set-fonts-scales
       '(1.05 1.05 1.1 1.1 1.1 1.05 1.0 1.05 1.05))

;; ;;; for setting
;; (peng-global-set-key (kbd "<C-up>") 'cfs--increment-font-scale-at-point)
;; (peng-global-set-key (kbd "<C-down>") 'cfs--decrement-font-scale-at-point)
