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
 '(exec-path
   (quote
	("/usr/local/bin" "/usr/bin" "/bin" "/usr/lib64/emacs/emacs/24.5/x86_64-solus-linux" "/home/lackita/.rvm/gems/ruby-2.3.0/bin")))
 '(indent-tabs-mode t)
 '(kill-whole-line t)
 '(org-startup-truncated nil)
 '(package-selected-packages
   (quote
	(arduino-mode docker csv-mode restclient zop-to-char zenburn-theme yari yaml-mode which-key web-mode volatile-highlights undo-tree smex smartrep smartparens smart-mode-line slime scss-mode rust-mode ruby-tools ruby-refactor rubocop rainbow-mode rainbow-delimiters projectile-rails ov operate-on-number move-text mediawiki markdown-mode magit key-chord json-mode js2-mode imenu-anywhere ido-ubiquitous helm-projectile helm-descbinds helm-ag haskell-mode guru-mode groovy-mode grizzl god-mode gitignore-mode gitconfig-mode git-timemachine gist geiser flycheck flx-ido expand-region erlang ensime elisp-slime-nav easy-kill dockerfile-mode discover-my-major diminish diff-hl csharp-mode crux company-auctex coffee-mode cider cdlatex browse-kill-ring beacon anzu anaconda-mode ace-window)))
 '(projectile-rails-vanilla-command "docker-compose run web rails")
 '(sql-mysql-options (quote ("-A")))
 '(tab-stop-list
   (quote
	(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96)))
 '(tab-width 4)
 '(web-mode-markup-indent-offset 2)
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

;; Ruby customizations
(require 'ruby-refactor)
(add-hook 'ruby-mode-hook 'ruby-refactor-mode-launch)
(projectile-rails-global-mode)

(setq original-command 'rake--choose-command-prefix)
(defun rake--choose-command-prefix (root)
  (concat "docker-compose run web " (original-command root)))

;; Compilation notification
(require 'notifications)
(defun notify-compile-result (buffer msg)
  (notifications-notify :body msg))
(add-to-list 'compilation-finish-functions 'notify-compile-result)

(provide 'custom)
;;; custom.el ends here
