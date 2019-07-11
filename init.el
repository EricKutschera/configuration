;; general

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq inhibit-startup-message t)
(setq-default indent-tabs-mode nil)
(column-number-mode)
(show-paren-mode)
(setq-default scroll-conservatively 100)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(define-globalized-minor-mode global-linum-mode linum-mode linum-mode)
(global-linum-mode 1)
(setq ring-bell-function 'ignore)
(global-unset-key [(control z)])
(global-unset-key [(control x)(control z)])
(global-set-key (kbd "C-c b") 'windmove-left)
(global-set-key (kbd "C-c f") 'windmove-right)
(global-set-key (kbd "C-c p") 'windmove-up)
(global-set-key (kbd "C-c n") 'windmove-down)

;; package management
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))

;; backups in ~/.saves
(setq
 backup-by-copying t
 backup-directory-alist
 '(("." . "~/.saves"))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)

;; org-mode
(setq org-startup-folded nil)
(setq org-catch-invisible-edits t)
(defun org-keys ()
  "Modify keys for org-mode."
  (local-set-key (kbd "C-c a") 'org-agenda))
(add-hook 'org-mode-hook 'org-keys)

;; helm
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "M-y") #'helm-show-kill-ring)
(global-set-key (kbd "C-x b") #'helm-mini)
(helm-mode 1)

;; company
(add-hook 'after-init-hook 'global-company-mode)

;; Markdown
(add-hook 'markdown-mode-hook 'pandoc-mode)

;; auctex
(setq TeX-auto-save t)
(setq Tex-parse-self t)
(setq-default TeX-master nil)
(setq TeX-PDF-mode t)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(defun set-evince-as-viewer()
  (add-to-list 'TeX-view-program-list '
               ("Evince" "evince --page-index=%(outpage) %o")
  )
  (setq TeX-view-program-selection '((output-pdf "Evince")))
)

(add-hook 'LaTeX-mode-hook 'set-evince-as-viewer)

;;C++
(load "~/build/clang/cfe-7.0.1.src/tools/clang-format/clang-format.el")
(add-to-list 'auto-mode-alist '("\\.clang-format\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.c\\'" . c++-mode))
(add-hook 'c++-mode-hook 'electric-indent-mode)
(add-hook 'c++-mode-hook
         (lambda()
           (add-hook 'before-save-hook 'clang-format-buffer nil t)))
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c++-mode-hook
         (lambda ()
           (setq flycheck-clang-language-standard "c++14")))

;;Python
(add-hook 'python-mode-hook 'flycheck-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (haskell-mode company helm cmake-mode flycheck yaml-mode pandoc-mode auctex markdown-mode)))
 '(tab-width 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
