#!/bin/bash 
# cem bozsahin 2025 (with a little help from chatGPT)
BENCH_HOMEP="$HOME/.thebenchhome" # this file will contain the 
                                  # pointer to TheBench repo path in your file system
BENCH_HISTORY="$HOME/.thebenchhistory" # py saves commands in it internally
BHF=`pwd` # the dir to be pointed by BENCH_HOMEP;
BENCHBIN='thebench'  # this is the name of the binary 'bench' is shorter but it might name-collide
TMPB='/var/tmp/thebench'  # where the temporary files of analysis and training go
PY="3.10"                 # isolated python for TheBench, without pyenv or ensurepip nonsense
SUDO=sudo  # for SBCL
LOGFILE='/var/tmp/thebench-install.log' # goes there to avoid .gitignore in repo directory
LOG="=========================================================\nTheBench install and set up `date`\n========================================================="
LOG+="Checking the software requirements"
if [ ! -x `command -v git` ]; then
	LOG+="  You don't have git"
	LOG+="  exiting without action"
	exit -1
fi
if [ ! -x `command -v curl` ]; then
	LOG+="  You don't have curl"
	LOG+="  exiting without action"
	exit -1
fi
LOG+="Done."
LOG+="Checking to see whether TheBench was previously installed"
if [ -e `cat $BENCH_HOMEP` ]; then
	LOG+="  You have TheBench installed at: `cat $BENCH_HOMEP`"
  	LOG+="  There is no need to reinstall. Just do 'git pull' in that directory for the latest."
  	exit 0  # this is not an error
fi
LOG+="Done."
LOG+="Checking/installing temporary storage for TheBench"
if [ ! -d $TMPB ]; then
	mkdir $TMPB   # we dont need sudo for this
  	LOG+="  $TMPB directory created for temporary files"
fi
LOG+="Done."
LOG+='Checking/ensuring ~/.local/bin'
mkdir -p $HOME/.local/bin 
LOG+="Done."
LOG+="Checking/installing uv and isolating TheBench python ($PY), its pip and libraries for TheBench"
if [ ! -x `command -v uv` ]; then
     curl -LsSf https://astral.sh/uv/install.sh | sh
fi
LOG+="  UV version : `cat uv --version`"
uv python install $PY
LOG+="  TheBench's own python: `uv python list`"
uv pip install --python $PY cl4py sly prompt_toolkit # no more python pip or ensurepip;  yerrs
LOG+="  $PY libraries set for TheBench use: cl4py, sly, prompt_toolkit"
echo "sh -c \"export PATH=\$HOME/.local/bin:\$PATH; uv run --python $PY python $BHF/src/bench.py\"" > "$HOME/.local/bin/$BENCHBIN" 
LOG+="  TheBench binary thebench is set to execute: `cat $HOME/.local/bin/$BENCHBIN`"
chmod ugo+x "$ULB/$BENCHBIN"  # to call bench from anywhere
LOG+="Done."
LOG+="Checking/setting TheBench commmand recall files"
echo "$BHF" > $BENCH_HOMEP   # repo pointer saved at home dir as a dot file
echo "" > $BENCH_HISTORY     # command history saved at home dir as a 
	                              #     dot file (py refers to it internally)
chmod u+rw $BENCH_HISTORY
chmod u+rw $BENCH_HOMEP
LOG+="Done."
LOG+="Checking/installing SBCL"
if [ ! -x `command -v sbcl` ]; then    # look for package managers
	packager=
        install=install
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
            LOG+="  You have an installer ($packager) for standard packages"
            echo ""
            echo "You will be asked for sudo password ONLY to install SBCL"
            echo ""
            $SUDO $packager $install sbcl
            LOG+="  SBCL is downloaded and installed"
        else
            LOG+="  apt, dnf, pamac, yum, zypper or brew not found. I leave Common Lisp handling to you."
            LOG+="  When you install SBCL, you will be set to go in TheBench."
            LOG+="  No further install will be needed."
        fi
else
	LOG+="  You already have SBCL; using it for TheBench"

fi
LOG+="Done."
LOG+="TheBench install: COMPLETED"
LOG+="The log is available at: $LOGFILE"
LOG+="========================================================="
echo -e $LOG > $LOGFILE
echo -e $LOG
