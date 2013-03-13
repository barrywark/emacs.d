;; Basic settings
(setq-default cursor-type 'bar)

;; Packages
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar barrywark/my-packages '(clojure-mode
				paredit
				nrepl
				rainbow-delimiters
				markdown-mode
				textmate
				find-file-in-project))

(dolist (p barrywark/my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; NREPL
(add-hook 'nrepl-interaction-mode-hook
  'nrepl-turn-on-eldoc-mode)

(setq nrepl-lein-command "~/bin/lein")
 
(setq nrepl-hide-special-buffers t)
(setq nrepl-popup-stacktraces nil)

(add-hook 'nrepl-mode-hook 'paredit-mode)
(add-hook 'nrepl-mode-hook 'rainbow-delimiters-mode)

;; General programming
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Meta key
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)


;; Markdown
(eval-after-load "markdown"
  '(define-key markdown-mode-map (kbd "C-j") 'markdown-enter-key))

(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))

;; TextMate
(eval-after-load 'textmate
  '(define-key *textmate-mode-map* [(super shift t)] 'helm-imenu))

(add-hook 'prog-mode-hook 'barrywark/turn-on-textmate-mode)

(defun barrywark/turn-on-textmate-mode ()
  (textmate-mode 1))

(remove-hook 'text-mode-hook 'turn-on-auto-fill)
(remove-hook 'text-mode-hook 'turn-on-flyspell)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(speedbar-show-unknown-files t)
 '(speedbar-update-flag nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
