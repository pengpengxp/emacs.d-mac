;;****************************************************************pengpengxp's emacs-lisp mode
(defun pengpengxp-emacs-lisp-mode ()
  (linum-mode 1)
  (hl-line-mode 1)
  (smartparens-mode -1)
  (paredit-mode 1)
  (autopair-on)
  )
(add-hook 'emacs-lisp-mode-hook 'pengpengxp-emacs-lisp-mode)

(provide 'init-emacs-lisp)
