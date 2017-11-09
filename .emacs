
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(load-theme 'xresources-theme)

(require 'package) ;; You might already have this line

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/")
             t)
            
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/")
             t)


(package-initialize)

;(load-theme 'arjen-grey t)
;(load-theme 'sanityinc-tomorrow-night t)
(load-theme 'doom-tomorrow-night t)

(add-to-list 'default-frame-alist '(font . "Source Code Pro 11"))
(set-face-attribute 'default t :font "Source Code Pro 11")

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

;; Doom-neotree
(doom-themes-neotree-config)
(setq doom-neotree-enable-file-icons t)
(setq doom-neotree-enable-folder-icons t)
(setq doom-neotree-enable-chevron-icons t)
(setq doom-neotree-file-icons 'simple)
(setq doom-neotree-enable-type-colors t)

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
;;(global-set-key (kbd "C-x C-n") #'writeroom-mode)
;;(global-set-key (kbd "C-x C-m") #'visual-line-mode)

;; diminish
(use-package diminish
             :init
             :config
             (diminish 'helm-mode)
             (diminish 'auto-complete-mode)
             (diminish 'global-auto-complete-mode)
             (diminish 'undo-tree-mode)
             (diminish 'abbrev-mode)
             (diminish 'ac-mode-map))

;; Completely hide visual-line-mode and change auto-fill-mode to " AF".
(use-package emacs
  :delight
  (auto-fill-function " AF")
  (visual-line-mode))

;;Auto-complete
(defun ac-init()
    (require 'auto-complete-config)
    (ac-config-default)
    (setq ac-auto-start 1)
    (setq ac-auto-show-menu t)
    (setq ac-delay 0)
    (setq ac-show-menu-immediately-on-auto-complete t)
    (global-auto-complete-mode t)
    (add-to-list 'ac-modes 'lisp-mode)
    (add-to-list 'ac-sources 'ac-source-variables)
    (add-to-list 'ac-sources 'ac-source-functions)
    (add-to-list 'ac-sources 'ac-source-dictionary)
    (add-to-list 'ac-modes 'web-mode)
   ;(add-to-list 'ac-sources 'ac-source-filename))
    (add-hook 'go-mode-hook 'auto-complete-for-go))
(ac-init)

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

;(when window-system (set-exec-path-from-shell-PATH))
(set-exec-path-from-shell-PATH)


(setenv "GOPATH" "/home/yuimaestro/.local/go")

(require 'go-mode)
(require 'go-autocomplete)
(defun auto-complete-for-go ()
    (auto-complete-mode 1))
;(add-hook 'go-mode-hook 'auto-complete-for-go)

(defun my-go-mode-hook ()
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (global-set-key (kbd "M-.") 'godef-jump)
  (if (not (string-match "go" compile-command))
    (set (make-local-variable 'compile-command)
                        "go build -v && go run -v")))
(my-go-mode-hook)

(add-hook 'go-mode-hook 'my-go-mode-hook)


;; Line numbers
(require 'linum)
(line-number-mode t)
(global-nlinum-mode t)
(column-number-mode t)
(setq linum-format " %d")

;; Disable autosaving
(setq make-backup-files nil)
(setq auto-save-default nil)

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
;;(setq display-time-24hr-format t)
;;(display-time-mode               t)
(size-indication-mode          t)

;; Neotree
(require 'neotree)
;;(global-set-key [f8] 'neotree-toggle)
(global-set-key (kbd "C-x C-t") #'neotree-toggle)

;; Jedi
(require 'epc)
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;;(latex-preview-pane-enable)

;; rainbow braces
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; highlight braces
(show-paren-mode 1)
(setq show-paren-delay 0)

;; stuff for commenting
(evil-commentary-mode)

;; git
(global-set-key (kbd "C-x g") 'magit-status)
(require 'evil-magit)

;; Yasnippet
;;(require 'yasnippet)
;;(yas/global-mode 1)

;; Neotree evil-mode keybindings
(add-hook 'neotree-mode-hook
    (lambda ()
    (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
    (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-quick-look)
    (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
    (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (local-set-key (kbd "RET") 'newline-and-indent)
  (setq web-mode-extra-snippets '(("erb" . (("name" . ("beg" . "end"))))
                                ))
  (setq web-mode-extra-auto-pairs '(("erb" . (("open" "close")))
                                  ))
  (setq web-mode-enable-current-element-highlight t)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0d0d0d" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#c9b4cf" "#8abeb7" "#ffffff"])
 '(custom-safe-themes
   (quote
    ("9f569b5e066dd6ca90b3578ff46659bc09a8764e81adf6265626d7dc0fac2a64" "611e38c2deae6dcda8c5ac9dd903a356c5de5b62477469133c89b2785eb7a14d" "d507c9e58cb0eb8508e15c8fedc2d4e0b119123fab0546c5fd30cadd3705ac86" "5900bec889f57284356b8216a68580bfa6ece73a6767dfd60196e56d050619bc" "b81bfd85aed18e4341dbf4d461ed42d75ec78820a60ce86730fc17fc949389b2" "365d9553de0e0d658af60cff7b8f891ca185a2d7ba3fc6d29aadba69f5194c7f" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "0e0c37ee89f0213ce31205e9ae8bce1f93c9bcd81b1bcda0233061bb02c357a8" "086970da368bb95e42fd4ddac3149e84ce5f165e90dfc6ce6baceae30cf581ef" "f2057733672d3b119791f5b7d1a778bf8880121f22ea122a21d221b45081f49e" "0c3b1358ea01895e56d1c0193f72559449462e5952bded28c81a8e09b53f103f" "d96587ec2c7bf278269b8ec2b800c7d9af9e22d816827639b332b0e613314dfd" "760ce657e710a77bcf6df51d97e51aae2ee7db1fba21bbad07aab0fa0f42f834" "aea30125ef2e48831f46695418677b9d676c3babf43959c8e978c0ad672a7329" "12670281275ea7c1b42d0a548a584e23b9c4e1d2dabb747fd5e2d692bcd0d39b" "6145e62774a589c074a31a05dfa5efdf8789cf869104e905956f0cbd7eda9d0e" "6c7db7fdf356cf6bde4236248b17b129624d397a8e662cf1264e41dab87a4a9a" "ed317c0a3387be628a48c4bbdb316b4fa645a414838149069210b66dd521733f" "975f179874065cd6941eb6ce31e851230850ef7b1a940139d816d6496cb67610" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "83db918b06f0b1df1153f21c0d47250556c7ffb5b5e6906d21749f41737babb7" "604648621aebec024d47c352b8e3411e63bdb384367c3dd2e8db39df81b475f5" "b8929cff63ffc759e436b0f0575d15a8ad7658932f4b2c99415f3dde09b32e97" "16dd114a84d0aeccc5ad6fd64752a11ea2e841e3853234f19dc02a7b91f5d661" "dd4628d6c2d1f84ad7908c859797b24cc6239dfe7d71b3363ccdd2b88963f336" "a1a966cf2e87be6a148158c79863440ba2e45aa06cc214341feafe5c6deca4f2" "065efdd71e6d1502877fd5621b984cded01717930639ded0e569e1724d058af8" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(fci-rule-color "#5c5e5e")
 '(hl-paren-colors
   (quote
    ("#B9F" "#B8D" "#B7B" "#B69" "#B57" "#B45" "#B33" "#B11")))
 '(jdee-db-active-breakpoint-face-colors (cons "#0d0d0d" "#41728e"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#0d0d0d" "#b5bd68"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#0d0d0d" "#5a5b5a"))
 '(nil nil t)
 '(org-fontify-done-headline t)
 '(org-fontify-quote-and-verse-blocks t)
 '(org-fontify-whole-heading-line t)
 '(package-selected-packages
   (quote
    (doom-themes dracula-theme arjen-grey-theme badwolf-theme base16-theme darktooth-theme company-go xresources-theme web-mode evil-magit magit ac-c-headers use-package exec-path-from-shell go-complete go-mode hamburger-menu yoshi-theme tao-theme evil-commentary rainbow-delimiters pdf-tools latex-preview-pane ample-theme jedi neotree jabber powerline-evil powerline color-theme-sanityinc-tomorrow writeroom-mode simpleclip helm smex evil auto-complete dired+)))
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
