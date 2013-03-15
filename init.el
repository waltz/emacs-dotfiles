;; Kick things off with our lovely load path.
(add-to-list 'load-path "~/.emacs.d/")

;; Add a handful of extra-spicy ELPA repositories.
(setq package-archives '(("gnu"       . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa"     . "http://melpa.milkbox.net/packages/")))

;; Load customizations after packages get loaded and init.el has been evaluated.
(add-hook 'after-init-hook #'(lambda () (load "package-settings.el")))

;; highlight the world
(global-font-lock-mode 1)

;; Turn off mouse interface early in startup to avoid momentary display
;; You really don't need these; trust me.
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Load path etc.
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

;; Set the initial frame size.
(add-to-list 'default-frame-alist '(height . 40))
(add-to-list 'default-frame-alist '(width . 140)) 

;; Dear lord, indentation preferences!
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; I hate auto-fill-mode
;; http://stackoverflow.com/questions/1567107/disable-auto-fill-mode-in-noweb-mode/1567431#1567431
(setq auto-fill-mode -1)
(setq-default fill-column 99999)
(setq fill-column 99999)

;; Use a visual bell in place of the audoble bell. Nuke that bonking noise.
(setq visible-bell t)

;; Add the macports binary path so extensions can find all the binzzz
(setq exec-path (append exec-path '("/opt/local/bin")) )

;; Fix forward delete.
;; http://www.praytothemachine.com/evil/2010/09/23/emacs-os-x-and-forward-delete/
(global-set-key [kp-delete] 'delete-char)

;; Set the default font.
(set-face-attribute 'default nil :font "Inconsolata-14")

;; Start the emacs server when we launch emacs.
(server-start)

;; Smooth Scrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 3))) ;; one line at a time
(setq mouse-wheel-follow-mouse 't)                  ;; scroll window under mouse
(setq scroll-step 1)                                ;; keyboard scroll one line at a time
