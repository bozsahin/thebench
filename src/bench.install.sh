#!/bin/bash
# brew does not allow sudo anymore-- $SUDO controls that
# cem bozsahin 2022
# check to see if there is already an installation
LOG="=======================================================\nTheBench install and set up, `date`\n=======================================================" # installers can be very verbose, accumulate all deeds to report at end
if [ "$BENCH_HOME" ]; then
  echo "You have thebench installed at: $BENCH_HOME."
  echo "There is no need to reinstall. Just do 'git pull' at $BENCH_HOME for the latest."
  exit -1
fi
if [ ! -d "/tmp/thebench" ]; then
  mkdir /tmp/thebench
  LOG+="\n-/tmp/thebench directory created, for temporary files"
fi
LOGFILE='/tmp/thebench-install.log'
echo "PLEASE NOTE:"
echo "  IN CASE THE INSTALLER ASKS FOR superuser PASSWORD,"
echo "  It will be ONLY for installing the Common Lisp's sbcl THROUGH safe installers"
echo " "
SUDO=sudo
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
locallisp=`command -v sbcl`
printf '%s\n' '# stuff added by thebench installer' >> ~/.bashrc
printf '%s\n' 'source ~/.thebenchrc' >> ~/.bashrc
printf '%s\n' '# stuff added by thebench installer' > ~/.thebenchrc
printf '%s\n%s\n%s\n' "export BENCH_HOME=$labdir" "export bench=$labdir/src/bench.py" "export PATH=:.:\$BENCH_HOME/src:\$PATH" >> ~/.thebenchrc
printf '%s\n' '# end of stuff added by thebench installer' >> ~/.thebenchrc
printf '%s\n' '# stuff added by thebench installer' >> ~/.bash_profile
printf '%s\n' 'if [ -f ~/.bashrc ]; then source ~/.bashrc; fi' >> ~/.bash_profile
LOG+='\n-Your .bashrc and .bash_profile have been updated for thebench'
LOG+='\n-You have a .thebenchrc file in your home directory; please do NOT delete it'
LOG+='\n-Just do "git pull" in thebench home for updates from now on.'
LOG+="\n-I wouldnt do updates in standard files of $labdir."
LOG+="\n They will be overridden by next git pull"
LOG+="\n\n-thebench install: COMPLETED"
LOG+="\n-This log is saved in file $LOGFILE"
LOG+="\n`date`\n======================================================="
echo -e $LOG > $LOGFILE
echo -e $LOG