;; Git
(require 'git)

;; MELPA
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/") t)
  (package-initialize))

;; UI
(setq column-number-mode t)
;(setq frame-title-format "%b")
;(tool-bar-mode -1)

;; Theme
;;(require 'color-theme-autoload "color-theme-autoloads")
;;(add-to-list 'load-path "/usr/share/emacs/site-lisp/emacs-goodies-el/color-theme.el")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-hober)))

;;(require 'helm)
