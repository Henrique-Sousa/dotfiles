;; dark mode
(when (display-graphic-p)
  (invert-face 'default)
  )
(set-variable 'frame-background-mode 'dark)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-screen t)

;; font size 12
(set-face-attribute 'default nil :height 120)

;; move #files# and files~ to a temporary folder
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(global-display-line-numbers-mode)

(prefer-coding-system 'utf-8)
