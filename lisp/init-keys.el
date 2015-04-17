;; (setq pengpengxp-comma-map (make-sparse-keymap))


;;; 等待我写一出自己的`keymap'

;; (define-prefix-command 'pengpengxp-comma-map)
;; (global-set-key (kbd ",") 'pengpengxp-comma-map)
;; (defun peng-real-insert-comma ()
;;   (interactive)
;;   (insert ","))

;; (define-key pengpengxp-comma-map (kbd ",") 'peng-real-insert-comma)
;; (define-key pengpengxp-comma-map (kbd "x") ctl-x-map)
;; (define-key pengpengxp-comma-map (kbd "x f") 'find-file)



;; (defvar special-mode-map
;;   (let ((map (make-sparse-keymap)))
;;     (suppress-keymap map)
;;     (define-key map "q" 'quit-window)
;;     map))
