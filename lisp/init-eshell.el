;;; eshell mode
(require 'shell-switcher)

(setq shell-switcher-mode t)

(defun peng-eshell-mode-hook ()
  (linum-mode 1)
  (peng-local-set-key (kbd "C-r") 'helm-eshell-history)
  (setq eshell-history-size 10000)	;记录很多命令，方便直接调用
  ;; (setq eshell-last-dir-ring-size 100)	;记录100个目录，感觉没太大用
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


;; ********************************copy from others********************************
;; 可以比较智能，但是我暂时没使用
(defun user-tab ()
  (interactive)
  (let ((input (eshell-get-old-input)))
    (if (string-equal input "")
        (insert-string "cd ")
      (progn
        (cond
         ((string-equal input "cd  ")
          (delete-backward-char 1)
          (insert-string "-0"))
         ((string-match "^cd\\ -[0-9]+$" input)
          (let ((len (length input)))
            (delete-backward-char (- len 4))
            (insert-string (1+ (read(substring input 4 len))))))
         (t
          (pcomplete))
         )))))

;; * ret
(defun user-ret ()
  (interactive)
  (let ((input (eshell-get-old-input)))
    (if (string-equal input "")
        (progn
          (insert-string "ls")
          (eshell-send-input))
      (progn
        (cond
         ((string-match "^cd\\ \\.\\{2,\\}$" input)
          (let ((len (- (length input) 5))
                (dots (lambda (n d)(if (<= n 0) nil (concat (funcall dots (1- n) d) d)))))
            (eshell-bol)(kill-line)
            (insert-string (concat "cd .." (funcall dots len "/..")))
            (eshell-send-input)))
         ((string-match "^\\.\\{2,\\}$" input)
          (let ((len (- (length input) 2))(p ".."))
            (while (> len 0)
              (setq len (1- len))(setq p (concat p "/..")))
            (eshell-bol)(kill-line)
            (insert-string p)
            (eshell-send-input)))
         (t
          (eshell-send-input))))
      )))

;; * spc
(defun user-spc ()
  (interactive)
  (let ((input (eshell-get-old-input)))
    (if (string-equal input "")
        (insert-string "!-1")
      (progn
        (cond
         ((string-match "^!-[0-9]+$" input)
          (let ((len (length input)))
            (delete-backward-char (- len 2))
            (insert-string (1+ (read(substring input 2 len))))))
         (t
          (self-insert-command 1))
         )))))

;; * del
;; (defun user-del ()
;;   (interactive)
;;   (let ((input (eshell-get-old-input)))
;;     (if (string-equal input "")
;;         (progn
;;           (insert-string "..")
;;           (eshell-send-input))
;;         (delete-backward-char 1)
;;         )))

;; ********************************copy from others********************************

(provide 'init-eshell)
