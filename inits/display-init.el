;;emacs setting of display

;;menu bar
(when window-system (menu-bar-mode nil))
;;tool bar
(when window-system (tool-bar-mode nil))
;;scroll bar
(when window-system (set-scroll-bar-mode nil))
;; キーワードのカラー表示を有効化
(global-font-lock-mode t)
;; 行番号・桁番号をモードラインに表示する
(line-number-mode t) 
(column-number-mode nil) 
;;行数表示
(global-linum-mode t)
;; 対応する括弧を強調
(show-paren-mode 1)
(setq show-paren-style 'mixed) ; `parenthesis' or `expression' or `mixed'
;; 括弧の範囲色
(set-face-background 'show-paren-match-face "#b14770")
(setq show-paren-delay 0)
;; backup files go into .~ directory now
(add-to-list 'backup-directory-alist (cons "." ".~"))
;; 行末の空白を強調表示
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "yellow")
;; 予約語を色分けする
(global-font-lock-mode t)
;; goto-line
(global-set-key "\C-xj" 'goto-line)
;;back space
(global-set-key "\C-h" 'delete-backward-char)

;;display time
(setq display-time-string-forms
      '(24-hours ":" minutes))
(display-time)
(iswitchb-mode 1) ;;iswitchbモードON
;;C-f, C-b, C-n, C-p で候補を切り替えることができるように。
(add-hook 'iswitchb-define-mode-map-hook
	  (lambda ()
	    (define-key iswitchb-mode-map "\C-n" 'iswitchb-next-match)
	    (define-key iswitchb-mode-map "\C-p" 'iswitchb-prev-match)
	    (define-key iswitchb-mode-map "\C-f" 'iswitchb-next-match)
	    (define-key iswitchb-mode-map "\C-b" 'iswitchb-prev-match)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(anzu-deactivate-region t)
 '(anzu-mode-lighter "")
 '(anzu-search-threshold 1000)
 '(custom-safe-themes (quote ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default))))

(provide 'display-init)
