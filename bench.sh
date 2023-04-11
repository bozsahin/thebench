#!/bin/bash
# cem bozsahin 2023
# $1 : 'uninstall' 'install' or Python and pip binary suffix in case there is more than one binary for them
# brew does not allow sudo--$SUDO controls that
if [ $# -eq 0 ]; then
	echo "please specify 'install', 'uninstall' or python/pip version number"
	echo "exiting without action"
	exit -1
fi
if [ $1 == uninstall ]; then
	BENCH_HOME="`cat $HOME/.thebenchhome`"
	cd $HOME
	if [ -d $BENCH_HOME ] && [ $BENCH_HOME != $HOME ]; then
  		echo "Removing $BENCH_HOME"
  		rm -fr $BENCH_HOME
	fi
	if [ -d "/var/tmp/thebench" ]; then
  		echo "Removing /var/tmp/thebench"
  		rm -fr /var/tmp/thebench
	fi
	echo "Removing thebench files from $HOME"
	rm $HOME/.thebenchhome
	rm $HOME/.thebenchhistory
	rm $HOME/bin/bench.train
	rm $HOME/bin/bench
	echo "Uninstall completed."
	exit 0
fi
LOG="=========================================================\nTheBench install and set up, `date`\n=========================================================" # installers can be very verbose, accumulate all deeds to report at end
ULB="$HOME/bin"
ULL=$HOME
BHF="$ULL/.thebenchhome" # thebench home path resides in this file
TMPB='/var/tmp/thebench'
SUDO=sudo
LOGFILE='/var/tmp/thebench-install.log'
labdir=`pwd`
if [ $1 == install ]; then
	if [ -f $ULB/bench ]; then
		echo "You have TheBench installed at: `cat $BHF`"
  		echo "There is no need to reinstall. Just do 'git pull' in that directory for the latest."
  		exit -1
	fi
	echo " "
	echo "**** PLEASE NOTE: ****"
	echo " "
	echo "  In case the installer asks for SUDO PASSWORD"
	echo "  It will be ONLY for installing the Common Lisp's SBCL through SAFE installers"
	echo "  and for opening libraries of the package managers for a more comprehensive search"
	echo " "
	if [ ! -d $ULB ]; then
  		LOG+="\n-No $ULB; creating.."
  		mkdir $ULB
	fi
	if [ ! -d $TMPB ]; then
  		mkdir $TMPB
  		LOG+="\n-$TMPB directory created for temporary files"
	fi
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
	echo "$labdir" | tee "$BHF"
	ln -s $labdir/src/bench.train.sh $ULB/bench.train
	echo "python $labdir/src/bench.py" | tee "$ULB/bench"
	chmod ugo+x "$ULB/bench"
	chmod ugo+r "$BHF"
	chmod ugo+x "$ULB/bench.train"
	LOG+="\n\n-thebench install: COMPLETED"
	LOG+="\n-This log is saved in file $LOGFILE"
	LOG+="\n========================================================="
	echo -e $LOG > $LOGFILE
	echo -e $LOG
	# and now for some .bashrc managament tucked at the very end of .bashrc
	printf '%s\n' '# stuff added by thebench installer (and to make PATH unique--kudos to Mitch Frazier)' >> $HOME/.bashrc
	printf 'PATH=$HOME/bin:$PATH' >> $HOME/.bashrc
	printf '%s\n' 'PATH=$(echo -n $PATH | awk -v RS=: -v ORS=: '"'"'!($0 in a) {a[$0]; print}'"'"')' >> $HOME/.bashrc
	printf '%s\n' '# end of stuff added by thebench installer' >> $HOME/.bashrc
	source $HOME/.bashrc
       	exit 0
fi
PYSUFF=$1
PY="`command -v python$PYSUFF`"
PIP="`command -v pip$PYSUFF`"
if [ -f $PY ]; then
	if [ -f $PIP ]; then
		$PIP install cl4py
		$PIP install sly
		$PIP install prompt_toolkit
	else
		echo "No $PIP; aborting..."
		exit -1
	fi
	echo "python$PYSUFF $labdir/src/bench.py" | tee "$ULB/bench"
	chmod ugo+x "$ULB/bench"
else
	echo "No $PY; aborting..."
	exit -1
fi
