#!/bin/bash
echo "========================="
echo " emacs package installer"
echo "========================="
echo "Would you like to install? [y/n]"
read YN
if [ $YN = 'y' ]; then
	echo "preparing directory"
else
	exit
fi
val=$(pwd)
echo $val
cd ~
echo -n "checking .emacs.d ..."
if [ -d ~/.emacs.d ] ; then
	echo "ok"
else
	echo "falied"
	mkdir .emacs.d
	if [ $? -ne 0 ] ; then
		echo "failed making new directory"
		exit
	fi
	echo " => made .emacs.d"
fi
cd .emacs.d
echo -n "checking site-lisp ..."
if [ -d site-lisp ] ; then
	echo "ok"
else
	echo "falied"
	mkdir site-lisp
	if [ $? -ne 0 ] ; then
		echo "failed making new directory"
		exit
	fi
	echo " => made site-lisp"
fi
cd site-lisp
echo -n "installing anything..."
if [ -d anything-config ] ; then
	echo "already installed"
else
	git clone git://repo.or.cz/anything-config.git
	cd anything-config
	make
	echo "done"
	cd ../
fi

echo -n "installing auto-complete"
if [ -d auto-complete ] ; then
	echo "already installed"
else
	git clone https://github.com/auto-complete/auto-complete.git
	cd auto-complete
	make
	cd ../
	echo "done"
fi
echo -n "installing popup.el ..."
if [ -e popup.el ] ; then
	echo "already installed"
else
	echo -n "downloading..."
	wget https://github.com/auto-complete/popup-el/archive/master.zip -o /dev/null
	echo "done"
	unzip master.zip
	cp popup-el-master/popup.el ./
	echo "cleaning up"
	rm -r popup-el-master
	rm master.zip
	echo "done"
fi
echo -n "installing init.el ..."
cd ../
FLAG="0"
if [ -e init.el ] ; then
	echo "init.el already exists"
	echo "would you like to replace?"
	echo "original file will be saved as init.el.back [y/n]"
	read YN
	if [ $YN = 'y' ] ; then
		mv init.el init.el.back
		FLAG="1"
	fi
else
	FLAG="1"
fi

if [ FLAG = '1' ] ; then
	cd $RUNDIR
	cp init.el ~/.emacs.d/
	cd ~/.emacs.d/
	echo "done"
else
	echo "skipped copying init.el"
fi

echo -n "copying theme files..."
cd $val
cd site-lisp/
cp molokai* ~/.emacs.d/site-lisp/
echo "done"
echo "installing emacs-mozc, emacs-mozc-bin"
echo " * running sudo apt-get install emacs-mozc emacs-mozc-bin"
sudo apt-get install emacs-mozc emacs-mozc-bin
