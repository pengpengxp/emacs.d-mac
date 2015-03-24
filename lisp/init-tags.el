(require 'helm-etags+)

;; (setq tags-table-list
;;       '("~/.emacs.d/TAGS" "/usr/share/emacs/24.3/TAGS"))
;; (setq tags-file-name nil)

(peng-global-set-key (kbd "C-c M-.") 'peng-helm-etags-select)
(provide 'init-tags)
