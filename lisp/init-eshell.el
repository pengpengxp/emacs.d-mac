;;; eshell mode
(defun peng-eshell-mode-hook ()
  (linum-mode 1)
  )
(add-hook 'eshell-mode-hook 'peng-eshell-mode-hook)

;;; ielm-mode hook
(defun peng-ielm-mode-hook ()
  (auto-complete-mode 1))
(add-hook 'ielm-mode-hook 'peng-eshell-mode-hook)

(defun eshell/clear ()
  "Clears the shell buffer ala Unix's clear or DOS' cls"
  ;; the shell prompts are read-only, so clear that for the duration
  (let ((inhibit-read-only t))
    ;; simply delete the region
    (delete-region (point-min) (point-max))))

(defun eshell/ei (arg)
  "use ei as find-file"
  (find-file arg))

(require 'helm)
(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map
                [remap eshell-pcomplete]
                'helm-esh-pcomplete)))

(provide 'init-eshell)
