(require 'package)
(add-to-list 'package-archives
         '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

;(require 'evil-org)
;(add-hook 'org-mode-hook 'evil-org-mode)
;(evil-org-set-key-theme '(navigation insert textobjects todo additional calendar))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" "d1b4990bd599f5e2186c3f75769a2c5334063e9e541e37514942c27975700370" "4697a2d4afca3f5ed4fdf5f715e36a6cac5c6154e105f3596b44a4874ae52c45" "356e5cbe0874b444263f3e1f9fffd4ae4c82c1b07fe085ba26e2a6d332db34dd" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "450f3382907de50be905ae8a242ecede05ea9b858a8ed3cc8d1fbdf2d57090af" "d1cc05d755d5a21a31bced25bed40f85d8677e69c73ca365628ce8024827c9e3" "975f179874065cd6941eb6ce31e851230850ef7b1a940139d816d6496cb67610" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "6ee6f99dc6219b65f67e04149c79ea316ca4bcd769a9e904030d38908fd7ccf9" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "611e38c2deae6dcda8c5ac9dd903a356c5de5b62477469133c89b2785eb7a14d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "9d8894401b82328a6518f16c252d6c31554e0c37a3f3d36d0afd0fd2e004c93d" default)))
 '(fci-rule-color "#5c5e5e")
 '(jdee-db-active-breakpoint-face-colors (cons "#0d0d0d" "#41728e"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#0d0d0d" "#b5bd68"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#0d0d0d" "#5a5b5a"))
 '(package-selected-packages
   (quote
    (yaml-mode evil-org-agenda aggressive-indent nyan-mode emmet-mode go-mode django-mode beacon ag counsel-projectile projectile which-key twilight-theme cyberpunk-theme dumb-jump company-irony spaceline sudo-edit switch-window rainbow-mode avy spacemacs-theme nimbus-theme yoshi-theme xresources-theme writeroom-mode web-mode virtualenv use-package tao-theme sublime-themes smooth-scrolling smex smart-mode-line simpleclip rainbow-delimiters python-mode pyflakes py-yapf py-autopep8 powerline-evil pdf-tools org-journal org-bullets org-blog nlinum neotree monitor moe-theme markdown-mode latex-preview-pane kaolin-themes jabber hlinum helm hamburger-menu gruvbox-theme gruber-darker-theme go-complete go-autocomplete font-lock+ fold-dwim-org exec-path-from-shell evil-org evil-magit evil-commentary elpy dracula-theme doom-themes dired+ diminish delight darktooth-theme darkokai-theme counsel company-go color-theme-sanityinc-tomorrow cherry-blossom-theme base16-theme badwolf-theme autopair auto-complete-c-headers auctex atom-one-dark-theme arjen-grey-theme ample-theme ac-html-bootstrap ac-html ac-clang ac-c-headers)))
 '(vc-annotate-background "#1d1f21")
 '(vc-annotate-color-map
   (list
    (cons 20 "#b5bd68")
    (cons 40 "#c8c06c")
    (cons 60 "#dcc370")
    (cons 80 "#f0c674")
    (cons 100 "#eab56d")
    (cons 120 "#e3a366")
    (cons 140 "#de935f")
    (cons 160 "#d79e84")
    (cons 180 "#d0a9a9")
    (cons 200 "#c9b4cf")
    (cons 220 "#ca9aac")
    (cons 240 "#cb8089")
    (cons 260 "#cc6666")
    (cons 280 "#af6363")
    (cons 300 "#936060")
    (cons 320 "#765d5d")
    (cons 340 "#5c5e5e")
    (cons 360 "#5c5e5e")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
