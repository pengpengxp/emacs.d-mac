;; use yasnippet
(add-to-list 'load-path (concat SITE-LISP "yasnippet-master"))
(require 'yasnippet)
(yas-global-mode 1)
(setq ac-source-yasnippet nil)		;hope to use yasnippet with auto-complete

(provide 'init-yasnippet)
