(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;; ORG BABEL

(org-babel-load-file (expand-file-name "~/.emacs.d/anassinit.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-verbatim-environments
   (quote
    ("verbatim" "verbatim*" "filecontents" "filecontents*" "python" "shell")))
 '(package-selected-packages
   (quote
    (neon-mode yasnippet yasnippet-snippets auctex jedi flycheck which-key use-package try org-bullets doom-themes counsel auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-latex-sectioning-2-face ((t (:foreground "#85c7f3" :weight semi-bold :height 2.0))))
 '(font-latex-sectioning-3-face ((t (:foreground "#a9a1e1" :weight semi-bold :height 1.5)))))
