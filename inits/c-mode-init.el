;;
;;emacs init file of c-mode and c++-mode
;;

;;auto-complete-c-headers
(when (require 'auto-complete-c-headers nil t)
  (add-hook 'c++-mode-hook (lambda ()
			     (add-to-list 'ac-sources 'ac-source-c-headers)))
  (add-hook 'c-mode-hook (lambda ()
			   (add-to-list 'ac-sources 'ac-source-c-headers))))

;;c-eldoc
;; (when (require 'c-eldoc nil t)
;;   (add-hook 'c-mode-hook (lambda ()
;; 			   (set (make-local-variable 'eldoc-idle-delay) 0.5)
;; 			   (c-turn-on-eldoc-mode)
;; 			   ))
;;   (add-hook 'c++-mode-hook (lambda ()
;; 			     (set (make-local-variable 'eldoc-idle-delay) 0.5)
;; 			     (c-turn-on-eldoc-mode)
;; 			     ))
;;   (setq c-eldoc-buffer-regenerate-time 150)
;;   )

(provide 'c-mode-init)
