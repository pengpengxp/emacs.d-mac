(require 'helm-etags+)

(setq tags-table-list
      '("~/.emacs.d/TAGS" "/Users/pengpengxp/.data/emacs-24.4/src"))

;; (setq tags-file-name nil)

(peng-global-set-key (kbd "C-c M-.") 'peng-helm-etags-select)
(provide 'init-tags)
