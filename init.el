;; Basic settings
(setq cursor-type 'bar)

;; Packages
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(when (not (package-installed-p 'clojure-mode))
  (package-install 'clojure-mode))

(when (not (package-installed-p 'clojure-test-mode))
  (package-install 'clojure-mode))

(when (not (package-installed-p 'paredit))
  (package-install 'paredit))

(when (not (package-installed-p 'nrepl))
  (package-install 'nrepl))


;; NREPL
(add-hook 'nrepl-interaction-mode-hook
  'nrepl-turn-on-eldoc-mode)

(setq nrepl-lein-command "~/bin/lein")
 
(setq nrepl-hide-special-buffers t)
(setq nrepl-popup-stacktraces nil)

(add-hook 'nrepl-mode-hook 'paredit-mode)

;(add-hook 'nrepl-mode-hook 'rainbow-delimiters-mode)

;; Meta key
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)
