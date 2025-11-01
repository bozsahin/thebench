#!/bin/bash 
# cem bozsahin 2025 (with a little help from chatGPT)
BENCH_HOMEP="$HOME/.thebenchhome" # this file will contain the 
                                  # pointer to TheBench repo path in your file system
BENCH_HISTORY="$HOME/.thebenchhistory" # py saves commands in it internally
BHF=`pwd` # the dir to be pointed by BENCH_HOMEP;
BENCHBIN='thebench'  # this is the name of the binary 'bench' is shorter but it might name-collide
TMPB='/var/tmp/thebench'  # where the temporary files of analysis and training go
PY="3.11"                 # specific python for thebench
SUDO=sudo  # for Python and SBCL install
LOGFILE='/var/tmp/thebench-install.log' # goes there to avoid .gitignore in repo directory
LOG="=========================================================\nTheBench install and set up `date`\n========================================================="
LOG+="\nChecking the software requirements"
if [ ! -x `command -v curl` ]; then
	LOG+="\n  You don't have curl"
	LOG+="\n  exiting without action"
	exit -1
fi
if [[ `uname` == "Darwin" ]]; then
	LOG+="\n  You are using MacOS; I will check brew for install"
        if [ `command -v brew` ]; then
		LOG+="\n  brew found locally in your computer"
        else
                LOG+="\n  installing brew"
        	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
        fi
elif [[ `uname` == "Linux" ]]; then
	LOG+="\n  You are using Linux; I will use its standard installer"
else
	LOG+="\n  You are not using Linux, MacOS or Window 11's WSL; lets hope I can find your installer"
fi
LOG+="\nDone."
LOG+="\nChecking/installing temporary storage for TheBench"
if [ ! -d $TMPB ]; then
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
LOG+="\nDone."
LOG+="\nChecking/setting TheBench commmand recall files"
echo "$BHF" > $BENCH_HOMEP   # repo pointer saved at home dir as a dot file
echo "" > $BENCH_HISTORY     # command history saved at home dir as a 
	                              #     dot file (py refers to it internally)
chmod u+rw $BENCH_HISTORY
chmod u+rw $BENCH_HOMEP
LOG+="\nDone."
LOG+="\nChecking/installing Python and SBCL"
packager=
install=install
echo "You may be asked for sudo password"
echo ""
if [ `command -v yum` ]; then
       packager=yum
       $SUDO yum makecache  # updates the database
       install="-y install"
fi
if [ `command -v dnf` ]; then # dnf is more modern than yum, so override if both exists
       $SUDO dnf copr enable atim/sbcl
       packager=dnf
fi
if [ `command -v pamac` ]; then
       packager=pamac
fi
if [ `command -v yay` ]; then
       packager=yay
       install='-S'
fi
if [ `command -v apt` ]; then # in case you have both pamac and apt; apt is more likely to spot sbcl
       packager=apt
       # open library space of apt and refresh
       $SUDO add-apt-repository ppa:ubuntu-lisp/ppa
       $SUDO apt update
fi
if [ `command -v zypper` ]; then
       packager=zypper
       $SUDO zypper refresh
fi
if [ `command -v brew` ]; then
       packager=brew
       SUDO=                        # brew cannae sudo
fi
if [ "$packager" ]; then
       LOG+="\n  You have an installer ($packager) for standard packages"
       echo ""
       echo ""
       LOG+="\n  Checking/installing TheBench python ($PY), its pip and libraries"
       if [ `command -v python$PY` ]; then
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
       echo "python$PY $BHF/src/bench.py" > "$HOME/.local/bin/$BENCHBIN" 
       LOG+="\n  TheBench binary thebench is set to execute: `cat $HOME/.local/bin/$BENCHBIN`"
       chmod ugo+x "$HOME/.local/bin/$BENCHBIN"  # to call bench from anywhere
       if [ `command -v sbcl` ]; then
		LOG+="\n  You already have SBCL"
       else
                LOG+="\n No SBCL; installing it"
                $SUDO $packager $install sbcl
       fi
else
       LOG+="\n  apt, dnf, pamac, yum, zypper or brew not found."
       LOG+="\n  Cannot install Python"
       LOG+="\n  Cannot install SBCL"
       LOG+="\n***Are you sure you are on a known linux/macos ?***"
fi
LOG+="\nDone."
LOG+="\nTheBench install: Check for Cannot install errors"
LOG+="\n========================================================="
echo -e $LOG > $LOGFILE
echo -e $LOG
echo "The install log is available at: $LOGFILE"
echo "Type 'thebench' to start using TheBench right away."
