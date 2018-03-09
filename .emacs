;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(load-theme 'xresources-theme)

(require 'package) 

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/")
             t)
            
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/")
             t)

(package-initialize)

;; python
(elpy-enable)

;; y-n instead of yes-no
(defalias 'yes-or-no-p 'y-or-n-p)

;; automatically follow symlinks
(setq find-file-visit-truename t)
(setq vc-follow-symlinks t)

;; font
(set-default-font "Ubuntu Mono-12")

(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)

;; set the default encoding system
(prefer-coding-system 'utf-8)
(setq default-file-name-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; backwards compatibility as default-buffer-file-coding-system
;; is deprecated in 23.2.
(if (boundp buffer-file-coding-system)
    (setq buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; theme
(load-theme 'doom-tomorrow-night t)

;; Display name of teh buffer
(setq frame-title-format "emacs: %b")

;; Disable startup screen
(setq inhibit-splash-screen   t)
(setq inhibit-startup-message t)

;; neotree icons
(require 'all-the-icons)
(setq neo-theme (if (display-graphic-p) 'icons 'icons))

;; Disable GUI
(tooltip-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq use-dialog-box nil)
(setq ring-bell-function 'ignore)

;; Scrolling
(setq scroll-step               1)
(setq scroll-margin            10)
(setq scroll-conservatively 10000)

(setq
 evil-search-module 'evil-search
 evil-want-C-u-scroll t
 evil-want-C-w-in-emacs-state t)

; c-lang
(setq c-default-style "linux"
      c-basic-offset 4)

;; Evil
(require 'evil)
(evil-mode t)

(require 'simpleclip)
(simpleclip-mode 1)

;(require 'helm-config)
;(global-set-key (kbd "M-x") #'helm-M-x)
;(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
;(global-set-key (kbd "C-x C-f") #'helm-find-files)
;(global-set-key (kbd "C-x C-b") #'helm-mini)
;(helm-mode 1)

;; ivy
(ivy-mode 1)
;(setq ivy-use-virtual-buffers t)
;(setq ivy-count-format "(%d/%d) ")
(global-set-key (kbd "C-x C-b") #'ivy-switch-buffer)

;; counsel
(global-set-key (kbd "M-x") #'counsel-M-x)
(global-set-key (kbd "C-h v") #'counsel-describe-variable)
(global-set-key (kbd "C-h f") #'counsel-describe-function)
(global-set-key (kbd "C-x C-f") #'counsel-find-file)
(global-set-key (kbd "C-x C-m") #'counsel-imenu)

;; Writeroom
(setq writeroom-fullscreen-effect 'maximized)
;;(global-set-key (kbd "C-x C-n") #'writeroom-mode)
;;(global-set-key (kbd "C-x C-m") #'visual-line-mode)

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.gohtml\\'" . web-mode))
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
  (setq css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (local-set-key (kbd "RET") 'newline-and-indent)
  (setq web-mode-extra-snippets '(("erb" . (("name" . ("beg" . "end"))))
                                ))
  (setq web-mode-extra-auto-pairs '(("erb" . (("open" "close")))
                                  ))
  (setq web-mode-enable-current-element-highlight t)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)
(add-hook 'ac-html 'html-mode-hook)

;;Auto-complete
(defun ac-init()
    (require 'auto-complete-config)
    (ac-config-default)
    (setq ac-auto-start 1)
    (setq ac-auto-show-menu t)
    (setq ac-delay 0)
    ;;(setq ac-show-menu-immediately-on-auto-complete t)
    (global-auto-complete-mode t)
    (add-to-list 'ac-modes 'lisp-mode)
    (add-to-list 'ac-sources 'ac-source-variables)
    (add-to-list 'ac-sources 'ac-source-functions)
    (add-to-list 'ac-sources 'ac-source-dictionary)
    (add-to-list 'ac-modes 'web-mode)
   ;(add-to-list 'ac-sources 'ac-source-filename))
    (add-hook 'go-mode-hook 'auto-complete-for-go))
(ac-init)

;; golang
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
  (global-set-key (kbd "C-x C-.") 'godef-jump)
  (global-set-key (kbd "C-x C-,") 'pop-tag-mark)
  (if (not (string-match "go" compile-command))
    (set (make-local-variable 'compile-command)
                        "go build -v && go run -v")))
(my-go-mode-hook)

(add-hook 'go-mode-hook 'my-go-mode-hook)

;; Highlighting line number
;(require 'hlinum)
;(hlinum-activate)

;; Line numbers
(require 'linum)
(global-nlinum-mode t)
;(global-linum-mode t)
(line-number-mode t)
;(setq linum-highlight-in-all-buffersp t)
;(column-number-mode t)
(setq linum-format " %d")
(setq nlinum-format " %d")

;; Disable autosaving
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Indent settings
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default standart-indent 4)
(setq-default lisp-body-indent 4)
(global-set-key (kbd "RET") 'newline-and-indent)

;; Clipboard settings
(setq x-select-enable-clipboard t)

;; Org
(require 'org)
(define-key global-map "\C-ca" `org-agenda)
(define-key global-map "\C-cc" `org-capture)
(setq org-agenda-files (list "~/Documents/org/"))
(setq org-default-notes-file "~/Documents/org/todo.org")
(global-set-key (kbd "C-c o") (lambda () (interactive) (find-file "~/Documents/org/todo.org")))
(add-to-list 'load-path "~/.emacs.d/plugins/evil-org")

(require 'evil-org)
(add-hook 'org-mode-hook 'evil-org-mode)
(evil-org-set-key-theme '(navigation insert textobjects todo additional calendar))

(require 'evil-org-agenda)
(evil-org-agenda-set-keys)

(require 'org-bullets)
(setq org-bullets-bullet-list
;'("◉" "◎" "<img draggable="false" class="emoji" alt="⚫" src="https://s0.wp.com/wp-content/mu-plugins/wpcom-smileys/twemoji/2/svg/26ab.svg">" "○" "►" "◇"))
'("●" "○" "✸" "✿" "~"))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(add-hook 'after-init-hook 'org-agenda-list)

;; EOF newlines
(setq require-final-newline t)
(setq next-line-add-newlines nil)

;; Display file size in mode-line
;;(setq display-time-24hr-format t)
;;(display-time-mode               t)
(size-indication-mode t)

;; Neotree
(require 'neotree)
(global-set-key (kbd "C-x C-t") #'neotree-toggle)

; python 
(require 'epc)
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

; c/c++
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/include"))
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

;; autopair
(require 'autopair)
(autopair-global-mode)

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

;; Neotree evil-mode keybindings
(add-hook 'neotree-mode-hook
    (lambda ()
    (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
    (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-quick-look)
    (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
    (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

;; LaTeX
(setq LaTeX-item-indent 0)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#1c1f24" "#ff665c" "#7bc275" "#FCCE7B" "#51afef" "#C57BDB" "#5cEfFF" "#DFDFDF"])
 '(ansi-term-color-vector
   [unspecified "#3f3f3f" "#dca3a3" "#5f7f5f" "#e0cf9f" "#7cb8bb" "#dc8cc3" "#7cb8bb" "#dcdccc"])
 '(custom-safe-themes
   (quote
    ("9be1d34d961a40d94ef94d0d08a364c3d27201f3c98c9d38e36f10588469ea57" "6ee6f99dc6219b65f67e04149c79ea316ca4bcd769a9e904030d38908fd7ccf9" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "f8cf128fa0ef7e61b5546d12bb8ea1584c80ac313db38867b6e774d1d38c73db" "25c06a000382b6239999582dfa2b81cc0649f3897b394a75ad5a670329600b45" "3de3f36a398d2c8a4796360bfce1fa515292e9f76b655bb9a377289a6a80a132" "77a46326228485699b378a8537f9bc5d6b0d087566ac179bec752fab322d814a" "50b64810ed1c36dfb72d74a61ae08e5869edc554102f20e078b21f84209c08d1" "a62f0662e6aa7b05d0b4493a8e245ab31492765561b08192df61c9d1c7e1ddee" "446cc97923e30dec43f10573ac085e384975d8a0c55159464ea6ef001f4a16ba" "938d8c186c4cb9ec4a8d8bc159285e0d0f07bad46edf20aa469a89d0d2a586ea" "55baf0e5235a0268ea0b9b32f7099eb5e85a8e347fa63d6e2c9d6046362e1efb" "2371df19aa61f33c43c635df9ff3854aa4bfb304fca147370f30b9925b3d01fe" "87488c7f0742a30c58c47f63d680a4278e24aa9d40b3f857d0bd5dae365729dc" "1f0ad9a71d69a17eacdf6fc38ba7a285b4ff76eca0c94327361898a9d270f8ce" "5b388add509c423e4ac275668662486628690e7ffe0050998615fc4c3669c16c" "107693012b59b3a94faa869756333b8fe7224670f762ce97eb1dda89f03f5bcd" "a19265ef7ecc16ac4579abb1635fd4e3e1185dcacbc01b7a43cf7ad107c27ced" "b9a06c75084a7744b8a38cb48bc987de10d68f0317697ccbd894b2d0aca06d2b" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "5869717aa79da3e5d3cc68f13abfbc21745945c511bd941e51f8b7b9708d3422" "13b12885ab67ef208257e81884c881c9351bb4dea46b4b4fb0d54afcd6a0b25a" "92c1e9ad2eee51433c07119d16df28ead5c0dd25933336fbe3d13ce35ea6fcdc" "ea407ac9ed7d978457a6a6aae5bfb0800edbbfb76d9bf4b4ed7a9b48069a600b" "b5e97a4e3b0ef99a1015d781e2af3cb50be90bc1a4776a1b01fc145314aadc0e" "9f569b5e066dd6ca90b3578ff46659bc09a8764e81adf6265626d7dc0fac2a64" "611e38c2deae6dcda8c5ac9dd903a356c5de5b62477469133c89b2785eb7a14d" "d507c9e58cb0eb8508e15c8fedc2d4e0b119123fab0546c5fd30cadd3705ac86" "5900bec889f57284356b8216a68580bfa6ece73a6767dfd60196e56d050619bc" "b81bfd85aed18e4341dbf4d461ed42d75ec78820a60ce86730fc17fc949389b2" "365d9553de0e0d658af60cff7b8f891ca185a2d7ba3fc6d29aadba69f5194c7f" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "0e0c37ee89f0213ce31205e9ae8bce1f93c9bcd81b1bcda0233061bb02c357a8" "086970da368bb95e42fd4ddac3149e84ce5f165e90dfc6ce6baceae30cf581ef" "f2057733672d3b119791f5b7d1a778bf8880121f22ea122a21d221b45081f49e" "0c3b1358ea01895e56d1c0193f72559449462e5952bded28c81a8e09b53f103f" "d96587ec2c7bf278269b8ec2b800c7d9af9e22d816827639b332b0e613314dfd" "760ce657e710a77bcf6df51d97e51aae2ee7db1fba21bbad07aab0fa0f42f834" "aea30125ef2e48831f46695418677b9d676c3babf43959c8e978c0ad672a7329" "12670281275ea7c1b42d0a548a584e23b9c4e1d2dabb747fd5e2d692bcd0d39b" "6145e62774a589c074a31a05dfa5efdf8789cf869104e905956f0cbd7eda9d0e" "6c7db7fdf356cf6bde4236248b17b129624d397a8e662cf1264e41dab87a4a9a" "ed317c0a3387be628a48c4bbdb316b4fa645a414838149069210b66dd521733f" "975f179874065cd6941eb6ce31e851230850ef7b1a940139d816d6496cb67610" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "83db918b06f0b1df1153f21c0d47250556c7ffb5b5e6906d21749f41737babb7" "604648621aebec024d47c352b8e3411e63bdb384367c3dd2e8db39df81b475f5" "b8929cff63ffc759e436b0f0575d15a8ad7658932f4b2c99415f3dde09b32e97" "16dd114a84d0aeccc5ad6fd64752a11ea2e841e3853234f19dc02a7b91f5d661" "dd4628d6c2d1f84ad7908c859797b24cc6239dfe7d71b3363ccdd2b88963f336" "a1a966cf2e87be6a148158c79863440ba2e45aa06cc214341feafe5c6deca4f2" "065efdd71e6d1502877fd5621b984cded01717930639ded0e569e1724d058af8" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(fci-rule-color "#5c5e5e")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(hl-paren-colors
   (quote
    ("#B9F" "#B8D" "#B7B" "#B69" "#B57" "#B45" "#B33" "#B11")))
 '(jdee-db-active-breakpoint-face-colors (cons "#0d0d0d" "#41728e"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#0d0d0d" "#b5bd68"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#0d0d0d" "#5a5b5a"))
 '(linum-format " %7i ")
 '(nil nil t)
 '(notmuch-search-line-faces
   (quote
    (("unread" :foreground "#aeee00")
     ("flagged" :foreground "#0a9dff")
     ("deleted" :foreground "#ff2c4b" :bold t))))
 '(org-fontify-done-headline t)
 '(org-fontify-quote-and-verse-blocks t)
 '(org-fontify-whole-heading-line t)
 '(package-selected-packages
   (quote
    (counsel darkokai-theme all-the-icons auto-complete-c-headers moe-theme hlinum kaolin-themes sublime-themes virtualenv elpy org-journal org-bullets org-blog fold-dwim-org evil-org auctex ac-html-bootstrap ac-html doom-themes dracula-theme arjen-grey-theme badwolf-theme base16-theme darktooth-theme company-go xresources-theme web-mode evil-magit magit ac-c-headers use-package exec-path-from-shell go-complete go-mode hamburger-menu yoshi-theme tao-theme evil-commentary rainbow-delimiters pdf-tools latex-preview-pane ample-theme jedi neotree jabber powerline-evil powerline color-theme-sanityinc-tomorrow writeroom-mode simpleclip helm smex evil auto-complete dired+)))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
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
 '(default ((t (:foreground  "#afafaf" :background "#181818" ))))
 '(cursor ((t (:background "#8B546F" ))))
; '(mode-line ((t (:background "#222222" ))))
 '(mode-line ((t (:background "#272727" ))))
 ;'(mode-line ((t (:background "#8B546F" :foreground "#000" :buffer-id "#000"))))
 '(linum ((t (:foreground "#8B546F" ))))
 )

