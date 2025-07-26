#!/bin/bash 
# cem bozsahin 2025 -- to install, reset and remove thebench
#  $1 : 'uninstall' 'install' 'INSTALL' or 'reset' 
#  $2: (when relevant): the python binary
#  $3: (when relevant): the pip binary
THEBENCHCOMMAND=$1
THEBENCHPYTHON=$2
THEBENCHPIP=$3
BENCH_HOMEP="$HOME/.thebenchhome" # this file will contain the 
                                  # pointer to TheBench in your file system
BENCH_HISTORY="$HOME/.thebenchhistory" # py saves commands in it internally
BHF=`pwd` # the dir to be pointed by BENCH_HOMEP;
ULB="$HOME/.local/bin" # where thebench binary goes -- we dont need sudo for this
UL="$HOME/.local"      # where the local sbcl and its repo goes
BENCHBIN='thebench'  # this is the name of the binary 'bench' is shorter but it might name-collide
TMPB='/var/tmp/thebench'  # where the temporary files of analysis and training go
NOPY=
NOPIP=
SUDO=sudo
command -v $THEBENCHPYTHON 2> /dev/null || NOPY=TRUE
command -v $THEBENCHPIP 2> /dev/null || NOPIP=TRUE
LOGFILE='/var/tmp/thebench-install.log' # to avoid .gitignore in repo directory
LOG="=========================================================\nTheBench install and set up, `date`\n========================================================="
echo " "
echo "TheBench setup tool begins.."
echo " "
#First the checks for early exits without action 
 
if [ $# -eq 0 ]; then
	echo "please specify a key action (install, reset, uninstall)"
	echo "  and a python binary if the action requires it."
	echo "exiting without action"
	exit -1
elif [ $THEBENCHCOMMAND == install ] && [ $# -lt 2 ]; then
	echo "install requires two arguments: the key action and the python binary"
	echo "exiting without action"
	exit -1
elif [ $THEBENCHCOMMAND == INSTALL ] && [ $# -lt 2 ]; then
	echo "INSTALL requires two arguments: the key action and the python binary"
	echo "exiting without action"
	exit -1
elif [ $THEBENCHCOMMAND == reset ] && [ $# -lt 2 ]; then
	echo "reset requires two arguments: the key action and the python binary"
	echo "exiting without action"
	exit -1
elif [ $THEBENCHCOMMAND == uninstall ]; then
	if [ ! -e $BENCH_HOMEP ] || [ ! -e "`cat $BENCH_HOMEP`" ] ; then
		echo "Nothing to uninstall"
		echo "exiting without action"
		exit 0
	fi
fi
if [ ! $THEBENCHCOMMAND == uninstall ] && [ $NOPY ]; then
	echo "$THEBENCHPYTHON executable does not exist"
	echo "exiting without action"
	exit -1
fi
if [ ! $THEBENCHCOMMAND == uninstall ] && [ $NOPIP ]; then
	echo "$THEBENCHPIP executable does not exist"
	echo "exiting without action"
	exit -1
fi
if [ ! $THEBENCHCOMMAND == uninstall ] && [ ! -x `command -v $THEBENCHPYTHON` ]; then
	echo "$THEBENCHPYTHON is not executable"
	echo "exiting without action"
	exit -1
fi
if [ ! $THEBENCHCOMMAND == uninstall ] && [ ! -x `command -v $THEBENCHPIP` ]; then
	echo "$THEBENCHPIP is not executable"
	echo "exiting without action"
	exit -1
fi

# From now on we have legitimate action specified.
# uninstall needs git, reset needs python and pip, and install needs python, git and pip

if [ ! -x `command -v git` ]; then
	echo "You don't have git, or it is not executable"
	echo "  exiting without action"
	exit -1
fi
if [ $THEBENCHCOMMAND == uninstall ]; then
	BHF="`cat $BENCH_HOMEP`" # The directory pointed by BENCH_HOMEP
	if  [ -d $BHF ] && [ ! $BHF == $HOME ]; then
		echo "Uninstalling $BHF directory by deleting tracked (official thebench) files in it."
		echo "  There may be personal files left in $BHF; if not, you can delete that directory now."
                echo "Deleting $BENCHBIN executable, pointers to it and $BENCHBIN command history."
                echo "I leave uninstall of git, pip and python to you."
                cd $BHF
                git ls-files -z | xargs -0 rm -fr
		rm $BENCH_HOMEP
		rm $BENCH_HISTORY 
                rm $ULB/$BENCHBIN 
	fi
	if [ -d $TMPB ]; then
  		echo "Removing $TMPB"
  		rm -fr $TMPB
	fi
	echo "Uninstall completed."
	exit 0
fi

# from now on we are adding/changing stuff in .local and .local/bin; we also need python and pip
#
if [ ! -d $UL ]; then
	LOG+="\n-There is no $UL in your system; creating one..."
        mkdir $UL
        chmod u+rwx $UL
fi
if [ ! -d $ULB ]; then
	LOG+="\n-There is no $ULB in your system; creating one..."
        mkdir $ULB
        chmod u+rwx $ULB
fi
if [ $THEBENCHCOMMAND == reset ]; then
	$THEBENCHPIP install cl4py
	$THEBENCHPIP install sly
        $THEBENCHPIP install prompt_toolkit
	echo "$THEBENCHPYTHON $BHF/src/bench.py" | tee "$ULB/$BENCHBIN" 
	echo $LOG
	echo "TheBench binary thebench is set to execute: `cat $ULB/$BENCHBIN`"
	echo "TheBench is reset to use $THEBENCHPYTHON"
	chmod u+x $ULB/$BENCHBIN
	exit 0
fi

# If we've come this far, we are installing
#
if [ $THEBENCHCOMMAND == install ] || [ $THEBENCHCOMMAND == INSTALL ]; then
	if [ -e $BENCH_HOMEP ]; then
		echo "You have TheBench installed at: `cat $BENCH_HOMEP`"
  		echo "There is no need to reinstall. Just do 'git pull' in that directory for the latest."
		echo "If you intend to change the python for the tool, run the installer with reset option."
  		exit 0  # this is not an error
	fi
	if [ ! -d $TMPB ]; then
  		mkdir $TMPB   # we dont need sudo for this
  		LOG+="\n-$TMPB directory created for temporary files"
	fi
	if [ ! `command -v sbcl` ] && [ $THEBENCHCOMMAND == install ]; then
		echo "Please install SBCL before installing TheBench"
                echo "Or use the INSTALL option, with upper case"
		echo "check out the README.md in the repository for that"
		echo "Exiting without install"
		exit -1
	fi
	cd $BHF
	$THEBENCHPIP install cl4py
	$THEBENCHPIP install sly
        $THEBENCHPIP install prompt_toolkit
	LOG+="\n-Three $THEBENCHPYTHON libraries set for TheBench use: cl4py, sly, prompt_toolkit"
	echo "$THEBENCHPYTHON $BHF/src/bench.py" | tee "$ULB/$BENCHBIN" 
	LOG+="\n-TheBench binary thebench is set to execute: `cat $ULB/$BENCHBIN`"
        chmod ugo+x "$ULB/$BENCHBIN"  # to call bench from anywhere
	echo "`pwd`" > $BENCH_HOMEP   # repo pointer saved at home dir as a dot file
	echo "" > $BENCH_HISTORY      # command history saved at home dir as a 
	                              #     dot file (py refers to it internally)
	chmod u+rw $BENCH_HISTORY
	chmod u+rw $BENCH_HOMEP
	chmod u+x  $BHF/bench.sh          # just in case download loses priviledges
	chmod u+rx $BHF/src/bench.train.sh 
	chmod u+rx $BHF/src/bench.py
	chmod u+r  $BHF/src/bench.lisp
	chmod u+r  $BHF/src/bench.user.lisp
	if [ $THEBENCHCOMMAND == INSTALL ] && [ ! `command -v sbcl` ]; then    # look for package managers
                packager=
                install=install
                if [ `command -v dnf` ]; then
                        packager=dnf
                fi
                if [ `command -v yum` ]; then
                        packager=yum
                        $SUDO yum makecache  # updates the database
                        install="-y install"
                fi
                if [ `command -v apt-get` ]; then
                        packager=apt-get
                        # open library space of apt-get and refresh
                        $SUDO add-apt-repository universe
                        $SUDO apt-get update
                fi
                if [ `command -v pamac` ]; then
                        packager=pamac
                fi
                if [ `command -v brew` ]; then
                        packager=brew
                        SUDO=                        # brew cannae sudo
                fi
                if [ "$packager" ]; then
                        LOG+="\n-You have an installer ($packager) for standard packages"
                        $SUDO $packager $install sbcl
                        LOG+="\n-sbcl is downloaded and installed"
                else
                        LOG+="\n-apt-get, dnf, pamac, yum or brew not found. I leave Common Lisp handling to you."
                        LOG+="\n-Please have a look at README.md in the repo for that."
                fi

	fi
	LOG+="\n\n-thebench install: COMPLETED"
	LOG+="\n-The log is saved in file $LOGFILE"
	echo "The log is saved in file $LOGFILE"
	LOG+="\n========================================================="
	echo -e $LOG > $LOGFILE
	echo -e $LOG
       	exit 0
else
	echo "Unknown action. Exiting without action"
	exit -1
fi
