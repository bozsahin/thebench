#!/bin/bash # cem bozsahin 2023--24 
#  $1 : 'uninstall' 'install' or 'reset' 
#  $2: (when relevant): the python binary
# brew does not allow sudo--$SUDO controls that
BENCH_HOMEP="$HOME/.thebenchhome" # this file will contain the 
                                  # pointer to TheBench in your file system
#first the checks for early exits without action
if [ $# -eq 0 ]; then
	echo "please specify a key action (install, reset, uninstall)"
	echo "  and a python binary if the action requires it."
	echo "exiting without action"
	exit -1
elif [ $1 == install ] && [ $# -lt 2 ]; then
	echo "install requires two arguments: the key action and the python binary"
	echo "exiting without action"
	exit -1
elif [ $1 == reset ] && [ $# -lt 2 ]; then
	echo "reset requires two arguments: the key action and the python binary"
	echo "exiting without action"
	exit -1
elif [ $1 == uninstall ]; then
	if [ ! -e $BENCH_HOMEP] || [ ! -e "`cat $BENCH_HOMEP`" ] ; then
		echo "Nothing to uninstall"
		echo "exiting without action"
		exit 0
	fi
fi
THEBENCHPYTHON=$2
which $2 2> /dev/null || NOPY=TRUE
if [ ! $1 == uninstall ] && [ $NOPY ]; then
	echo "$THEBENCHPYTHON executable does not exist"
	echo "exiting without action"
	exit -1
fi
if [ ! $1 == uninstall ] && [ ! -x `which $THEBENCHPYTHON` ]; then
	echo "$THEBENCHPYTHON is not executable"
	echo "exiting without action"
	exit -1
fi
# from now on we have legit action specified
BHF="`cat $BENCH_HOMEP`" # The directory pointed by BENCH_HOMEP
cd $HOME # to avoid deleting current folder	
if [ $1 == uninstall ]; then
	if  [ -d $BHF ] && [ ! $BHF == $HOME ]; then
      		echo "Removing $BHF"
		rm -fr $BHF
		rm $BENCH_HOMEP
		rm $HOME/.thebenchhistory
	fi
	if [ -d "/var/tmp/thebench" ]; then
  		echo "Removing /var/tmp/thebench"
  		rm -fr /var/tmp/thebench
	fi
	echo "Uninstall completed."
	exit 0
fi
if [ $1 == reset ]; then
	$THEBENCHPYTHON -m ensurepip    # every python has its own pip and libraries
	$THEBENCHPYTHON -m pip install --upgrade pip  # who knows
	$THEBENCHPYTHON	-m pip install cl4py
	$THEBENCHPYTHON -m pip install sly
        $THEBENCHPYTHON -m pip install prompt_toolkit
	echo "TheBench is reset to use $THEBENCHPYTHON"
	exit 0
fi
# If we've come this far, we are installing
ULB='/usr/local/bin' # This is where the bench binary goes --no more .bashrc invasion
TMPB='/var/tmp/thebench'
SUDO=sudo
LOGFILE='thebench-install.log'
LOG="=========================================================\nTheBench install and set up, `date`\n=========================================================" # installers can be very verbose, accumulate all deeds to report at end
if [ $1 == install ]; then
	if [ -e $BHF ]; then
		echo "You have TheBench installed at: $BHF"
  		echo "There is no need to reinstall. Just do 'git pull' in that directory for the latest."
		echo "If you intend to change the python for the tool, run the installer as './bench.sh reset some-python'"
  		exit 0  # this is not an error
	fi
	echo "\n**** PLEASE NOTE: ****\n"
	echo "  In case the installer asks for SUDO PASSWORD"
	echo "    It will be ONLY for 1) installing the Common Lisp's SBCL through SAFE installers" 
        echo "                        2) opening libraries of the package managers for a more comprehensive search"
        echo '                        3) putting the bench binary in /usr/local/bin'
	echo ""
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
	chmod ug+r "$BHF"
	chmod ug+x "$BHF/bench.sh"
	$THEBENCHPYTHON -m ensurepip    # every python has its own pip and libraries
	$THEBENCHPYTHON -m pip install --upgrade pip  # who knows
	$THEBENCHPYTHON	-m pip install cl4py
	$THEBENCHPYTHON -m pip install sly
        $THEBENCHPYTHON -m pip install prompt_toolkit
	echo -e $LOG > $LOGFILE
	echo -e $LOG
	if [ ! -d $ULB ]; then
		LOG+="\n-There is no $ULB in your system; creating one..."
                LOG+="\n-Here is your PATH variable's contents: $PATH"
                LOG+="\n-If $ULB is not in it, add it at the end, separating it with ':'"
                LOG+="\n-It is usually set in the .bashrc file in your home directory."
                sudo mkdir $ULB
	else
                LOG+="\n-Here is your PATH variable's contents: $PATH"
                LOG+="\n-If $ULB is not in it, add it at the end, separating it with ':'"
                LOG+="\n-It is usually set in the .bashrc file in your home directory."
        fi
	sudo chmod ug+rwx $ULB
	sudo cat "$THEBENCHPYTHON $BHF/src/bench.py" > $ULB/bench
        sudo chmod ugo+x $ULB/bench
	LOG+="\n\n-thebench install: COMPLETED"
	LOG+="\n-This log is saved in file $LOGFILE"
        LOG+="\n-PLEASE CHECK IT IF THE INSTALLER ASKED FOR SOME ADDITIONAL ACTION"
	LOG+="\n========================================================="
       	exit 0
else
	echo "Unknown action. Exiting without action"
	exit 0
fi
