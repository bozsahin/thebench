#!/bin/bash 
# cem bozsahin 2025 (with a little help from chatGPT)
BENCH_HOMEP="$HOME/.thebenchhome" # this file will contain the 
                                  # pointer to TheBench repo path in your file system
BENCH_HISTORY="$HOME/.thebenchhistory" # py saves commands in it internally
BHF=`pwd` # the dir to be pointed by BENCH_HOMEP;
BENCHBIN='thebench'  # this is the name of the binary 'bench' is shorter but it might name-collide
TMPB='/var/tmp/thebench'  # where the temporary files of analysis and training go
PY="3.11"                 # isolated python for TheBench, without pyenv or ensurepip nonsense
PYC="3.11.9"             # specific python to download from python.org
SUDO=sudo  # for SBCL install
LOGFILE='/var/tmp/thebench-install.log' # goes there to avoid .gitignore in repo directory
LOG="=========================================================\nTheBench install and set up `date`\n========================================================="
LOG+="\nChecking the software requirements"
if [ ! -x `command -v curl` ]; then
	LOG+="\n  You don't have curl"
	LOG+="\n  exiting without action"
	exit -1
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
LOG+="\nChecking/installing TheBench python ($PYC as $PY) IN THIS REPO, its pip and libraries"
curl -sSf https://wwww.python.org/ftp/python/$PYC/Python-$PYC.tgz | tar -xz
cd Python-$PYC
./configure --prefix=$HOME/.local/bin/python$PY --enable-optimizations
make -j$(nproc)
make install
python$PY -m pip install pkg_resources cl4py sly prompt_toolkit 
LOG+="\n  $PY libraries set for TheBench use: pkg_resources, cl4py, sly, prompt_toolkit"
echo "python$PY $BHF/src/bench.py" > "$HOME/.local/bin/$BENCHBIN" 
LOG+="\n  TheBench binary thebench is set to execute: `cat $HOME/.local/bin/$BENCHBIN`"
chmod ugo+x "$HOME/.local/bin/$BENCHBIN"  # to call bench from anywhere
LOG+="\nDone."
LOG+="\nChecking/setting TheBench commmand recall files"
echo "$BHF" > $BENCH_HOMEP   # repo pointer saved at home dir as a dot file
echo "" > $BENCH_HISTORY     # command history saved at home dir as a 
	                              #     dot file (py refers to it internally)
chmod u+rw $BENCH_HISTORY
chmod u+rw $BENCH_HOMEP
LOG+="\nDone."
LOG+="\nChecking/installing SBCL"
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
            LOG+="\n  You have an installer ($packager) for standard packages"
            echo ""
            echo "You will be asked for sudo password ONLY to install SBCL"
            echo ""
            $SUDO $packager $install sbcl
            LOG+="\n  SBCL is downloaded and installed"
        else
            LOG+="\n  apt, dnf, pamac, yum, zypper or brew not found. I leave Common Lisp handling to you."
            LOG+="\n  When you install SBCL, you will be set to go in TheBench."
            LOG+="\n  No further install will be needed."
        fi
else
	LOG+="\n  You already have SBCL; using it for TheBench"

fi
LOG+="\nDone."
LOG+="\nTheBench install: COMPLETED"
LOG+="\n========================================================="
echo -e $LOG > $LOGFILE
echo -e $LOG
echo "The install log is available at: $LOGFILE"
echo "--->Type 'bash', then 'thebench', to start using TheBench right away."
