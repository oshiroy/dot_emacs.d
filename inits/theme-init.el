;; 起動時のウィンドウサイズ、色などを設定
(if (boundp 'window-system)
    (setq default-frame-alist
	  (append (list
		   '(foreground-color . "white")  ; 文字色
		   ;;      		   '(background-color . "DarkSlateGray")  ; 背景色 #400027とか;
		   '(border-color     . "gray10")  ; ボーダー色
		   '(mouse-color      . "white")  ; マウスカーソルの色
		   '(cursor-color     . "white")  ; カーソルの色
		   '(cursor-type      . box)      ; カーソルの形状
		   (set-frame-parameter (selected-frame) 'alpha'(1.0)); フレームの透明度
		   '(top . 60) ; ウィンドウの表示位置（Y座標）
		   '(left . 140) ; ウィンドウの表示位置（X座標）
		   '(width . 80) ; ウィンドウの幅（文字数）
		   '(height . 30) ; ウィンドウの高さ（文字数）
		   )
		  default-frame-alist)))
(setq initial-frame-alist default-frame-alist )
(add-hook 'font-lock-mode-hook
  '(lambda () 
    ;(set-face-foreground 'font-lock-comment-face "chocolate1")
    (set-face-foreground 'font-lock-comment-face "#f69933")  ; 微調整
    (set-face-foreground 'font-lock-string-face "MedSeaGreen")
    ;(set-face-foreground 'font-lock-keyword-face "Cyan1")
    (set-face-foreground 'font-lock-keyword-face "#66e6e6")  ; 微調整
    (set-face-bold-p 'font-lock-keyword-face t)
    (set-face-foreground 'font-lock-builtin-face "LightSteelBlue")
    ;; (set-face-foreground 'font-lock-builtin-face "")
    (set-face-bold-p 'font-lock-builtin-face t)
    (set-face-foreground 'font-lock-function-name-face "SkyBlue3")
    (set-face-bold-p 'font-lock-function-name-face t)
    (set-face-foreground 'font-lock-variable-name-face "LightGoldenrod")
    ;;(set-face-foreground 'font-lock-type-face "Pink")
    (set-face-foreground 'font-lock-type-face "IndianRed")
    (set-face-bold-p 'font-lock-type-face t)
    (set-face-foreground 'font-lock-constant-face "Aquamarine")
    (set-face-foreground 'font-lock-warning-face "Pink")
    (set-face-foreground 'linum "blue")
    (set-face-foreground 'minibuffer-prompt "brightcyan")
    (set-face-foreground 'comint-highlight-prompt "green")
  )
)
;;region color
(set-face-background 'region "SkyBlue")
(set-face-foreground 'region "black")

;; Ricty font
(set-face-attribute 'default nil
		    :family "Ricty"
		    :height 120)

(provide 'theme-init)
