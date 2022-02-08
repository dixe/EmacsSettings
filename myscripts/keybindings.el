;; Set new keybindings in here

;; Load files

;; Functions

(defun full-indent ()
  (indent-region (point-min) (point-max)))

(defun copy-all ()
  "Run 'mark buffer (C-x h), copy region (M-w)"
  (interactive)
  (message "Copied everything")
  (clipboard-kill-ring-save (point-min) (point-max)))

(defun copy-line ()
  "Run 'mark buffer (C-x h), copy region (M-w)"
  (interactive)
  (message "Copied line")
  (clipboard-kill-ring-save  (line-beginning-position) (line-end-position)))



;; Keybindings


;; new keybindings;;
(global-set-key (kbd "M-c") 'quick-calc) ;; meta- c
(global-set-key(kbd "C-x F") 'find-file-other-window) ;; find file other windows
(global-set-key (kbd "C-+") 'text-scale-increase) ;; con - +
(global-set-key (kbd "C--") 'text-scale-decrease) ;; con- -
(global-set-key (kbd "C-s") 'isearch-forward-regexp) ;; regex serch as default
(global-set-key (kbd "C-r") 'isearch-backward-regexp) ;; con- r
(global-set-key (kbd "<f6>") (lambda () (interactive) (full-indent)))
(global-set-key [f12] 'explorer) ;; f12 to open file in explorer
(global-set-key (kbd "C-z") 'undo) ;; onverride suspend frame for undo
(global-set-key (kbd "C-q") 'copy-all) ;; quick copy buffer
(global-set-key (kbd "C-c C-c") 'copy-line) ;; quick copy line
