
(defun peng-python-mode ()
  (define-key evil-normal-state-local-map (kbd "SPC v") 'peng-run-current-script)
  (autopair-on)
  (smart-tab-mode-off)
  (peng-local-set-key (kbd "C-c C-v") 'peng-run-current-script)
  )
(add-hook 'python-mode-hook 'peng-python-mode)


(provide 'init-python)
