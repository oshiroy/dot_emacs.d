;;
;;emacs setting of display
;;

;;menu bar
(when (not window-system) (menu-bar-mode -1))
;;tool bar
(when window-system (tool-bar-mode -1))
;;scroll bar
(when window-system (set-scroll-bar-mode nil))
;; キーワードのカラー表示を有効化
(global-font-lock-mode t)
;; 行番号・桁番号をモードラインに表示する
(line-number-mode t) 
(column-number-mode t) 
;;行数表示
(global-linum-mode t)
;; 対応する括弧を強調
(show-paren-mode 1)
(setq show-paren-style 'mixed) ; `parenthesis' or `expression' or `mixed'
;; 括弧の範囲色
;; (set-face-background 'show-paren-match-face "#b14770")
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

(provide 'display-init)
