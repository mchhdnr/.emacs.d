Configuration files for Emacs 24
--------------------------------
simple .emacs.d with
 - Japanese environment support
 - pre-installed anything, auto-complete and a dark theme
 - shell script for quick setup

(C)2013 mchhdnr
mchhdnr@gmail.com

* FILES INCLUDED
   - init.el		Emacs Configuration File
   - install.sh		shell script for install
   - site-lisp/*.el	molokai theme file	
   - readme.txt		this file
   - readme.ja_JP.txt	Japanese Translation

* REQUIREMENTS
Emacs 24
Ubuntu
(* any other distributions than Ubuntu (or Debian), please manually install emacs-mozc package)

(Tested on Emacs24.3.1 on Ubuntu 13.04)

* REQUIRED PACKAGES
 - anything
 - auto-complete
 - popup.el
 - molokai.el
 - emacs-mozc

* LISENSE
- molokai.el is a re-distributed version under GPL lisense
original version can be found here : https://github.com/hbin/molokai-theme
- other packages are not included
you need to install them either by yourself or using install.sh
- install.sh is lisensed under GPL lisense

* INTRODUCTION
 all packages not included within this repository should be installed under ~/.emacs.d/site-lisp/
 running install/install.sh will automatically setup directories and packages
 you might need to
  $ chmod +x install.sh
 to run the shell script
