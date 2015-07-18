;; Set new keybindings in here

(load "~/.emacs.d/myscripts/indent.el")

;; set global key for indent
(global-set-key (kbd "<f3>") (lambda () (interactive) (full-indent)))

;; set crtl-z to undo, overrrideing suspend-frame
(global-set-key (kbd "C-z") 'undo)
