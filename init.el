;;init.el
;;
;;Language
(set-language-environment 'Japanese)

;;Coding system
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)

(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(add-to-list 'load-path (format "%s/.emacs.d" (getenv "HOME")))
(require 'cl)
;;
;;Packages Initialize
(package-initialize)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;
;;auto-inistall
(add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-install/"))
(require 'auto-install)
;;(setq auto-install-directory "~/.emacs.d/auto-install/")
;;(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)
(defvar installing-package-list
  '(
    ;;package list
    auto-complete
    auto-complete-c-headers
    ac-python
    anzu
    aurora-theme
    bind-key
    c-eldoc
    ess
    eldoc-extension
    expand-region
    fringe-helper
    gtags
    gitignore-mode
    git-gutter
    git-gutter-fringe
    helm
    helm-ag
    helm-gtags
    helm-swoop
    haskell-mode
    irony
    migemo
    redo+
    rainbow-delimiters
    shell-pop
    sr-speedbar
    undo-tree
    undohist
    anzu
    bash-completion
    flycheck
    yaml-mode
    python
    popwin
    epc
    which-key
    zlc
    ))
;;install package automatically if not installed
(let ((not-installed (loop for x in installing-package-list
			   when (not (package-installed-p x))
			   collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/inits/"))

 (require 'package-init)
 (require 'helm-init)
 (require 'c-mode-init)
 (require 'display-init)
 (require 'theme-init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(anzu-deactivate-region t)
 '(anzu-mode-lighter "")
 '(anzu-search-threshold 1000)
 '(custom-safe-themes (quote ("790e74b900c074ac8f64fa0b610ad05bcfece9be44e8f5340d2d94c1e47538de" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
