;; (add-to-list 'load-path "/path/to/git-modes")
;; (
;;  add-to-list 'load-path "/path/to/magit")
(eval-after-load 'info
  '(progn (info-initialize)
          (add-to-list 'Info-directory-list (concat SITE-LISP "/magit/"))))
(require 'magit)

(add-hook 'magit-mode-hook '(lambda ()
			      (interactive)
			      (delete-other-windows)))

(provide 'init-magit)
