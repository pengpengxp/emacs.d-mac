;;; init-test.el --- 
;;;This is where I make some test

(defun peng-test ()
  (interactive)
  (let ((files
         (if (eq major-mode 'dired-mode)
             (dired-get-marked-files)
           (let ((default-directory (read-directory-name "dir: ")))
             (mapcar #'expand-file-name 
                     (file-expand-wildcards "*.org"))))))
    ;; (message "%s" files)
    (mapc
     (lambda (f)
       (with-current-buffer
           (find-file-noselect f)
         (org-latex-export-to-pdf)))
     files)
    ))

(provide 'init-test)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (defun peng-test (key)
;;   (interactive)
;;   (insert key))

;; (define-prefix-command 'peng-test-map)
;; (define-key global-map (kbd ",") 'peng-test-map)
;; (define-key global-map (kbd ",xf") 'find-file)
;; (define-key global-map (kbd ",xb") 'switch-to-buffer)


;; (define-key global-map (kbd ",xr") '(lambda ()
;; 				      (interactive)
;; 				      (peng-test ",xr")))

;; (define-key global-map (kbd "<f12>") '(lambda ()
;; 					(interactive)
;; 					(message "xipeng")))


;; (defmacro peng-kk ()
;;   ""
;;   (interactive)
;;   `(define-key global-map (kbd "<f12>") '(lambda ()
;; 					(interactive)
;; 					(message "xiepeng ni ha wos dfsdfso"))))

;; (macroexpand '(peng-kk))

;; (define-key global-map (kbd "<f12>") (quote (lambda nil (interactive) (message "xiepeng ni h stwetrao"))))

