;init.el
;-------------------------
;Nov 2013
;  for Linux/OS X
;       with GNU Emacs 24
;  tested on Ubuntu 13.04 + GNU Emacs 24.3.1
;-------------------------
; place init.el on ~/.emacs.d/
;   * when ~/.emacs.d/ does not exist, mkdir ~/.emacs.d/
;	also $ cd ~/.emacs.d/
;	$ mkdir site-lisp
;	if not yet made
;installed additional packages
; anything
; auto-complete (* M-x anything -> C-x ;)
; molokai-theme
;

; language
(set-language-environment 'Japanese)
; path
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/anything-config")
(add-to-list 'load-path "~/.emacs.d/site-lisp/auto-complete")
;utf-8
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
; font preferences
(when window-system
  (progn
    (set-default-font "Liberation Mono")
    (set-fontset-font (frame-parameter nil 'font)
		      'japanese-jisx0208
		      '("M+2VM+IPAG circle" . "unicode-bmp"))
    ))
; display time
(display-time)
; function name
(which-function-mode 1)
; line num
(global-linum-mode t)
; file name completion igonore caps
(setq completion-ignore-case t)
; hide toolbar
(tool-bar-mode 0)
; hide menubar
(menu-bar-mode 0)
; anything -------------------------
;   installation
;   $ cd ~/.emacs.d/site-lisp/
;   $ git clone git://repo.or.cz/anything-config.git
;   $ cd anything-config
;   $ make
(require 'anything-config)
(setq anything-sources
      (list anything-c-source-buffers
	    anything-c-source-bookmarks
	    anything-c-source-file-name-history
	    anything-c-source-man-pages
	    anything-c-source-calculation-result
	    anything-c-source-emacs-commands
	    anything-c-source-google-suggest
	    ))
(global-set-key (kbd "C-x ;") 'anything)
; auto complete -------------------------
;  installation
;   (I) clone auto-complete
;    $ cd ~/.emacs.d/site-lisp/
;    $ git clone https://github.com/auto-complete/auto-complete.git
;    $ make
;   (II) install dependency (popup.el)
;    $ cd ~/Downloads
;    $ wget https://github.com/auto-complete/popup-el/archive/master.zip
;    $ unzip master.zip
;    $ cd ~/.emacs.d/site-lisp/
;    $ cp ~/Downloads/popup-el-master/popup.el ./
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/auto-complete/dict")
;theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/site-lisp/")
; install download & unzip https://github.com/hbin/molokai-theme
; cp *.el ~/.emacs.d/site-lisp/
(setq molokai-theme-kit t)
(load-theme 'molokai t)
(enable-theme 'molokai)
