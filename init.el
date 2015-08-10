
;;;; Package archives
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

;;;; Load essential packages
;;; Icicles
(add-to-list 'load-path "~/.emacs.d/elpa/icicles-20150804.1406")
(require 'icicles)
(icy-mode 1)

;;; LaCarte
(add-to-list 'load-path "~/.emacs.d/elpa/lacarte-20150104.2350")
(require 'lacarte)
(global-set-key [?\e ?\M-x] 'lacarte-execute-command)
(global-set-key [?\M-`]     'lacarte-execute-menu-command)
(global-set-key [f10]       'lacarte-execute-menu-command)

;;; Dired+
(add-to-list 'load-path "~/.emacs.d/elpa/dired+-20150730.1406")
(require 'dired+)
;; Reuse dired buffer
(diredp-toggle-find-file-reuse-dir 1)
;; This is not needed for emacs24.4
(add-to-list 'load-path "~/.emacs.d/extra")
(require 'dired-details)
(dired-details-install)
;; Change some dired keybindings
(add-hook 'dired-mode-hook
          (lambda ()
            ;; use "u" to move to parent directory, use "r" to remove mark
            (local-set-key (kbd "u") 'dired-up-directory)
            (local-set-key (kbd "r") 'dired-unmark)
            ))

;;; Paredit
(add-to-list 'load-path "~/.emacs.d/elpa/paredit-20150217.713")
(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)
(add-hook 'lisp-mode-hook 'enable-paredit-mode)
(add-hook 'emacs-lisp-mode-hook       'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook 'enable-paredit-mode)
(add-hook 'ielm-mode-hook             'enable-paredit-mode)
(add-hook 'lisp-mode-hook             'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'scheme-mode-hook           'enable-paredit-mode)

;;;; Set Appearance
;;; Font
;; The following font is in file ~/elisp/courR18.pcf.gz
;; (set-default-font "-adobe-courier-medium-r-normal--18-180-75-75-m-110-iso8859-1")
;;; Color
(load-theme 'calm-forest t)
(setq color-theme-is-global t)

;;;; House Keeping
;;; Start server
(server-start)
;;; Save sessions
(desktop-save-mode 1)
;;; Use y and n instead of yes and no
(defalias 'yes-or-no-p 'y-or-n-p)

;; Show colume number in the bar
(setq column-number-mode t)
;; Display time in the bar
(display-time)
;; Disable scroll bar
(scroll-bar-mode -1)
;; Show current position as percentage of file
(setq size-indication-mode t)
;; Skip startup message
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
;; Format the title-bar to always include the buffer name
(setq frame-title-format "emacs - %b")
;; Turn off the toolbar
(if (>= emacs-major-version 21)
    (tool-bar-mode -1))
;; Resize the mini-buffer when necessary
(setq resize-minibuffer-mode t)
;; Syntax hilighting
(global-font-lock-mode t)
;; Hilight matching parenthesis
(show-paren-mode t)
;; Turn off the beep
(setq visible-bell t)

;;;; Global Editing Options
;; Use 4 space for tab indent
(setq-default tab-width 4)
;; Use space (not tabs) for indenting
(setq-default indent-tabs-mode nil)
;; Don't save too many kills
(setq kill-ring-max 50)
;; Always write the last line
(setq require-final-newline t)
;; Replace highlighted text with what I type, rather than insert
(delete-selection-mode t)
;; Pgup/dn preserve the curser position in the screen
(setq scroll-preserve-screen-position 1)
;; Set default major mode to be text-mode
(setq default-major-mode 'text-mode)
;; Show trailing whitespaces
(setq-default show-trailing-whitespace t)
;; Indicate empty lines
(setq default-indicate-empty-lines t)
;; cut and copy in and from outside emacs
(global-set-key (kbd "C-w") 'clipboard-kill-region)
(global-set-key (kbd "M-w") 'clipboard-kill-ring-save)
(global-set-key (kbd "C-y") 'clipboard-yank)
;; Global key bindings. Default keybinding "M-g M-g".
(global-set-key (kbd "C-c g") 'goto-line)
(define-key global-map (kbd "RET") 'newline-and-indent)
(define-key global-map (kbd "C-j") 'newline)
;; Toggle trancate lines
(define-key global-map (kbd "C-c t") 'toggle-truncate-lines)
;; Expand word using recent typing
(global-set-key (kbd "C-:") 'dabbrev-expand)
; Delete the current indentation and join to the previous line
(global-set-key "\C-x\d" 'delete-indentation)
;; Delete horizontal spaces
(global-set-key [C-backspace] 'delete-horizontal-space)
;; Start Shell
(global-set-key (kbd "C-c s") 'shell)
;; Making the color right for "ls" command
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;; Register related keys
(global-set-key (kbd "C-x r v") 'view-register)
(global-set-key (kbd "C-x r a") 'append-to-register)
(global-set-key (kbd "C-x r p") 'prepend-to-register)
;; Reload buffer from file
(global-set-key (kbd "<f5>") 'revert-buffer)
;; Compare windows
(global-set-key (kbd "C-M-=") 'compare-windows)

