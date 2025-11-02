#!/bin/bash 
# cem bozsahin 2025
BENCH_HOMEP="$HOME/.thebenchhome" # this file will contain the pointer to TheBench repo in full path
BENCH_HISTORY="$HOME/.thebenchhistory" # bench.py will save commands in it internally
BENCHBIN='thebench'  # this is the name of the binary; 'bench' is shorter but its name collides
TMPB='/var/tmp/thebench'  # where the temporary files of analysis and training go
PY="3.11"                 # specific python for thebench
LOGFILE='/var/tmp/thebench-install.log' # goes there to avoid .gitignore in repo directory
if [[ "$1" == "newbie" || "$1" == "Newbie" || "$1" == "NEWBIE" ]]; then
	echo "newbie install\n"
elif [[ ! -n "$1" ]]; then
	echo "Unknown install type, exiting without install\n"
	exit -1
fi
LOG="========================================================="
LOG+="\nTheBench install and set up `date`"
LOG+="\n======================================================="
LOG+="\nChecking/installing install requirements"
echo ""
echo "**You may be asked for sudo password"
echo ""
echo ""
packager=
install=install
SUDO=sudo  # for Python, SBCL, curl, git install, if need be
if [[ `command -v yum` ]]; then
       packager=yum
       $SUDO yum makecache  # updates the database
       install="-y install"
fi
if [[ `command -v dnf` ]]; then # dnf is more modern than yum, so override if both exists
       $SUDO dnf copr enable atim/sbcl
       packager=dnf
fi
if [[ `command -v pamac` ]]; then
       packager=pamac
fi
if [[ `command -v yay` ]]; then
       packager=yay
       install='-S'
fi
if [[ `command -v apt` ]]; then # in case you have both pamac and apt; apt is more likely to spot sbcl
       packager=apt
       # open library space of apt and refresh
       $SUDO add-apt-repository ppa:ubuntu-lisp/ppa
       $SUDO apt update
fi
if [[ `command -v zypper` ]]; then
       packager=zypper
       $SUDO zypper refresh
fi
if [[ `command -v brew` ]]; then
       packager=brew
       SUDO=                        # brew cannae sudo
fi
if [[ $(uname) == "Darwin" ]]; then
	LOG+="\n  You are using MacOS; I will check brew for install"
        if [[ `command -v brew` ]]; then
		LOG+="\n  brew found locally in your computer"
        else
                LOG+="\n  installing brew" # MacOS has curl by default
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
	packager=brew
        SUDO=                        # brew cannae sudo
elif [[ $(uname) == "Linux" ]]; then
	LOG+="\n  You are using Linux; I will use its standard installer ($packager)"
else
	LOG+="\n  You are not using Linux, MacOS or Window 11's WSL"
	if [[ -z $packager ]]; then
		LOG+="\n  I tried but I cannot locate an installer"
                LOG+="\n  I CANNOT install TheBench"
		LOG+="\n**Exiting with error"
       		echo -e $LOG > $LOGFILE
       		echo -e $LOG
       		exit -1
        else
		LOG+="\n  I have found an installer though: $packager"
		LOG+="\n  Using it"
	fi
fi
if [[ ! -z $packager ]]; then
	LOG+="\n  You have an installer ($packager) for standard packages"
	if [[ ! -x `command -v curl` ]]; then
		LOG+="\n  You don't have curl; installing it"
		$SUDO $packager $install curl
	else
		LOG+="\n  You have curl; using it"
	fi
	if [[ ! -x `command -v git` ]]; then
		LOG+="\n  You don't have git; installig it"
		$SUDO $packager $install git
	else
		LOG+="\n  You have git; using it"
	fi
else
       LOG+="\n  apt, dnf, pamac, yum, zypper or brew not found."
       LOG+="\n  Cannot install TheBench"
       LOG+="\n**Are you sure you are on a known linux/macOS?"
       echo -e $LOG > $LOGFILE
       echo -e $LOG
       exit -1
fi
LOG+="\nDone."
LOG+="\nChecking/installing Python ($PY), its pip and thebench libs,  and SBCL"
if [[ ! -z $packager ]]; then
       if [[ -x `command -v python$PY` ]]; then
		LOG+="\n  You have python$PY; I will get a local pip for it only"
       else
                LOG+="\n No python$PY; installing it"
       		$SUDO $packager $install python$PY
       fi
       curl -Ss https://bootstrap.pypa.io/get-pip.py -o get-pip.py 
       python$PY get-pip.py --user
       python$PY -m pip install --upgrade pip setuptools wheel
       python$PY -m pip install cl4py sly prompt_toolkit 
       LOG+="\n  python$PY libraries set for TheBench use: cl4py, sly, prompt_toolkit"
       if [[ -x `command -v sbcl` ]]; then
		LOG+="\n  You already have SBCL"
       else
                LOG+="\n  No SBCL; installing it"
                $SUDO $packager $install sbcl
       fi
fi
LOG+="\nDone."
LOG+="\nChecking/installing temporary storage for TheBench"
if [[ ! -d $TMPB ]]; then
	mkdir $TMPB   # we dont need sudo for this
  	LOG+="\n  $TMPB directory created for temporary files"
else
	LOG+="\n  $TMPB directory already exists; using it for TheBench"
fi
LOG+="\nDone."
LOG+='\nChecking/ensuring ~/.local/bin'
mkdir -p $HOME/.local/bin  # create if it does not exist
case ":$PATH:" in
	*":$HOME/.local/bin:") 
		LOG+="\n  $HOME/.local/bin already in PATH." 
		;;
	*)
		echo 'export PATH="$HOME/.local/bin:$PATH"' >> $HOME/.bashrc  
		LOG+="\n  $HOME/.local/bin added to PATH"
		LOG+="\n  $HOME/.bashrc appended with PATH export for $HOME/.local/bin"
		;;
esac
LOG+="\nDone."
LOG+="\nChecking thebench install type"
if [[ "$1" == "newbie" || "$1" == "Newbie" || "$1" == "NEWBIE" ]]; then
	LOG+="\n  Newbie install; cloning thebench repo"
        git clone https://github.com/bozsahin/thebench
	cd thebench
	BHF=`pwd`
else 
	LOG+="\n  Pro install; no cloning of thebench repo"
	BHF=`pwd` # the dir to be pointed by BENCH_HOMEP;
fi
LOG+="\nDone."
LOG+="\nChecking/setting TheBench command recall files"
echo "$BHF" > $BENCH_HOMEP   # repo pointer saved at home dir as a dot file
echo "" > $BENCH_HISTORY     # command history saved at home dir as a 
	                              #     dot file (py refers to it internally)
chmod u+rw $BENCH_HISTORY
chmod u+rw $BENCH_HOMEP
LOG+="\nDone."
LOG+="\nSetting up thebench binary"
echo "python$PY $BHF/src/bench.py" > "$HOME/.local/bin/$BENCHBIN" 
LOG+="\n  TheBench binary thebench is set to execute: `cat $HOME/.local/bin/$BENCHBIN`"
chmod ugo+x "$HOME/.local/bin/$BENCHBIN"  # to call bench from anywhere
LOG+="\nDone."
LOG+="\n\n\nTheBench install: **Please check for Cannot Install errors"
LOG+="\n========================================================="
echo -e $LOG > $LOGFILE
echo -e $LOG
echo "The install log is available at: $LOGFILE"
echo "Type 'thebench' to start using TheBench right away."
