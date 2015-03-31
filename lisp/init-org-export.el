(require 'ox)
(require 'ox-html)
(require 'ox-publish)


;;;这两个函数可以使得org导出html时候不出现换行变空格的问题。
(defun clear-single-linebreak-in-cjk-string (string)
  "clear single line-break between cjk characters that is usually soft line-breaks"
  (let* ((regexp "\\([\u4E00-\u9FA5]\\)\n\\([\u4E00-\u9FA5]\\)")
         (start (string-match regexp string)))
    (while start
      (setq string (replace-match "\\1\\2" nil nil string)
            start (string-match regexp string start))))
  string)
(defun ox-html-clear-single-linebreak-for-cjk (string backend info)
  (when (org-export-derived-backend-p backend 'html)
    (clear-single-linebreak-in-cjk-string string)))
(add-to-list 'org-export-filter-final-output-functions
             'ox-html-clear-single-linebreak-for-cjk)

(setq org-html-head "<link href=\"css/org-manual.css\" rel=\"stylesheet\" type=\"text/css\">")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; setting export the org-file to pdf,copied from others
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 使用xelatex一步生成PDF，不是org-latex-to-pdf-process这个命令
(setq org-latex-pdf-process
      '(
	"xelatex -interaction nonstopmode -output-directory %o %f"
	"xelatex -interaction nonstopmode -output-directory %o %f"
	"xelatex -interaction nonstopmode -output-directory %o %f"
	"rm -fr %b.out %b.log %b.tex auto"
	))
   
;;; 暂时注释掉
;;; 增加这个class
;; (add-to-list 'org-latex-classes '("ctexart" "\\documentclass[11pt]{ctexart}
;; [NO-DEFAULT-PACKAGES]
;; \\usepackage[utf8]{inputenc}
;; \\usepackage[T1]{fontenc}
;; \\usepackage{fixltx2e}
;; \\usepackage{graphicx}
;; \\usepackage{longtable}
;; \\usepackage{float}
;; \\usepackage{wrapfig}
;; \\usepackage{rotating}
;; \\usepackage[normalem]{ulem}
;; \\usepackage{amsmath}
;; \\usepackage{textcomp}
;; \\usepackage{marvosym}
;; \\usepackage{wasysym}
;; \\usepackage{amssymb}
;; \\usepackage{booktabs}
;; \\usepackage[colorlinks,linkcolor=blue,anchorcolor=black,citecolor=black]{hyperref}
;; \\tolerance=1000
;; "
;;   ("\\chapter{%s}" . "\\chapter*{%s}")
;; 				  ("\\section{%s}" . "\\section*{%s}")
;; 				  ("\\subsection{%s}" . "\\subsection*{%s}")
;; 				  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;; 				  ("\\paragraph{%s}" . "\\paragraph*{%s}")
;; 				  ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-latex-classes '("ctexart" "\\documentclass[11pt]{ctexart}
[NO-DEFAULT-PACKAGES]
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{fixltx2e}
\\usepackage{graphicx}
\\usepackage{longtable}
\\usepackage{float}
\\usepackage{wrapfig}
\\usepackage{rotating}
\\usepackage[normalem]{ulem}
\\usepackage{amsmath}
\\usepackage{textcomp}
\\usepackage{marvosym}
\\usepackage{wasysym}
\\usepackage{amssymb}
\\usepackage{booktabs}
\\usepackage[colorlinks,linkcolor=blue,anchorcolor=black,citecolor=black]{hyperref}
\\tolerance=1000
"
				  ("\\section{%s}" . "\\section*{%s}")
				  ("\\subsection{%s}" . "\\subsection*{%s}")
				  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
				  ("\\paragraph{%s}" . "\\paragraph*{%s}")
				  ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; just for my big-thesis
(add-to-list 'org-latex-classes '("peng-big-thesis" "\\documentclass[11pt]{ctexart}
[NO-DEFAULT-PACKAGES]
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{fixltx2e}
\\usepackage{graphicx}
\\usepackage{longtable}
\\usepackage{float}
\\usepackage{wrapfig}
\\usepackage{rotating}
\\usepackage[normalem]{ulem}
\\usepackage{amsmath}
\\usepackage{textcomp}
\\usepackage{marvosym}
\\usepackage{wasysym}
\\usepackage{amssymb}
\\usepackage{booktabs}
\\usepackage[colorlinks,linkcolor=blue,anchorcolor=black,citecolor=black]{hyperref}
\\tolerance=1000
"
  ("\\chapter{%s}" . "\\chapter*{%s}")
				  ("\\section{%s}" . "\\section*{%s}")
				  ("\\subsection{%s}" . "\\subsection*{%s}")
				  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
				  ("\\paragraph{%s}" . "\\paragraph*{%s}")
				  ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;;; 设置默认的class为ctexart
(setq org-latex-default-class "ctexart")

(provide 'init-org-export)

;;; 保存一下的设置，以后可能会用到。
;; \\usepackage[a4paper,left=2cm,right=2cm,top=2cm,bottom=3cm]{geometry}

;; (add-to-list 'org-latex-classes '("ctexart" "\\documentclass[11pt]{ctexart}
;; [NO-DEFAULT-PACKAGES]
;; \\usepackage[utf8]{inputenc}
;; \\usepackage[T1]{fontenc}
;; \\usepackage{fixltx2e}
;; \\usepackage{graphicx}
;; \\usepackage{longtable}
;; \\usepackage{float}
;; \\usepackage{wrapfig}
;; \\usepackage{rotating}
;; \\usepackage[normalem]{ulem}
;; \\usepackage{amsmath}
;; \\usepackage{textcomp}
;; \\usepackage{marvosym}
;; \\usepackage{wasysym}
;; \\usepackage{amssymb}
;; \\usepackage{booktabs}
;; \\usepackage[colorlinks,linkcolor=blue,anchorcolor=black,citecolor=black]{hyperref}
;; \\tolerance=1000
;; "
;;   ("\\chapter{%s}" . "\\chapter*{%s}")
;; 				  ("\\section{%s}" . "\\section*{%s}")
;; 				  ("\\subsection{%s}" . "\\subsection*{%s}")
;; 				  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;; 				  ("\\paragraph{%s}" . "\\paragraph*{%s}")
;; 				  ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
;; ;;; 设置默认的class为ctexart
;; (setq org-latex-default-class "ctexart")
