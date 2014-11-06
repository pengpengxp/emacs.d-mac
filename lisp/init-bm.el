;;bm
(add-to-list 'load-path (concat SITE-LISP "bm"))
(require 'bm)
(require 'evil)
(global-set-key (kbd "<left-margin> <mouse-5>") 'bm-next-mouse)
(global-set-key (kbd "<left-margin> <mouse-4>") 'bm-previous-mouse)
(global-set-key (kbd "<left-margin> <mouse-1>") 'bm-toggle-mouse)
(global-set-key (kbd "<left-fringe> <mouse-5>") 'bm-next-mouse)
(global-set-key (kbd "<left-fringe> <mouse-4>") 'bm-previous-mouse)
(global-set-key (kbd "<left-fringe> <mouse-1>") 'bm-toggle-mouse)

;;evil for bm
(define-key evil-normal-state-map (kbd "N") 'bm-next)
(define-key evil-normal-state-map (kbd "P") 'bm-previous)

(provide 'init-bm)
