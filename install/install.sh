#!/bin/sh
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
cd ~
echo -n "checking .emacs.d ..."
if [ -d .emacs.d ] ; then
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
fi

echo -n "installing auto-complete"
if [ -d auto-complete ] ; then
	echo "already installed"
else
	git clone https://github.com/auto-complete/auto-complete.git
	make
	echo "done"
fi
echo -n "installing popup.el ..."
if [ -e popup.el ] ; then
	echo "already installed"
else
	echo -n "\ndownloading..."
	wget https://github.com/auto-complete/popup-el/archive/master.zip
	echo "done"
	unzip master.zip
	cp popup-el-master/popup.el ./
	echo "cleaning up"
	rm -r popup-el-master
	rm master.zip
	echo "done"
fi

