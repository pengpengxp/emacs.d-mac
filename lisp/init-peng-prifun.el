;;; This is pengpengxp's private function

(defun  peng-reset-tags-table ()
  (interactive)
  (setq tags-file-name nil)
  (setq tags-table-list nil))

;;; ----------------------------------------------------------------------
;;; My own copy and paste line functon
;;; ----------------------------------------------------------------------
(defun peng-copy-one-line ()
  "copy one line in my favourite way"
  (interactive)
  (let ((start (line-beginning-position))
	(end (line-end-position)))
    (kill-ring-save start end)
    (goto-char end)))
(defun peng-yank-one-line ()
  "paste one line in my favourite way"
  (interactive)
  (yank)
  (newline))
(global-set-key (kbd "C-c w") 'peng-copy-one-line)
(global-set-key (kbd "C-c y") 'peng-yank-one-line)
;;; ----------------------------------------------------------------------


(defun peng-unshow-all-tools ()
  "hide menu and tool and scroll bar"
  (interactive)
  (when window-system 
    (menu-bar-mode -1)
    (tool-bar-mode -1)
    (scroll-bar-mode -1)
    ))
(defun peng-show-all-tools ()
  "show menu and tool and scroll bar"
  (interactive)
  (when window-system
    (menu-bar-mode t)
    (tool-bar-mode t)
    (scroll-bar-mode t)
    ))

;;; referenced from others
(defun peng-edit-current-file-as-root ()
  "edit current file as root"
  (interactive)
  (if (buffer-file-name)
      (progn
	(setq FILE (concat "/sudo:root@localhost:" (buffer-file-name)))
	(find-file FILE))
    (message "Current buffer does not have an associated file")))

;;; scroll like vim
(defun peng-line-up ()
  "Scroll the page with the cursor in the same line"
  (interactive)
  ;; move the cursor also
  (let ((tmp (current-column)))
    (scroll-down 1)
    (line-move-to-column tmp)
    (forward-line -1)
    )
  )
(defun peng-line-down ()
  "Scroll the page with the cursor in the same line"
  (interactive)
  ;; move the cursor also
  (let ((tmp (current-column)))
    (scroll-up 1)
    (line-move-to-column tmp)
    (forward-line 1)
    )
  )

;;; ----------------------------------------------------------------------
;;; to print current buffer to pdf files
;;; ----------------------------------------------------------------------
(defun peng-print-current-buffer ()
  (interactive)
  (let ((OUTPUT (concat "/tmp/"
			(buffer-name)
			".ps")))
    (save-excursion
      (save-restriction
	(widen)
	(ps-print-buffer OUTPUT)
	(cd "/tmp/")
	(shell-command (concat "ps2pdf "
			       OUTPUT))))))
;;; need to install emacs-intl-fonts in ubuntu,and then set this variable,it can print chinese now
(setq ps-multibyte-buffer 'bdf-font-except-latin)
;;; ----------------------------------------------------------------------

;;; ----------------------------------------------------------------------
;;; need to be improved
;;; ----------------------------------------------------------------------
(defun peng-list-current-file-tags ()
  "list current files tags"
  (interactive)
  (shell-command (concat "etags ./*"))
  (visit-tags-table (concat (helm-current-directory)
  			    "TAGS"))
  (list-tags (buffer-file-name))
  ;; (delete-window)
  ;; (switch-to-buffer "*Tags List*")
  ;; (delete-other-windows)
  )
(defadvice peng-list-current-file-tags (around stfu compile activate)
  (cl-flet ((yes-or-no-p (&rest args) t)
	 (y-or-n-p (&rest args) t))
    ad-do-it))
;;; ----------------------------------------------------------------------

;;; ----------------------------------------------------------------------
;;; eyerest function
;;; ----------------------------------------------------------------------
(defun peng-eyerest-reset ()
  (interactive)
  (shell-command "eyerest-cli -r"))
(defun peng-eyerest-show-rest ()
  (interactive)
  (let ((time (string-to-int (shell-command-to-string "eyerest-cli -t %s"))))
    (message "%d:%d" (/ time 60)
	     (% time 60))))
(defun peng-eyerest-pause()
  (interactive)
  (shell-command "eyerest-cli -p"))
(defun peng-eyerest-continue ()
  (interactive)
  (shell-command "eyerest-cli -c"))
(defun peng-eyerest-restart ()
  (interactive)
  (let ((iseyerest (shell-command-to-string "eyerest-cli -s|grep -i active")))
    (if (string= iseyerest "")
	(shell-command "eyerest-daemon")
      (shell-command "killall eyerest-daemon;eyerest-daemon"))))
(defun peng-eyerest-kill ()
  (interactive)
  (shell-command "killall eyerest-daemon"))
(defun peng-eye-gymnistic ()
  (interactive)
  (async-shell-command "mplayer /home/pengpengxp/music/eye_gymnastics.mp3" nil))
;;; ----------------------------------------------------------------------


(defun peng-goto-scratch ()
  (interactive)
  (switch-to-buffer "*scratch*"))
(defun peng-show-major-mode ()
  (interactive)
  (message "%s" major-mode))

;;; ----------------------------------------------------------------------
;;; global-set-key with evil
;;; ----------------------------------------------------------------------
(defun peng-global-set-key (keys function)
  "use for key-binding with evil
bind in global map and all evil map to make sure it works as I want
绑定所有map。这才是是我需要的global-set-key
usage: (peng... \"keys-you-want-to-bind\" 'function-you-want-to-bind  "
  (define-key evil-normal-state-map keys function)
  (define-key evil-emacs-state-map keys function)
  (define-key evil-insert-state-map keys function)
  (define-key evil-motion-state-map keys function)
  (define-key evil-visual-state-map keys function)
  (define-key evil-replace-state-map keys function)
  (define-key evil-operator-state-map keys function)
  (define-key global-map keys function)
  )
;;; ----------------------------------------------------------------------



;;; ----------------------------------------------------------------------
;;; I modified the from the helm-src file
;;; ----------------------------------------------------------------------
(defun peng-helm-etags-select (arg)
  "Preconfigured helm for etags.
If called with a prefix argument or if any of the tag files have
been modified, reinitialize cache.

This function aggregates three sources of tag files:

  1) An automatically located file in the parent directories, by `helm-etags-get-tag-file'.
  2) `tags-file-name', which is commonly set by `find-tag' command.
  3) `tags-table-list' which is commonly set by `visit-tags-table' command."
  (interactive "P")
  (let ((tag-files (helm-etags-all-tag-files))
        ;; (helm-execute-action-at-once-if-one helm-etags-execute-action-at-once-if-one)
        (helm-execute-action-at-once-if-one nil)
        (str (thing-at-point 'symbol))
	)
    (if (cl-notany 'file-exists-p tag-files)
        (message "Error: No tag file found. Create with etags shell command, or visit with `find-tag' or `visit-tags-table'.")
      (cl-loop for k being the hash-keys of helm-etags-cache
            unless (member k tag-files)
            do (remhash k helm-etags-cache))
      (mapc (lambda (f)
              (when (or (equal arg '(4))
                        (and helm-etags-mtime-alist
                             (helm-etags-file-modified-p f)))
                (remhash f helm-etags-cache)))
            tag-files)
      (helm :sources 'helm-source-etags-select
            :keymap helm-etags-map
            :default (list (concat "\\_<" str "\\_>") str)
            :buffer "*helm etags*"))))
;;; ----------------------------------------------------------------------

(defun peng-insert-counter-column (n)
  "insert 1 to n in n column
    Example: n = 3,insert:
    insert: 1
    insert: 2
    insert: 3
    NOTE:referenced from xahlee"
  (interactive "nEnter the column number you want to insert: ")
  (let ((colpos (- (point) (point-at-bol)))
	(i 1))
    (while (<= i n)
      (insert (number-to-string i))
      (next-line)
      (beginning-of-line)
      (forward-char colpos)
      (setq i (1+ i)))))

(provide 'init-peng-prifun)
