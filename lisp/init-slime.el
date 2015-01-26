(require 'slime-autoloads)

;; Set your lisp system and, optionally, some contribs
(setq inferior-lisp-program "/usr/bin/sbcl")

(setq slime-contribs '(slime-fancy))

(add-hook 'slime-mode-hook '(lambda ()
			     (interactive)
			     (autopair-on)
			     (paredit-mode 1)))

(provide 'init-slime)

0
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
01234567891011121314


345678



03
13
23
33
43
53
63
73
83
