(prefer-coding-system 'utf-8)


;;(setq-default indent-tabs-mode nil)
;;(setq-default tab-width 4)
;;(setq-default tab-always-indent nil)
;;(setq indent-line-function 'insert-tab)


(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; dark mode
;; (when (display-graphic-p)
;;   (invert-face 'default)
;;   )
;; (set-variable 'frame-background-mode 'dark)

;;(load-theme 'manoj-dark' t)
(load-theme 'modus-vivendi' t)
;;(load-theme 'tsdh-dark' t)
;;(load-theme 'wheatgrass' t)

;; font size 12
(set-face-attribute 'default nil :height 120)

;; display line numbers in the text area, before each line
(global-display-line-numbers-mode)

;; highlight the current line
(global-hl-line-mode)

;; ruler at column 80
(setq-default fill-column 79)
(global-display-fill-column-indicator-mode 1)

;; display the current line and column number 
(setq line-number-mode t)
(setq column-number-mode t)


;; move #files# and files~ to a temporary folder
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
