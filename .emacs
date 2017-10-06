
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(load-theme 'wombat)

(require 'package) ;; You might already have this line

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/")
             t)
            
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/")
             t)


(package-initialize)

(defun my-package-list-packages ()
  "Enable evil-mode after 'packages-list-packages'."
  (and
   (package-list-packages)
   (evil-mode)))

;; Display name of teh buffer
(setq frame-title-format "emacs: %b")

;; Disable startup screen
(setq inhibit-splash-screen   t)
(setq inhibit-startup-message t)

;; Disable GUI
(tooltip-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq use-dialog-box nil)
;; (setq redisplay-dont-pause t)
(setq ring-bell-function 'ignore)

;; Scrolling
(setq scroll-step               1)
(setq scroll-margin            10)
(setq scroll-conservatively 10000)

(setq powerline-default-separator 'slant)

;;(add-to-list 'load-path "~/.emacs.d/evil")
(setq
 evil-search-module 'evil-search
 evil-want-C-u-scroll t
 evil-want-C-w-in-emacs-state t)

(require 'evil)
(evil-mode t)

(require 'simpleclip)
(simpleclip-mode 1)

(require 'helm-config)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x C-b") #'helm-mini)
(helm-mode 1)

;; Writeroom
(setq writeroom-fullscreen-effect 'maximized)
(global-set-key (kbd "C-x C-n") #'writeroom-mode)
(global-set-key (kbd "C-x C-m") #'visual-line-mode)

;; Auto-complete
;;(ac-config-default)
(defun ac-init()
    (require 'auto-complete-config)
    (ac-config-default)
    (setq ac-auto-start 1)
    (setq ac-auto-show-menu t)
    (setq ac-delay 0.2)
    (setq ac-show-menu-immediately-on-auto-complete t)
    (global-auto-complete-mode t)
    (add-to-list 'ac-modes 'lisp-mode)
    (add-to-list 'ac-sources 'ac-source-variables)
    (add-to-list 'ac-sources 'ac-source-functions)
    (add-to-list 'ac-sources 'ac-source-dictionary))
(ac-init)

;; Line numbers
(require 'linum)
(line-number-mode t)
(global-nlinum-mode t)
(column-number-mode t)
(setq linum-format " %d")

;; Powerline
(require 'powerline)
(powerline-default-theme)

;; Indent settings
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default standart-indent 4)
(setq-default lisp-body-indent 4)
(global-set-key (kbd "RET") 'newline-and-indent)

;; Clipboard settings
(setq x-select-enable-clipboard t)

;; EOF newlines
(setq require-final-newline t)
(setq next-line-add-newlines nil)

;; Display file size in mode-line
(setq display-time-24hr-format t)
(display-time-mode             t)
(size-indication-mode          t)

;; jabber
(setq jabber-history-enabled t)
(setq jabber-account-list '(
                           ("yuimaestro@jabbim.ru"
                           (:password . "nirvana123"))))
(jabber-connect-all)


;; Neotree
(require 'neotree)
;;(global-set-key [f8] 'neotree-toggle)
(global-set-key (kbd "C-x C-t") #'neotree-toggle)

;; Jedi
(require 'epc)
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(latex-preview-pane-enable)

;; rainbow braces
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; highlight braces
(show-paren-mode 1)
(setq show-paren-delay 0)

;; stuff for commenting
(evil-commentary-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#eaeaea" "#d54e53" "#b9ca4a" "#e7c547" "#7aa6da" "#c397d8" "#70c0b1" "#424242"))
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(fci-rule-color "#424242")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(package-selected-packages
   (quote
    (hamburger-menu yoshi-theme tao-theme evil-commentary rainbow-delimiters pdf-tools latex-preview-pane ample-theme jedi neotree jabber powerline-evil powerline color-theme-sanityinc-tomorrow writeroom-mode simpleclip helm smex evil auto-complete dired+)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#d54e53")
     (40 . "#e78c45")
     (60 . "#e7c547")
     (80 . "#b9ca4a")
     (100 . "#70c0b1")
     (120 . "#7aa6da")
     (140 . "#c397d8")
     (160 . "#d54e53")
     (180 . "#e78c45")
     (200 . "#e7c547")
     (220 . "#b9ca4a")
     (240 . "#70c0b1")
     (260 . "#7aa6da")
     (280 . "#c397d8")
     (300 . "#d54e53")
     (320 . "#e78c45")
     (340 . "#e7c547")
     (360 . "#b9ca4a"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
