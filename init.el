;; .emacs
;; add path to emacs pathsl
(setq load-path (append load-path (list "~/emacs.d")))
(setq load-path (append load-path (list "~/color-theme-6.6.0")))

;; turn on font-lock mode
(global-font-lock-mode t)


(setq backup-directory-alist `(("." . "~/EmacsBackup")))


;; Add keybindings script to init file
(load "~/.emacs.d/myscripts/keybindings.el")


;; programming mode TODO: FIXME:
(add-hook 'prog-mode-hook
               (lambda ()
                (font-lock-add-keywords nil
                 '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))))


;; auto complete
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)


;;set tabs to 2
(setq tab-width 2)

;; I hate tabs!
(setq-default indent-tabs-mode nil)

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)


(setq default-frame-alist
    '((font . "Consolas 10")))

;; menubar off
(tool-bar-mode 0)


;;Delete trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; color theme
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-subtle-hacker)))

;; no welcome s
(setq inhibit-startup-message t)

;;show matching parans
(show-paren-mode 1)


;; default to utf-8
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; disavle narrow to region
(put 'narrow-to-region 'disabled nil)


;; format rust on save
(defun rust-fomat-on-save-hook ()
  (when (eq major-mode 'rust-mode)
    (interactive)
    (shell-command
     (format "rustfmt %s"
             (shell-quote-argument (buffer-file-name))))))



(setq rust-enable-format-on-save t)


;; glsl (shader) mode
(autoload 'glsl-mode "glsl-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.frag\\'" . glsl-mode))
