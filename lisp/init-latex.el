;;;pengpengxp's latex-mode
(defun pengpengxp-latex-mode ()
  (local-set-key (kbd "M-q") 'fill-paragraph)
  (hl-line-mode 1)
  (reftex-mode))
(add-hook 'LaTeX-mode-hook 'pengpengxp-latex-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)

(provide 'init-latex)
