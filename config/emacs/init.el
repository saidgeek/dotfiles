(setq gc-cons-threshold (* 50 1000 1000))

(setq custom-file (expand-file-name "custom-val.el" user-emacs-directory))
(load custom-file)

;; basics
(setq inhibit-startup-message t)
(setq visible-bell t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(column-number-mode)
(global-display-line-numbers-mode 1)

;; disable display numbers
(dolist (mode '(org-mode-hook
		term-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(electric-pair-mode 1)
(hl-line-mode 1)

; (set-face-attribute 'default nil :font "VictorMono Nerd Font" :height 110)

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
(setq use-package-always-ensure t)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'catppuccin t)
(setq catppuccin-flavor 'macchiato)
(catppuccin-reload)

;; (use-package doom-themes
;;   :config
;;   (load-theme 'doom-dracula))

(use-package all-the-icons
  :if (display-graphic-p))

(use-package nerd-icons)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 30)))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package general
  :after evil
  :config
  (general-create-definer efs/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (efs/leader-keys
    "t"  '(:ignore t :which-key "toggles")))

(use-package evil
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
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))


;; minibuffer completion and search
(use-package swiper)
(use-package counsel
  :bind (("C-M-j" . 'counsel-switch-buffer)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
	 :config
	 (counsel-mode 1))
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

(use-package magit)

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/develop")
    (setq projectile-project-search-path '("~/develop/")))
  (when (file-directory-p "~/projects")
    (setq projectile-project-search-path '("~/projects" "~/projects/saigeek" ("~/projects/latamXP" . 2) "~/projects/lab" "~/projects/utils")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
  :after projectile
  :config (counsel-projectile-mode))

;; develop
;;;; LSP

(use-package typescript-mode
  :mode "\\.ts\\'"
  ;; :hook
  ;; (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2))

(use-package rust-mode
  :ensure t)

(use-package eglot
  :ensure t
  :config
  ;; (add-to-list 'eglot-server-programs '(typescript-mode . ("typescript-language-server" "--stdio"))
  ;; (add-to-list 'eglot-server-programs '(rust-mode . ("rust-analyzer"))

  (add-hook 'typescript-mode-hook 'eglot-ensure)
  (add-hook 'rust-mode-hook 'eglot-ensure)
  (add-hook 'prog-mode-hook 'eglot-ensure))

(setq eglot-autoshutdown t)
(setq eglot-stay-out-of '(company))

(use-package company
  :hook (prog-mode . company-mode)
  :bind
  (:map company-active-map
	("<tab>" . company-complete-selection))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(setq eglot-completion-function #'ivy-completion-at-point)

(add-hook 'eglot--managed-mode-hook (lambda () (setq-local company-backends '(company-capf))))
(add-hook 'after-init-hook 'global-company-mode)

(setq eglot-history-length 100)
(setq eglot-history-file "~/.emacs.d/eglot-history")


;; (defun sgk/lsp-mode-setup ()
;;   (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
;;   (lsp-headerline-breadcrumb-mode))

;; (use-package lsp-mode
;;   :hook 
;;   (lsp-mode . sgk/lsp-mode-setup)
;;   :init
;;   (setq lsp-keymap-prefix "C-c l")
;;   :config
;;   (lsp-enable-which-key-integration t)
;;   :commands (lsp lsp-deferred))

;; (use-package lsp-ui
;;   :hook (lsp-mode . lsp-ui-mode)
;;   :custom
;;   (setq lsp-ui-doc-position 'bottom)
;;   (setq lsp-ui-sideline-enable t)
;;   (setq lsp-ui-sideline-show-hover t))


;; (use-package lsp-ivy
;;   :after lsp
;;   :commands lsp-ivy-workspace-symbol)

;; (use-package lsp-treemacs
;;   :commands lsp-treemacs-errors-list)

;; (use-package company
;;   :after lsp-mode
;;   :hook (prog-mode . company-mode)
;;   :bind
;;   (:map company-active-map
;; 	("<tab>" . company-complete-selection)
;; 	(:map lsp-mode-map
;; 	      ("<tab>" . company-indent-or-complete-common)))
;;   :custom
;;   (company-minimum-prefix--length 1)
;;   (company-idle-delay 0.0))

;; (use-package company-box
;;   :hook (company-mode . company-box-mode))



;; Org mode
(use-package org
  :pin org)
