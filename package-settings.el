;; Get TextMate addons working.
(textmate-mode)

;; JS mode gets used inside mmm, so we've gotta configure it.
(setq js-indent-level 2)

;; nav-mode
(global-set-key "\C-cn" 'nav-toggle)

;; Let markdown-mode where to look for the binary.
(setq markdown-command "/usr/local/bin/markdown")

;; Set the color mode.
(color-theme-monokai)

;; Rake files are ruby, too, as are gemspecs, rackup files, etc.
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

;; Save our place when we close and reopen files.
(require 'saveplace)
(setq-default save-place t)

;; Uniquify. Sane buffer naming.
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;; Ack
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)

;; Magit
;; from https://github.com/jimeh/.emacs.d/blob/master/keybindings.el
(when (require 'magit nil 'noerror)
  (global-set-key (kbd "C-x g") 'magit-status))
