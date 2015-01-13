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
