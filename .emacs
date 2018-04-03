;;; Erix .emacs April 2018 baby joyous

(require 'package)

;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "<path where use-package is installed>")
  (require 'use-package))

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(add-to-list 'package-archives
             '("MELPA Stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

(require 'evil)
(evil-mode 1)

;; default font size
(add-to-list 'default-frame-alist '(font . "Droid Sans Mono-20" ))
(set-face-attribute 'default t :font "Droid Sans Mono-20" )

(require 'key-chord)
;;Exit insert mode by pressing j and then j quickly
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-define-global "ii" 'execute-extended-command) 
(key-chord-define-global "bb" 'ido-switch-buffer)
(key-chord-define-global "ma" 'manual-entry)
(key-chord-define-global "uu" 'advertised-undo)
(key-chord-define-global "bm" 'buffer-menu)
(key-chord-define-global "oo" 'other-window)
(key-chord-define-global "ff" 'find-file)
(key-chord-define-global "ss" 'save-buffer)

(key-chord-mode 1)
;(scroll-bar-mode -1)  ;hide scroll-bar
;(tool-bar-mode -1)    ;hide tool-ba

;; change all prompts to y or n
(fset 'yes-or-no-p 'y-or-n-p)


(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Meta
(global-set-key "\M- " 'set-mark-command)
(global-set-key "\M-\C-h" 'backward-kill-word)
(global-set-key "\M-\C-r" 'query-replace)
(global-set-key "\M-r" 'replace-string)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-h" 'help-command)

;;Tramp
(setq tramp-default-method "ssh")

(show-paren-mode 1)

(setq debug-on-error t)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)


(setq tab-width 4)          ; and 4 char wide for TAB
(setq indent-tabs-mode nil) ; And force use of spaces

(turn-on-font-lock)       ; same as syntax on in Vim

(setq inhibit-startup-screen t) ; no startup screen

 ;;  retabify document via: C-x h ... C-alt-\
 ;; where alt is M, the meta key

;; Automatically save and restore sessions
(setq desktop-dirname             "~/.emacs.d/desktop/"
      desktop-base-file-name      "emacs.desktop"
      desktop-base-lock-name      "lock"
      desktop-path                (list desktop-dirname)
      desktop-save                t
      desktop-files-not-to-save   "^$" ;reload tramp paths
      desktop-load-locked-desktop nil
      desktop-auto-save-timeout   30)
(desktop-save-mode 1)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (light-blue))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;;;;; continuing fun customizations

(use-package shell-pop
  :bind (("C-t" . shell-pop))
  :config
  (setq shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
  (setq shell-pop-term-shell "/bin/zsh")
  ;; need to do this manually or not picked up by `shell-pop'
  (shell-pop--set-shell-type 'shell-pop-shell-type shell-pop-shell-type))


