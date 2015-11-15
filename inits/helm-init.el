;;emacs init file of helm and  packages rerated with helm
;;
;;helm
(when (require 'helm nil t)
  (helm-mode 0 )
  (when (require 'bind-key nil t)
    (bind-key "C-h" nil helm-map)
    )
  (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
  )
;;
;;helm-swoop
(when (require 'helm-swoop nil t)
  ;; Change the keybinds 
  (global-set-key (kbd "M-i") 'helm-swoop)
  (global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
  (global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
  (global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)
  ;; When doing isearch, hand the word over to helm-swoop
  (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
  ;; From helm-swoop to helm-multi-swoop-all
  (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)
  ;; Instead of helm-multi-swoop-all, you can also use helm-multi-swoop-current-mode
  (define-key helm-swoop-map (kbd "M-m") 'helm-multi-swoop-current-mode-from-helm-swoop)
  ;; Move up and down like isearch
  (define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
  (define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
  (define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
  (define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)
  ;; Save buffer when helm-multi-swoop-edit complete
  (setq helm-multi-swoop-edit-save nil)
  ;; If this value is t, split window inside the current window
  (setq helm-swoop-split-with-multiple-windows nil)
  ;; Split direcion. 'split-window-vertically or 'split-window-horizontally
  (setq helm-swoop-split-direction 'split-window-vertically)
  ;; If nil, you can slightly boost invoke speed in exchange for text color
  (setq helm-swoop-speed-or-color nil)
  ;; ;; Go to the opposite side of line from the end or beginning of line
  (setq helm-swoop-move-to-line-cycle t)
  )
;;
;;
(when (require 'helm-gtags nil t)
  (add-hook 'java-mode-hook 'helm-gtags-mode)
  (add-hook 'c++-mode-hook 'helm-gtags-mode)
  (add-hook 'c-mode-hook 'helm-gtags-mode)
  ;; key bindings
  (add-hook 'helm-gtags-mode-hook
	    '(lambda ()
	       (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
	       (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
	       (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
	       (local-set-key (kbd "C-t") 'helm-gtags-pop-eldoc))))
;;
;;helm-ag
;; (when (and (require 'helm-ag)
;; 	   (require 'helm-files))
;;   (global-set-key (kbd "M-g .") 'helm-ag)
;;   (global-set-key (kbd "M-g ,") 'helm-ag-pop-stack)
;;   (global-set-key (kbd "C-M-s") 'helm-ag-this-file))
;;

(provide 'helm-init)
