;;; Erix .emacs April 2018 baby joyous

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(add-to-list 'package-archives
             '("MELPA Stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)


;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)


;; evil
(require 'evil)
(evil-mode 1)

;; default font size
(add-to-list 'default-frame-alist '(font . "Droid Sans Mono-16" ))
(set-face-attribute 'default t :font "Droid Sans Mono-16" )

;; key-chord
(require 'key-chord)

;; Max time delay between two key presses to be considered a key chord
(setq key-chord-two-keys-delay 0.1) ; default 0.1
    
;; Max time delay between two presses of the same key to be considered a key chord.
;; Should normally be a little longer than `key-chord-two-keys-delay'.
(setq key-chord-one-key-delay 0.2) ; default 0.2

;;Exit insert mode by pressing j and then j quickly
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-define-global "ii" 'execute-extended-command) 
(key-chord-define-global "bb" 'ido-switch-buffer)
(key-chord-define-global "ma" 'manual-entry)
(key-chord-define-global "uu" 'advertised-undo)
(key-chord-define-global "bm" 'buffer-menu)
(key-chord-define-global "oo" 'other-window)
(key-chord-define-global "ff" 'find-file)
(key-chord-define-global "ss" 'save-buffer)
(key-chord-define-global "ki" 'kill-buffer)
(key-chord-define-global "qq" 'keyboard-escape-quit)

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

;; ido
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; tabs /spaces
(setq tab-width 4)          ; and 4 char wide for TAB
(setq indent-tabs-mode nil) ; And force use of spaces

;; misc
(turn-on-font-lock)       ; same as syntax on in Vim
(setq inhibit-startup-screen t) ; no startup screen
;(setq mouse-drag-copy-region t) ; copy to clipboard on mouse select
(blink-cursor-mode 0)

;;  retabify document via: C-x h ... C-alt-\
;; where alt is M, the meta key


;;

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

;; custom vars - dont edit this by hand!
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

;; shell-pop
(use-package shell-pop
  :bind (("C-t" . shell-pop))
  :config
  (setq shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
  (setq shell-pop-term-shell "/bin/zsh")
  ;; need to do this manually or not picked up by `shell-pop'
  (shell-pop--set-shell-type 'shell-pop-shell-type shell-pop-shell-type))


