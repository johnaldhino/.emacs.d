

(setq inhibit-startup-message t)

; remove part of tool bar at top of emacs windows
(tool-bar-mode -1)


; easier autocompletion
(setq indo-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)


; control of windows
(winner-mode 1)


; different buffer menu
(defalias 'list-buffers 'ibuffer-other-window) 


; following lines enure loading and updating of packages (using use-package)


(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(package-initialize)

;; ;; Bootstrap 'use-package'
;; (eval-after-load 'gnutls
;;   '(add-to-list 'gnutls-trustfiles "/etc/ssl/cert.pem"))
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(package-initialize)


(eval-when-compile
  (require 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t)


(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))


(use-package tex :ensure auctex)
(use-package babel)
(use-package company)
(use-package expand-region)
(use-package magit)
(use-package org-babel-eval-in-repl)
(use-package pdf-tools)
(use-package rainbow-delimiters)
(use-package yasnippet-snippets)
(use-package try)
;(use-package helm)






(setq org-image-actual-width nil)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-c\C-l" 'org-insert-link)
(global-set-key "\C-ca" 'org-agenda)
(setq org-log-done t)




;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("~/Documents/demonstrating/demonstrating.org" "~/Documents/APEX/org-APEX/APEX_overall.org" "~/org-mode-test/test.org")))
 '(package-selected-packages
   (quote
    (org-babel-eval-in-repl babel yasnippet-snippets rainbow-delimiters magit expand-region company pdf-tools auctex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )





; for pdf tools


(pdf-tools-install)

;; Use pdf-tools to open PDF files
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-source-correlate-start-server t)

;; Update PDF buffers after successful LaTeX runs
(add-hook 'TeX-after-compilation-finished-functions
           #'TeX-revert-document-buffer)


; auctex

(require 'tex-site)


;auctex lines
					
(setq TeX-auto-save t)
(setq TeX-parse-self t)



(setq bibtex-dialect 'biblatex)




;; Global start company mode
(add-hook 'after-init-hook 'global-company-mode)


;; Global start expand region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)


;; Global rainbow delimiters

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)


(windmove-default-keybindings)


;; global flycheck mode

;(global-flycheck-mode)


;; magit
(global-set-key (kbd "C-x g") 'magit-status)


;; (global-set-key [?\M-n] (lambda () (forward-line 5)))
;; (global-set-key (kbd "M-n") (lambda () (interactive) (forward-line 5)))



(org-babel-do-load-languages
 'org-babel-load-languages
 '((dot . t)
 (plantuml . t))) ; this line activates dot


(add-hook 'org-mode-hook #'toggle-word-wrap)


; ensures windmove keybindings work in org mode

(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)
