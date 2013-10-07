#! /bin/bash

emacs_cpath=~/

help()
{
    echo "no help right now"
}

makelink()
{
    if [ -d $1 ];then
	mkdir $emacs_cpath$1
	for file in `ls $1`
	do
	    makelink $1"/"$file
	done
    else
	ln -s `pwd`"/"$1 $emacs_cpath$1
    fi
}
[ -z "$1" ] && help

if [ "$1" = "emacs" ];then
    makelink ".emacs"
    [ $? != 0 ] && echo "ln failed!"
    makelink ".emacs-lisp"
    [ $? != 0 ] && echo "ln failed!"
fi
