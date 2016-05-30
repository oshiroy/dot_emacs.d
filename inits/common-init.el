;;
;;emacs common setting
;;

;; backup files go into .~ directory now
(add-to-list 'backup-directory-alist (cons "." ".~"))
;; goto-line
(global-set-key "\C-xj" 'goto-line)
;;back space
(global-set-key "\C-h" 'delete-backward-char)
;;iswitchbモードON
(iswitchb-mode 1)

;;C-f, C-b, C-n, C-p で候補を切り替えることができるように。
(add-hook 'iswitchb-define-mode-map-hook
	  (lambda ()
	    (define-key iswitchb-mode-map "\C-n" 'iswitchb-next-match)
	    (define-key iswitchb-mode-map "\C-p" 'iswitchb-prev-match)
	    (define-key iswitchb-mode-map "\C-f" 'iswitchb-next-match)
	    (define-key iswitchb-mode-map "\C-b" 'iswitchb-prev-match)))

;;recentf
(recentf-mode 1)
(setq recentf-max-menu-items 20)
(setq recentf-max-saved-items 200)

;; eofにnewlineの行追加を禁止
(setq next-line-add-newlines nil)

;; 1行scrool
(setq scroll-conservatively 35
  scroll-margin 0
  scroll-step 1)

;; tab->space
(setq-default indent-tabs-mode nil)

(provide 'common-init)
