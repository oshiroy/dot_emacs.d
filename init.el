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

;; osx meta key
(when (equal system-type 'darwin)
  (setq ns-option-modifier (quote meta))
  (setq ns-alternate-modifier (quote super)))


;;solarized theme
(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/repos/emacs-color-theme-solarized"))
(when (not (equal system-type 'darwin))
  (setq solarized-termcolors 256)
  )
(customize-set-variable 'frame-background-mode 'dark)
(set-frame-parameter nil 'background-mode 'dark)
(set-terminal-parameter nil 'background-mode 'dark)
(load-theme 'solarized t)
(enable-theme 'solarized)

(linum-mode t)

(add-to-list 'load-path (format "%s/.emacs.d/elpa" (getenv "HOME")))

(require 'cl)
;;
;;Packages Initialize
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)


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
    auto-complete-c-headers
    ac-python
    anzu
    bind-key
    c-eldoc
    cuda-mode
    ;;ctags
    company
    expand-region
    fringe-helper
    gtags
    gitignore-mode
    ;; git-gutter
    ;; git-gutter-fringe
    helm
    helm-ag
    helm-gtags
    helm-swoop
    haskell-mode
    ;; irony
    migemo
    markdown-mode
    rainbow-delimiters
    shell-pop
    sudden-death
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
    smooth-scroll
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


(require 'common-init)
(require 'package-init)
(require 'helm-init)
(require 'c-mode-init)
(require 'display-init)
;; (require 'theme-init)
;; (require 'org-mode-init)
;; (require 'markdown-mode-init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(anzu-deactivate-region t)
 '(anzu-mode-lighter "")
 '(anzu-search-threshold 1000)
 '(frame-background-mode 'dark)
 '(package-selected-packages
   '(go-mode dashboard ## ace-window zlc yaml-mode which-key undohist undo-tree sudden-death sr-speedbar smooth-scroll shell-pop rainbow-delimiters popwin migemo markdown-mode irony helm-swoop helm-gtags helm-ag haskell-mode gtags gitignore-mode git-gutter-fringe flycheck expand-region epc cuda-mode c-eldoc bind-key bash-completion auto-complete-c-headers anzu ac-python)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
