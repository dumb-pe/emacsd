;;;; House Keeping
;;; Start server
(server-start)
;;; Save sessions
(desktop-save-mode 1)
;;; Use y and n instead of yes and no
(defalias 'yes-or-no-p 'y-or-n-p)

;;;; Set Appearance
;;; Font
;; The following font is in file ~/elisp/courR18.pcf.gz
;; (set-default-font "-adobe-courier-medium-r-normal--18-180-75-75-m-110-iso8859-1")
;;; Color
;; (require 'color-theme)
;; (setq color-theme-is-global t)
;; (color-theme-calm-forest)
(load-theme 'calm-forest t)
(setq color-theme-is-global t)

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
