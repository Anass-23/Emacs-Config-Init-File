(setq inhibit-startup-message t) ;; Treu la pantalla d'inici que és per a noobs

  (fset 'yes-or-no-p 'y-or-n-p) ;; Per anar mes rapid al fer acceeptacions o no

  (add-hook 'prog-mode-hook 'display-line-numbers-mode) 
  ;; Ens fa diplay dels numeros de linia de codi

  (tool-bar-mode -1)
  (menu-bar-mode 1) ;; Toolbar sempre actiu

  (setq make-backup-files nil) ;; Deshabilita els archius ~ que no molen res

  (global-hl-line-mode +1) ;; Remarca la linia on escribim

  (delete-selection-mode 1) ;; Per borar una selecció

  (add-hook 'text-mode-hook 'turn-on-auto-fill) ;; Per ficar el autofill

  (show-paren-mode 1) ;; Remarca parèntesis

  (set-language-environment "UTF-8") ;; Tot bé i sense errors

  (add-to-list 'default-frame-alist
  '(font . "Menlo-18"))

  (setq mac-option-key-is-meta t)
  (setq mac-right-option-modifier nil)

  ;;emacs.font: Menlo-18		
  
;; (menu-bar-mode 1)
  ;; (tool-bar-mode 1)
  ;; (scroll-bar-mode -1)
  ;; ;(toggle-frame-maximized) ;;; not using this one any more as each time init.el is eavluated, frame is toggled
  ;; (add-to-list 'default-frame-alist '(fullscreen . maximized))
  ;; (setq inhibit-splash-screen t)
  ;; (setq make-backup-files nil)
  ;; (defalias 'yes-or-no-p 'y-or-n-p)
  ;; (savehist-mode 1)
  ;; (global-auto-revert-mode 1)
  ;; (global-visual-line-mode 1)
  ;; (size-indication-mode 1)

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; (use-package tabbar
;;   :ensure t
;;   :config (tabbar-mode 1))

(use-package counsel
  :ensure t)

(use-package swiper
  :ensure t
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> l") 'counsel-load-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    (define-key ac-completing-map [return] nil)
    (define-key ac-completing-map "\r" nil)))

;; (use-package autopair
;;     :ensure t)
;;     (autopair-global-mode)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(use-package jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-hook 'python-mode-hook 'jedi:ac-setup))

;; (use-package elpy
;;     :ensure t
;;     :config
;;     (elpy-enable))

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

;; (require 'undo-tree)

(use-package undo-tree
:ensure t
:init
     (global-undo-tree-mode)
     (setq split-height-threshold 0))

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
	doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package all-the-icons
    :ensure t)

;; (all-the-icons-insert-icons-for 'alltheicon) 
;; (all-the-icons-icon-for-buffer)
;; (all-the-icons-icon-for-dir)
;; (all-the-icons-icon-for-file)
;; (all-the-icons-icon-for-mode)
;; (all-the-icons-icon-for-url)

(use-package all-the-icons-ivy
    :ensure t
    :init (add-hook 'after-init-hook 'all-the-icons-ivy-setup))
(setq all-the-icons-ivy-file-commands '(counsel-find-file counsel-file-jump counsel-recentf counsel-projectile-find-file counsel-projectile-find-dir))

(use-package doom-modeline
    :ensure t
    :hook (after-init . doom-modeline-mode))

(use-package memoize
    :ensure t)

(use-package neotree
    :ensure t
    ;; :init
    ;; (global-flycheck-mode t)
    )

    (setq neo-window-fixed-size nil)

;; (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
;; (insert (all-the-icons-icon-for-file "foo.py"))

(require 'highlight-indent-guides)
(add-hook 'python-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'column)

(add-hook 'LaTeX-mode-hook (function turn-on-reftex))
(setq reftex-plug-into-AUCTeX t)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode

(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
        (forward-line)
        (when (or (< arg 0) (not (eobp)))
          (transpose-lines arg))
        (forward-line -1))
      (move-to-column column t)))))

(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines down."
  (interactive "*p")
  (move-text-internal arg))

(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))

(provide 'move-text)


(global-set-key [M-up] 'move-text-up)
(global-set-key [M-down] 'move-text-down)
