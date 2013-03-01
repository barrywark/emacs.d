;; Basic settings
(setq-default cursor-type 'bar)

;; Packages
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(when (not (package-installed-p 'clojure-mode))
  (package-refresh-contents)
  (package-install 'clojure-mode))

(when (not (package-installed-p 'clojure-test-mode))
  (do 
      (package-refresh-contents)
      (package-install 'clojure-test-mode)))

(when (not (package-installed-p 'paredit))
  (do 
      (package-refresh-contents)
      (package-install 'paredit)))

(when (not (package-installed-p 'nrepl))
  (do
      (package-refresh-contents)
      (package-install 'nrepl)))

(when (not (package-installed-p 'rainbow-delimiters))
  (do
    (package-refresh-contents)
    (package-install 'rainbow-delimiters)))


;; NREPL
(add-hook 'nrepl-interaction-mode-hook
  'nrepl-turn-on-eldoc-mode)

(setq nrepl-lein-command "~/bin/lein")
 
(setq nrepl-hide-special-buffers t)
(setq nrepl-popup-stacktraces nil)

(add-hook 'nrepl-mode-hook 'paredit-mode)

(add-hook 'nrepl-mode-hook 'rainbow-delimiters-mode)

;; Meta key
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)
