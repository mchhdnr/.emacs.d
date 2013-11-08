;load-path
(add-to-list 'load-path "~/emacs.d/site-lisp")

;enable font-lock
(when(fboundp 'global-font-lock-mode)(global-font-lock-mode t))
(setq font-lock-maximum-decoration t)

;use UTF-8
(coding-system-put 'utf-8 'category 'utf-8)
(set-language-info "Japanese" 'coding-priority(cons 'utf-8(get-language-info "Japanese" 'coding-priority)))
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)

; highlight selected region
(transient-mark-mode t)

;use bash
(setq explicit-shell-file-name "/bin/bash") 
(setq shell-file-name "/bin/bash")
(setq shell-command-switch "-c")

;hide inputting password
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

;handle escape sequences
(autoload 'ansi-color-for-comint-mode-on "ansi-color"
          "Set `ansi-color-for-comint-mode' to t." t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;use UTF-8
(add-hook 'shell-mode-hook(lambda()(set-buffer-process-coding-system 'utf-8 'utf-8)))

;adjust window size
(setq default-frame-alist (append (list
	'(width . 80)
	'(height . 50))
	default-frame-alist))
;toolbar
(tool-bar-mode 0)

(show-paren-mode 1)
(menu-bar-mode 0)

;time
(display-time)
;function name
(which-function-mode 1)

;font
(when window-system
  (progn
    (set-default-font "Liberation Mono")
    (set-fontset-font (frame-parameter nil 'font)
                      'japanese-jisx0208
                      '("M+2VM+IPAG circle" . "unicode-bmp"))))

;theme
(load-theme 'molokai t)
(enable-theme 'molokai)

;auto-install
;(when(require 'auto-install nil t)
;  	(setq auto-install-directory "~/emacs.d/site-lisp")
;	(auto-install-update-emacswiki-package-name t)
;	(auto-install-compatibility-setup))

(require 'package)
(add-to-list 'package-archives '("melpa"."http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade"."http://marmalade-repo.org/packages/"))
(package-initialize)

;auto complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20130330.1836/dict/")
(ac-config-default)

;anything
(require 'anything-config)
(setq anything-sources
      (list anything-c-source-buffers
	    anything-c-source-bookmarks
	    anything-c-source-file-name-history
	    anything-c-source-man-pages
	    anything-c-source-info-pages
	    anything-c-source-calculation-result
	    anything-c-source-locate
	    anything-c-source-emacs-commands
	    anything-c-source-google-suggest
	    ))

;linum
(global-linum-mode t)
;file name
(setq completion-ignore-case t)
;anything key
(global-set-key (kbd "C-x ;") 'anything)
