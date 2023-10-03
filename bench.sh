#!/bin/bash
# cem bozsahin 2023
# $1 : 'uninstall' 'install' 'reset' $2: (if relevant): the python binary
# brew does not allow sudo--$SUDO controls that
HO=~ # home
if [ $# -eq 0 ]; then
	echo "please specify 'install', 'uninstall' (and python executable if you are installing)"
	echo "exiting without action"
	exit -1
elif [ $1 == install ] && [ $# -lt 2 ]; then
	echo "You need to specify a python for use"
	echo "exiting without action"
	exit -1
elif [ $1 == reset ] && [ $# -lt 2 ]; then
	echo "You need to specify a python for use"
	echo "exiting without action"
	exit -1
elif [ $1 == uninstall ]; then
	BENCH_HOME="`cat $HO/.thebenchhome`"
	cd $HO
	if [ -d $BENCH_HOME ] && [ $BENCH_HOME != $HO ]; then
  		echo "Removing $BENCH_HOME"
  		rm -fr $BENCH_HOME
	fi
	if [ -d "/var/tmp/thebench" ]; then
  		echo "Removing /var/tmp/thebench"
  		rm -fr /var/tmp/thebench
	fi
	echo "Removing thebench files from $HO"
	rm $HO/.thebenchhome
	rm $HO/.thebenchhistory
	echo "Uninstall completed."
	echo "Please clear your $HO/.bashrc file off the two bench alises."
	exit 0
else
	THEBENCHPYTHON=$2
fi
which $2 2> /dev/null || NOPY=TRUE
if [ $NOPY ]; then
	echo "$THEBENCHPYTHON executable does not exist"
	echo "exiting without action"
	exit -1
fi
if [ ! -x `which $THEBENCHPYTHON` ]; then
	echo "You designate $THEBENCHPYTHON as python but it is not executable"
	echo "exiting without action"
	exit -1
fi
BHF="$HO/.thebenchhome" # thebench home path resides in this file
labdir=`pwd`
if [ $1 == reset ]; then
	echo "$labdir" | tee "$BHF"
	chmod ug+r "$BHF"
	$THEBENCHPYTHON -m ensurepip    # every python has its own pip and libraries
	$THEBENCHPYTHON -m pip install --upgrade pip  # who knows
	$THEBENCHPYTHON	-m pip install cl4py
	$THEBENCHPYTHON -m pip install sly
        $THEBENCHPYTHON -m pip install prompt_toolkit
	# and now for some .bashrc managament tucked at the very end of .bashrc
	printf '%s\n' '# stuff added by thebench resetter' >> $HO/.bashrc
	printf '%s\n' "alias bench='$THEBENCHPYTHON $labdir/src/bench.py'" >> $HO/.bashrc
	printf '%s\n' '# end of stuff added by thebench resetter' >> $HO/.bashrc
	echo "TheBench is set to use $THEBENCHPYTHON"
	bash # to reactivate alises
	exit 0
fi
# If we've come this far, we are installing
TMPB='/var/tmp/thebench'
SUDO=sudo
LOGFILE='/var/tmp/thebench-install.log'
LOG="=========================================================\nTheBench install and set up, `date`\n=========================================================" # installers can be very verbose, accumulate all deeds to report at end
if [ $1 == install ]; then
	if [ -e $BHF ]; then
		echo "You have TheBench installed at: `cat $BHF`"
  		echo "There is no need to reinstall. Just do 'git pull' in that directory for the latest."
		echo "If you intend to change the python for the tool, run the installer as './bench.sh reset some-python'"
  		exit 0  # this is not an error
	fi
	echo " "
	echo "**** PLEASE NOTE: ****"
	echo " "
	echo "  In case the installer asks for SUDO PASSWORD"
	echo "  It will be ONLY for installing the Common Lisp's SBCL through SAFE installers"
	echo "  and for opening libraries of the package managers for a more comprehensive search"
	echo " "
	if [ ! -d $TMPB ]; then
  		mkdir $TMPB
  		LOG+="\n-$TMPB directory created for temporary files"
	fi
	#check if SBCL need installing-- SBCL is the standard  lisp for cl4py module
	#there is a pecking order of packagers, in case you have more than one
	if [ ! `command -v sbcl` ]; then
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
			$SUDO $packager $install sbcl
			LOG+="\n-sbcl is downloaded and installed"
		else
			LOG+="\n-apt-get, dnf, pacman, yum or brew not found. I leave Common Lisp handling to you."
		fi
	else
  		LOG+="\n-Local sbcl is set for tool use"
	fi
	echo "$labdir" | tee "$BHF"
	chmod ug+r "$BHF"
	$THEBENCHPYTHON -m ensurepip    # every python has its own pip and libraries
	$THEBENCHPYTHON -m pip install --upgrade pip  # who knows
	$THEBENCHPYTHON	-m pip install cl4py
	$THEBENCHPYTHON -m pip install sly
        $THEBENCHPYTHON -m pip install prompt_toolkit
	LOG+="\n\n-thebench install: COMPLETED"
	LOG+="\n-This log is saved in file $LOGFILE"
	LOG+="\n========================================================="
	echo -e $LOG > $LOGFILE
	echo -e $LOG
	# and now for some .bashrc managament tucked at the very end of .bashrc
	printf '%s\n' '# stuff added by thebench installer' >> $HO/.bashrc
	printf '%s\n' "alias bench='$THEBENCHPYTHON $labdir/src/bench.py'" >> $HO/.bashrc
	printf '%s\n' "alias bench.train='$labdir/src/bench.train.sh'" >> $HO/.bashrc
	printf '%s\n' '# end of stuff added by thebench installer' >> $HO/.bashrc
	bash # to reactivate aliases
       	exit 0
fi
