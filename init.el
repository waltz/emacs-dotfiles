;;; init.el --- Where all the magic begins
;;
;; Part of the Emacs Starter Kit
;;
;; This is the first thing to get loaded.
;;
;; "Emacs outshines all other editing software in approximately the
;; same way that the noonday sun does the stars. It is not just bigger
;; and brighter; it simply makes everything else vanish."
;; -Neal Stephenson, "In the Beginning was the Command Line"

;; Turn off mouse interface early in startup to avoid momentary display
;; You really don't need these; trust me.
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Load path etc.

;; (setq dotfiles-dir (file-name-directory
;;                     (or (buffer-file-name) load-file-name)))

;; Load up ELPA, the package manager
;; (require 'package)
;; (add-to-list 'load-path dotfiles-dir)
;; (add-to-list 'load-path (concat dotfiles-dir "/elpa-to-submit"))
;; (setq autoload-file (concat dotfiles-dir "loaddefs.el"))
;; (setq package-user-dir (concat dotfiles-dir "elpa"))
;; (setq custom-file (concat dotfiles-dir "custom.el"))
;; (package-initialize)
;; (require 'starter-kit-elpa)

;; These should be loaded on startup rather than autoloaded on demand
;; since they are likely to be used in every session

;; (require 'cl)
(require 'saveplace)
;; (require 'ffap)
(require 'uniquify)
;; (require 'ansi-color)
;; (require 'recentf)

;; backport some functionality to Emacs 22 if needed
;; (require 'dominating-file)

;; Load up starter kit customizations

;; (require 'starter-kit-defuns)
;; (require 'starter-kit-bindings)
;; (require 'starter-kit-misc)
;; (require 'starter-kit-registers)
;; (require 'starter-kit-eshell)
;; (require 'starter-kit-lisp)
;; (require 'starter-kit-perl)
(require 'starter-kit-ruby)
;; (require 'starter-kit-js)

;; (regen-autoloads)
;; (load custom-file 'noerror)

;; Rinari. Tasty Rails goodness.
(add-to-list 'load-path "~/.emacs.d/vendor/rinari")
(require 'rinari)

;; Dear lord, indentation preferences!
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; Add the macports binary path so extensions can find all the binzzz
(setq exec-path (append exec-path '("/opt/local/bin")) )

;; Tell markdown-mode to use the binary provided by the markdown gem.
(setq markdown-command "markdown")

;; A ring of rings of rings of buffers.
(load "~/.emacs.d/vendor/dynamic-ring.el")
(load "~/.emacs.d/vendor/buffer-ring.el")
(require 'buffer-ring)

;; nXhtml for sweet sweet web editing.
(add-to-list 'load-path "~/.emacs.d/vendor/nxhtml")
(load "~/.emacs.d/vendor/nxhtml/autostart.el")
(setq mumamo-background-colors nil)

;; js2-mode
(add-to-list 'load-path "~/.emacs.d/vendor/js2-mode")
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; (setq-default js2-consistent-level-indent-inner-bracket-p 1)
;; (setq-default js2-pretty-multiline-decl-indentation-p 1)

;; Load prefs.
;;(setq custom-file "~/.emacs.d/custom.el")
;;(load custom-file)

;; AAAACK
(add-to-list 'load-path "~/.emacs.d/vendor/full-ack")
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)

;; Nav!
(add-to-list 'load-path "/Users/cbryan/.emacs.d/nav")
(global-set-key "\C-cn" 'nav-toggle)

;; Pull in color-theme.
(require 'color-theme)
(load-file "~/.emacs.d/themes/color-theme-almost-monokai.el")
(color-theme-almost-monokai)

;; Fix forward delete.
;; http://www.praytothemachine.com/evil/2010/09/23/emacs-os-x-and-forward-delete/
(global-set-key [kp-delete] 'delete-char)

;; Set the default font.
(set-face-attribute 'default nil :font "Inconsolata-14")

;; text-mate like project bar
(add-to-list 'load-path "~/.emacs.d/nav")
(require 'nav)

;; TextMate adapter junk.
(load-file "~/.emacs.d/vendor/textmate.el")
(require 'textmate)
(textmate-mode)

;; Start the emacs server when we launch emacs.
(server-start)

;; Smooth Scrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 3))) ;; one line at a time
;; (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; HAML + SASS
(load-file "~/.emacs.d/vendor/haml-mode/haml-mode.el")
(require 'haml-mode)
(load-file "~/.emacs.d/vendor/sass-mode/sass-mode.el")
(require 'sass-mode)

;; Magit
;; from https://github.com/jimeh/.emacs.d/blob/master/keybindings.el
(when (require 'magit nil 'noerror)
  (global-set-key (kbd "C-x g") 'magit-status))

;; I hate auto-fill-mode
;; http://stackoverflow.com/questions/1567107/disable-auto-fill-mode-in-noweb-mode/1567431#1567431
(setq auto-fill-mode -1)
(setq-default fill-column 99999)
(setq fill-column 99999)
