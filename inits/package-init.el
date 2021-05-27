;;
;; Company
(when (require 'company nil t)
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-transformers '(company-sort-by-backend-importance)) ;; ソート順
  (setq company-idle-delay 0) ; デフォルトは0.5
  (setq company-minimum-prefix-length 3) ; デフォルトは4
  (setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る
  (setq completion-ignore-case t)
  (setq company-dabbrev-downcase nil)
  (define-key company-active-map (kbd "C-n") 'company-select-next) ;; C-n, C-pで補完候補を次/前の候補を選択
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-search-map (kbd "C-n") 'company-select-next)
  (define-key company-search-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "C-s") 'company-filter-candidates) ;; C-sで絞り込む
  (define-key company-active-map (kbd "C-i") 'company-complete-selection) ;; TABで候補を設定
  (global-set-key (kbd "C-M-i") 'company-complete)
  )

;; R & ESS
(when (require 'ess nil t)
  (add-to-list 'auto-mode-alist '("\\.[rR]$" . R-mode))  ;; R-mode を起動する時に ess-site をロード
  (autoload 'R-mode "ess-site" "Emacs Speaks Statistics mode" t)  ;; R を起動する時に ess-site をロード
  (autoload 'R "ess-site" "start R" t)  ;; R-mode, iESS を起動する際に呼び出す初期化関数
  (setq ess-loaded-p nil)
  (defun ess-load-hook ()
    (when (not ess-loaded-p)      ;; アンダースコアの入力が " <- " にならないようにする
      (ess-toggle-underscore nil)
      )
    )
  )
(add-hook 'R-mode-hook 'ess-load-hook)

;;irony-mode
;; (when (require 'irony nil t)
;;   (add-hook 'c++-mode-hook 'irony-mode)
;;   (add-hook 'c-mode-hook 'irony-mode)
;;   (add-hook 'objc-mode-hook 'irony-mode)
;;   (add-hook 'irony-mode-hook (lambda()
;; 			       (define-key irony-mode-map (kbd "C-ip")
;; 				 'irony-completion-at-point-async)
;; 			       (define-key irony-mode-map (kbd "C-is")
;; 				 'irony-completion-at-point-async)))
;;   (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)  
;;   )

;;stack
;; (when (and (require 'eldoc nil t) (require 'eldoc-extension nil t))
;;   (setq eldoc-idle-delay 0)
;;   (setq eldoc-echo-area-use-multiline-p t)
;;   (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
;;   (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
;;   (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode))

;;
;;python-mode setting
;; jedi
(when (and (require 'epc nil t)
	   (require 'python nil t)
	   (require 'jedi nil t)
	   (require 'ac-pyrhon nil t))
  (setq eldoc-echo-area-use-multiline-p t)
  (add-hook 'python-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'python-mode-hook 'jedi:ac-setup)
  (setq jedi:tooltip-method 'nil)
  (set-face-attribute 'jedi:highlight-function-argument nil
		      :foreground "green"))
;;
;;expand-region
(when (require 'expand-region nil t)
  (global-set-key (kbd "C-@") 'er/expand-region)
  (global-set-key (kbd "C-M-@") 'er/contract-region)
  (global-set-key (kbd "M-@") 'set-mark-command)
  )

;;
;;elscreen
(when (require 'elscreen nil t)
  ;;; プレフィクスキーはC-z
  (setq elscreen-prefix-key (kbd "C-z"))
  (elscreen-start)
  ;; タブの先頭に[X]を表示しない
  (setq elscreen-tab-display-kill-screen nil)
  ;; header-lineの先頭に[<->]を表示しない
  (setq elscreen-tab-display-control nil)
  ;; バッファ名・モード名からタブに表示させる内容を決定する(デフォルト設定)
  (setq elscreen-buffer-to-nickname-alist
	'(("^dired-mode$" .
	   (lambda ()
	     (format "Dired(%s)" dired-directory)))
	  ("^Info-mode$" .
	   (lambda ()
	     (format "Info(%s)" (file-name-nondirectory Info-current-file))))
	  ("^mew-draft-mode$" .
	   (lambda ()
	     (format "Mew(%s)" (buffer-name (current-buffer)))))
	  ("^mew-" . "Mew")
	  ("^irchat-" . "IRChat")
	  ("^liece-" . "Liece")
	  ("^lookup-" . "Lookup")))
  (setq elscreen-mode-to-nickname-alist
	'(("[Ss]hell" . "shell")
	  ("compilation" . "compile")
	  ("-telnet" . "telnet")
	  ("dict" . "OnlineDict")
	  ("*WL:Message*" . "Wanderlust")))
  )

;;migemo
(when (require 'migemo nil t)
  (setq migemo-command "cmigemo")
  (setq migemo-options '("-q" "--emacs"))
  ;; Set your installed path
  (setq migemo-dictionary "/usr//share/cmigemo/utf-8/migemo-dict")
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8)
  (load-library "migemo")
  (migemo-init))

;; ;;sr-speedbar
;; (when (require 'sr-speedbar nil t)
;;   )

;;anzu
(when (require 'anzu nil t)
  (global-anzu-mode +1)
  (custom-set-variables
   '(anzu-mode-lighter "")
   '(anzu-deactivate-region t)
   '(anzu-search-threshold 1000)))
;;
;; (when (require 'drill-instructor nil t)
;;   (setq drill-instructor-global nil)
  ;; (mapc (lambda (name)
  ;;         (fset name 'kill-emacs))
  ;;       '(drill-instructor-alert-up
  ;;         drill-instructor-alert-down
  ;;         drill-instructor-alert-right
  ;;         drill-instructor-alert-left
  ;;         drill-instructor-alert-del
  ;;         drill-instructor-alert-return
  ;;         drill-instructor-alert-tab))
;;  )

;;hilnum (not work)
;; (when (require 'hlinum nil t)
;;   (hlinum-activate)
;;   )

;;git-gutter
;; (when (require 'git-gutter nil t)
;;   (global-git-gutter-mode t)
;;   )

;;git-gutter-fringe
;; (when (and (require 'git-gutter nil t)(require 'git-gutter-fringe nil t))
;;  (global-git-gutter-mode t)
  ;; (setq git-gutter-fr:side 'right-fringe)
;;  )

;;bash-completion
(when (require 'bash-completion nil t)
  (bash-completion-setup))

;; vrml mode
(when (file-exists-p (format "%s/.emacs.d/inits/vrml-mode.el" (getenv "HOME")))
  (load "vrml-mode.el")
  (autoload 'vrml-mode "vrml" "VRML mode." t)
  (setq auto-mode-alist (append '(("\\.wrl\\'" . vrml-mode))
                                auto-mode-alist)))

;;flycheck
(when (require 'flycheck nil t)
  (add-hook 'python-mode-hook 'flycheck-mode)
  (add-hook 'c-mode-hook 'flycheck-mode)
  (add-hook 'c++-mode-hook 'flycheck-mode)
  )


;;powerline
;; (when (require 'powerline nil t)
;;   (set-face-attribute 'mode-line nil
;; 		      :foreground "#000"
;; 		      :background "#99FF33"
;; 		      :box nil)
  
;;   (set-face-attribute 'powerline-active1 nil
;; 		      :foreground "#fff"
;; 		      :background "#222222"
;; 		      :inherit 'mode-line)
  
;;   (set-face-attribute 'powerline-active2 nil
;; 		      :foreground "#fff"
;; 		      :background "#555555"
;; 		      :inherit 'mode-line)
;;   (powerline-default-theme)
;;   )

;;undo-tree
(when (require 'undo-tree nil t)
  (global-undo-tree-mode t)
  (global-set-key (kbd "M-/") 'undo-tree-redo))

;;undohist
(when (require 'undohist nil t)
  (setq undohist-directory "~/.emacs.d/undohist")
  (setq undohist-ignored-files '("/tmp"))
  (undohist-initialize))

;; redo+
(when (require 'redo+ nil t)
  (global-set-key (kbd "C-\\") 'redo))

;;rosemacs
(when (and (string= "hydro" (getenv "ROS_DISTRO"))
	   (require 'rosemacs nil t))
  (invoke-rosemacs)
  (global-set-key "\C-x\C-r" ros-keymap))
(when (and (string= "indigo" (getenv "ROS_DISTRO"))
           (not (equal system-type 'darwin)))
  (add-to-list 'load-path "/opt/ros/indigo/share/emacs/site-lisp")
  (require 'rosemacs-config))

;;rainbow-delimiters-mode
(defun rainbow-delimiters-mode-turn-on () 
  (rainbow-delimiters-mode t))
;;  (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode-turn-on))

;;smart-mode-line
;; (when  (require 'smart-mode-line nil t)
;;   (setq sml/theme 'light)
;;   (sml/setup)
;;   ) 

;;popwin
(when (require 'popwin nil t)
  (setq display-buffer-function 'popwin:display-buffer)
  (setq popwin:popup-window-position 'bottom)
  )

;;shell-pop
(when (require 'shell-pop nil t)
  (setq shell-pop-shell-type '("eshell" "*eshell*" (lambda () (eshell))))
  (global-set-key (kbd "C-c s") 'shell-pop)
  )

;;which-key
;;this package is nuisance
;; (when (require 'which-key nil t)
;;   (which-key-setup-side-window-bottom)
;;   ;; Set the time delay (in seconds) for the which-key popup to appear.
;;   (setq which-key-idle-delay 1.5)
;;   (which-key-mode t)
;;   )

(when (require 'zlc nil t)
  (zlc-mode 1)
  (let ((map minibuffer-local-map))
    (define-key map (kbd "<down>")  'zlc-select-next-vertical)
    (define-key map (kbd "<up>")    'zlc-select-previous-vertical)
    (define-key map (kbd "<right>") 'zlc-select-next)
    (define-key map (kbd "<left>")  'zlc-select-previous)
    (define-key map (kbd "M-<tab>") 'zlc-select-previous)
    (define-key map (kbd "M-TAB") 'zlc-select-previous)))

;;;; for ctags.el
;; (require 'ctags nil t)
;; (setq tags-revert-without-query t)
;; (setq ctags-command "ctags -R --fields=\"+afikKlmnsSzt\" ")
;; (global-set-key (kbd "<f5>") 'ctags-create-or-update-tags-table)
;; (global-set-key (kbd "M-.") 'ctags-search)(setq tags-revert-without-query t)


(provide 'package-init)
