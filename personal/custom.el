;;; custom.el --- Non-prelude customizations

;;; Commentary:
;; Prelude is great, but there are a few things I depend on that
;; aren't part of it by default.

;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-keys (quote (97 115 100 102 103 104 106 107 108)))
 '(cperl-close-paren-offset -4)
 '(cperl-continued-statement-offset 0)
 '(cperl-indent-level 4)
 '(cperl-indent-parens-as-block t)
 '(cperl-use-syntax-table-text-property t)
 '(cperl-use-syntax-table-text-property-for-tags t)
 '(indent-tabs-mode t)
 '(kill-whole-line t)
 '(sql-mysql-options (quote ("-A")))
 '(tab-stop-list
   (quote
	(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96)))
 '(tab-width 4)
 '(web-mode-tag-auto-close-style 1))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq command-line-default-directory "~")
(require 'yasnippet)
(yas-global-mode 1)

(fset 'projectile-save-and-run-tests
      [?\s-p ?S ?\s-p ?P])

(defun projectile-save-and-run-tests-automatically (arg)
  (interactive "P")
  (let ((compilation-read-command nil))
	(projectile-save-project-buffers)
	(projectile-test-project arg)))

(global-set-key [f6] 'projectile-save-and-run-tests-automatically)


(global-set-key (kbd "C-x C-r") (lambda ()
				  (interactive)
				  (revert-buffer nil t)))

(require 'web-mode)
(global-set-key (kbd "C-c /") 'web-mode-element-close)

;; Helm customization
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

;; Clojure customizations
(require 'smartparens)
(require 'clojure-mode)
(define-key clojure-mode-map (kbd "M-)") 'sp-unwrap-sexp)

(provide 'custom)
;;; custom.el ends here
