
;; below lines for org files
;(setq org-support-shift-select always)


;;(require 'org)
;; (define-key global-map "\M-cl" 'org-store-link)
;; (define-key global-map "\C-ca" 'org-agenda)


; following lines enure loading and updating of packages (using use-package)


(eval-when-compile
  (require 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t)


(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))


(use-package auctex)
(use-package babel)
(use-package company)
(use-package expand-region)
(use-package magit)
(use-package org-babel-eval-in-repl)
(use-package pdf-tools)
(use-package rainbow-delimiters)
(use-package yasnippet-snippets)







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


;auctex lines
					
(setq TeX-auto-save t)
(setq TeX-parse-self t)


; add package archives

(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
  '("gnu" . "http://elpa.gnu.org/packages/"))


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




;; Use pdf-tools to open PDF files
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-source-correlate-start-server t)

;; Update PDF buffers after successful LaTeX runs
(add-hook 'TeX-after-compilation-finished-functions
           #'TeX-revert-document-buffer)


;; Global start company mode
(add-hook 'after-init-hook 'global-company-mode)


;; Global start expand region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)


;; Global rainbow delimiters

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)


;; global flycheck mode

(global-flycheck-mode)


;; magit
(global-set-key (kbd "C-x g") 'magit-status)



(org-babel-do-load-languages
 'org-babel-load-languages
 '((dot . t)
 (plantuml . t))) ; this line activates dot
