#!/bin/bash
# cem bozsahin 2023
# The new install does not alter PATH or .bashrc or .bash_profile; no environment variables either
# $1 : Python and pip binary suffixes in case there is more than one binary for them
# brew does not allow sudo anymore-- $SUDO controls that
LOG="=========================================================\nTheBench install and set up, `date`\n=========================================================" # installers can be very verbose, accumulate all deeds to report at end
ULB='/usr/local/bin'
TMPB='/tmp/thebench'
SUDO=sudo
LOGFILE='/tmp/thebench-install.log'
PYSUFF=$1
PY="`command -v python$PYSUFF`"
PIP="`command -v pip$PYSUFF`"
BHOME=`pwd`
if [ -f $ULB/bench ]; then
  echo "You have TheBench installed at: `cat $ULB/bench_home`"
  if [ ! $PYSUFF ]; then   # if empty, it was probably an accidental call
	  echo "There is no need to reinstall. Just do 'git pull' in that directory for the latest."
	  exit -1
  fi
  echo "Continuing to check pip for library updates"
fi
if [ -f $PY ]; then
	if [ -f $PIP ]; then
		$PIP install cl4py
		$PIP install sly
		$PIP install prompt_toolkit
	else
		echo "No $PIP; aborting..."
		exit -1
	fi
else
	echo "No $PY; aborting..."
	exit -1
fi
echo "PLEASE NOTE:"
echo "  In case the installer asks for SUDO PASSWORD"
echo "  It will be for installing the Common Lisp's SBCL through SAFE installers"
echo "  And for making entries to your $ULB for machine-wide access to TheBench"
echo " "
if [ ! -d $ULB ]; then
  LOG+="\n-No $ULB; creating.."
  $SUDO mkdir $ULB
  LOG+="\n-*** Please add $ULB to your PATH variable if not already there"
fi
if [ ! -d $TMPB ]; then
  mkdir $TMPB
  LOG+="\n-$TMPB directory created for temporary files"
fi
labdir=`pwd`
#check if SBCL need installing-- SBCL is the standard  lisp for cl4py module
#there is a pecking order of packagers, in case you have more than one
packager=
install=install
if [ `command -v dnf` ]; then
	packager=dnf
fi
if [ `command -v yum` ]; then
	  packager=yum   
	  # open library space of yum
	  $SUDO yum $install yum-utils
	  $SUDO yum-config-manager --enable \*
fi
if [ `command -v apt-get` ]; then
	packager=apt-get
	# open library space of apt-get and refresh
	$SUDO add-apt-repository universe
	$SUDO apt-get update
fi
if [ `command -v pacman` ]; then
	packager=pacman
	install='-S'
fi
if [ `command -v brew` ]; then
    	packager=brew
	SUDO=
fi
if [ "$packager" ]; then
	LOG+="\n-You have an installer ($packager) for standard packages"
else
	LOG+="\n-apt-get, dnf, pacman, yum or brew not found. I leave Common Lisp handling to you."
fi
if [ ! `command -v sbcl` ]; then
  if [ "$packager" ]; then
	$SUDO $packager $install sbcl
	LOG+="\n-sbcl is downloaded and installed"
  fi
else
  LOG+="\n-Local sbcl is set for tool use"
fi
$SUDO echo "$labdir" > "$ULB/bench_home"
$SUDO echo "python$PYSUFF $labdir/src/bench.py" > "$ULB/bench"
$SUDO chmod ugo+x "$ULB/bench"
$SUDO chmod ugo+r "$ULB/bench_home"
LOG+="\n\n-thebench install: COMPLETED"
LOG+="\n-This log is saved in file $LOGFILE"
LOG+="\n========================================================="
echo -e $LOG > $LOGFILE
echo -e $LOG
