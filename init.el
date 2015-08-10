
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
(add-to-list 'load-path "/home/yanbin/emacsd/elpa/dired+-20150730.1406")
(require 'dired+)
;; Reuse dired buffer
(diredp-toggle-find-file-reuse-dir 1)
;; This is not needed for emacs24.4
(add-to-list 'load-path "/home/yanbin/.emacs.d/extra")
(require 'dired-details)
(dired-details-install)
;; Change some dired keybindings
(add-hook 'dired-mode-hook
          (lambda ()
            ;; use "u" to move to parent directory, use "r" to remove mark
            (local-set-key (kbd "u") 'dired-up-directory)
            (local-set-key (kbd "r") 'dired-unmark)
            ))


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
