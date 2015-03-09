;;; eshell mode
(require 'shell-switcher)

(setq shell-switcher-mode t)

(defun peng-eshell-mode-hook ()
  (linum-mode 1)
  )
(add-hook 'eshell-mode-hook 'peng-eshell-mode-hook)

;;; ielm-mode hook
(defun peng-ielm-mode-hook ()
  (company-mode 1))
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

(defun eshell/vi (arg)
  "use vi as find-file"
  (find-file arg))

(defun eshell/cj ()
  "jump to bookmark"
  (let ((temp (completing-read "Bookmarks: " (bookmark-all-names))))
    (bookmark-jump temp)))

(defun eshell/\,cj ()
  "jump to bookmark"
  (let ((temp (completing-read "Bookmarks: " (bookmark-all-names))))
    (bookmark-jump temp)))

;; (defun eshell/\,xb ()
;;   "switch buffer in eshell"
;;   (let ((buffer (completing-read "Buffers: " 
;; 				 (mapcar 'buffer-name (buffer-list)))))
;;     (switch-to-buffer buffer)))

(defun eshell/\,xb ()
  "switch buffer in eshell"
  (let ((buffer (buffer-name (other-buffer))))
    (switch-to-buffer buffer)))

(defun eshell/\,xf ()
  "use ei as find-file"
  (let ((file (read-file-name "FILE: ")))
    (find-file file)))

(defun eshell/\,cu ()
  "winner-undo"
  (winner-undo))

(defun eshell/\,cr ()
  "winner-redo"
  (winner-redo))

(defun eshell/\,ca ()
  "org-agenda"
  (org-agenda))

;; (require 'helm)
;; (add-hook 'eshell-mode-hook
;;           #'(lambda ()
;;               (define-key eshell-mode-map
;;                 [remap eshell-pcomplete]
;;                 'helm-esh-pcomplete)))

;;;; quik jump in eshell 
(require 'eshell-z)			
(cond ((string-equal system-type "darwin")
       (defun eshell/zo (arg)
	 "zo to open current directory"
	 (peng-async-shell-command (concat "open "
					   arg
					   "&"))))
      )

(provide 'init-eshell)
