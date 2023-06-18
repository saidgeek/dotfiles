(setq gc-cons-threshold (* 50 1000 1000))

(setq inhibit-startup-message t)
(setq visible-bell t)

;; disable display numbers
(dolist (mode '(org-mode-hook
		term-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode nil))))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode)
(global-display-line-numbers-mode 1)
(electric-pair-mode 1)
(hl-line-mode 1)

(setq custom-file (expand-file-name "custom-val.el" user-emacs-directory))
(load custom-file)

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'catppuccin t)
(setq catppuccin-flavor 'macchiato)
(catppuccin-reload)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 30)))

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package nerd-icons :ensure t)

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 ("M-x" . counsel-M-x)
	 :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (setq ivy-format-function 'ivy-format-function-arrow)
  (setq ivy-wrap t)
  (setq ivy-fixed-height-minibuffer t)
  (setq ivy-height 20)
  (ivy-mode 1))

(use-package ivy-rich
  :after ivy
  :init
  (ivy-rich-mode 1))

(use-package swiper :ensure t)

(use-package counsel
  :ensure t
  :bind (("C-M-j" . 'counsel-switch-buffer)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
         :config
         (counsel-mode 1))

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config (projectile-mode)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/develop")
    (setq projectile-project-search-path '("~/develop" "~/develop/rust" ("~/develop" . 1))))
  (when (file-directory-p "~/projects")
    (setq projectile-project-search-path '("~/projects" "~/projects/saigeek" ("~/projects/latamXP" . 2) "~/projects/lab" "~/projects/utils")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
  :after projectile
  :config (counsel-projectile-mode))

(use-package perspective
  :ensure t
  :bind
  ("C-x C-b" . persp-list-buffers)         ; or use a nicer switcher, see below
  :custom
  (persp-mode-prefix-key (kbd "C-c M-p"))  ; pick your own prefix key here
  :init
  (persp-mode))

(use-package magit :ensure t)

(use-package multi-vterm :ensure t)

(use-package eglot
  :ensure t
  :config
  (add-to-list 'eglot-server-programs '(typescript-mode . ("typescript-language-server" "--stdio")))
  (add-to-list 'eglot-server-programs '(rjsx-mode . ("typescript-language-server" "--stdio")))
  (add-to-list 'eglot-server-programs '(rust-mode . ("rust-analyzer")))
  (add-to-list 'eglot-server-programs '(nix-mode . ("rnix-lsp")))

  (add-hook 'typescript-mode-hook 'eglot-ensure)
  (add-hook 'web-mode-hook 'eglot-ensure)
  (add-hook 'rjsx-mode-hook 'eglot-ensure)
  (add-hook 'rust-mode-hook 'eglot-ensure)
  (add-hook 'nix-mode-hook 'eglot-ensure)
  (add-hook 'prog-mode-hook 'eglot-ensure)
  (add-hook 'before-save-hook #'eglot-format-buffer))

(setq eglot-autoshutdown t)
(setq eglot-stay-out-of '(company))

(use-package typescript-mode
  :mode "\\.ts\\'"
  :config
  (define-derived-mode typescriptreact-mode typescript-mode "Typescript TSX")
  (add-to-list 'auto-mode-alist '("\\.tsx?\\" . typescriptreact-mode))
  (setq typescript-indent-level 2))

(use-package rust-mode :ensure t)

(use-package web-mode :ensure t)

(use-package rjsx-mode :ensure t)

(use-package nix-mode :ensure t)

;; (with-eval-after-load 'flycheck
;;   (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

;; (use-package flycheck
;;   :ensure t
;;   :init
;;   (global-flycheck-mode 1))

;; (defun setup-eslint-flycheck-checker ()
;;   (flycheck-add-mode 'javascript-eslint 'web-mode)
;;   (flycheck-select-checker 'javascript-eslint))

;; (eval-after-load 'flycheck
;;   '(setup-eslint-flycheck-checker))

;; (add-hook 'web-mode-hook
;; 	  (lambda ()
;; 	    (flycheck-add-mode 'javascript-eslint 'web-mode)
;; 	    (flycheck-select-checker 'javascript-eslint)))

;; (add-hook 'typescript-mode-hook
;; 	  (lambda ()
;; 	    (flycheck-add-mode 'javascript-eslint 'typescript-mode)
;; 	    (flycheck-select-checker 'javascript-eslint)))

(use-package company
  :ensure t
  :after eglot
  :hook (prog-mode . company-mode)
  :bind
  (:map company-active-map
        ("<tab>" . company-complete-selection)
        (:map eglot-mode-map
              ("<tab>" . company-indent-or-complete-common)))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))


(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))

(defun org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (auto-fill-mode 0)
  (visual-line-mode 1)
  (setq evil-auto-indent nil)
  (diminish org-indent-mode))

(use-package org
  :ensure t
  :pin org
  :hook (org-mode . org-mode-setup)
  :config
  (setq org-ellipsis " 󱞣 "
	org-hide-emphasis-markers t
        org-src-fontify-natively t
        org-fontify-quote-and-verse-blocks t
        org-src-tab-acts-natively t
        org-edit-src-content-indentation 2
        org-hide-block-startup nil
        org-src-preserve-indentation nil
        org-startup-folded 'content
        org-cycle-separator-lines 2))

(use-package org-superstar
  :ensure t
  :after org
  :hook (org-mode . org-superstar-mode)
  :custom
  (org-superstar-remove-leading-stars t)
  (org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●")))

(require 'org-tempo)

(add-to-list 'org-structure-template-alist '("sh" . "src sh"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("ts" . "src typescript"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))
(add-to-list 'org-structure-template-alist '("rs" . "src rust"))
(add-to-list 'org-structure-template-alist '("yaml" . "src yaml"))
(add-to-list 'org-structure-template-alist '("json" . "src json"))

(set-face-attribute 'org-document-title nil :font "Hack Nerd Font" :weight 'bold :height 1.3)
(set-face-attribute 'org-code nil :font "VictorMono Nerd Font" :weight 'bold)
(dolist (face '((org-level-1 . 1.2)
                (org-level-2 . 1.1)
                (org-level-3 . 1.05)
                (org-level-4 . 1.0)
                (org-level-5 . 1.1)
                (org-level-6 . 1.1)
                (org-level-7 . 1.1)
                (org-level-8 . 1.1))))

(set-face-attribute 'default nil 
  :font "VictorMono Nerd Font"
  :height 100
  :weight 'bold)
(set-face-attribute 'variable-pitch nil 
  :font "VictorMono Nerd Font"
  :height 100
  :weight 'semibold)
(set-face-attribute 'fixed-pitch nil
  :font "VictorMono Nerd Font"
  :height 100
  :weight 'semibold)
;; Makes commented text and keywords italics.
;; This is working in emacsclient but not emacs.
;; Your font must have an italic face available.
(set-face-attribute 'font-lock-comment-face nil
  :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil
  :slant 'italic)

;; Uncomment the following line if line spacing needs adjusting.
;;(setq-default line-spacing 0.12)

;; Needed if using emacsclient. Otherwise, your fonts will be smaller than expected.
;;(add-to-list 'default-frame-alist '(font . "SauceCodePro Nerd Font-16" :weight 'semibold))
;; changes certain keywords to symbols, such as lamda!
(setq global-prettify-symbols-mode t)
;;(add-hook 'find-file-hook (lambda () (set-face-attribute 'default nil :height 105)))

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package which-key
  :ensure t
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package general
  :ensure t
  :after evil
  :config
  (general-create-definer efs/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (efs/leader-keys
    ;; Projectile
    "e"  '(projectile-switch-project :which-key "Projectile projects")
    "f"  '(projectile-find-file :which-key "Projectile projects")
    ;; Vterm
    "t c"  '(multi-vterm :which-key "Terminal")
    "t n"  '(multi-vterm-next :which-key "Terminal next")
    "t p"  '(multi-vterm-prev :which-key "Terminal prev")
    "t r"  '(multi-vterm-rename :which-key "Terminal rename")
    ;; Perspective
    "p c" '(persp-switch :whish-key "Perspective switch")
    "p n" '(persp-next :whish-key "Perspective next")
    "p p" '(persp-prev :whish-key "Perspective prev")
    "p r" '(persp-rename :whish-key "Perspective rename")))
