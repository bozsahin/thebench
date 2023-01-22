# TheBench
A tool to study monadic structures in natural languages using two command relations.

YOU NEED:

- A terminal app, such as those in any Linux, MacOS or Window's WSL system (wsl2 or newer).  

You can start using WSL right off the bat if you have Windows; check out <a href="https://learn.microsoft.com/en-us/windows/wsl/install">Window's WSL</a>. 

- A software installer.  

The standard installers
in these platforms are <code>apt-get, dnf, pacman, yum</code> or <code>brew</code> (macOS). These are the ones recognized by thebench installer. They are built-in, depending on your platform, even under WSL.

As things Apple go these days, you might be left helpless about things we take for granted
in programming; you'd need external help. Brew is an external installer for such goodies in MacOS, which you can get from <a href="https://brew.sh/">brew home</a>.


- <a href="https://www.python.org/">Python 3.8  or above</a>

- Python module installer <a href="https://pypi.org/project/pip/">pip</a>

If you installed python by a package manager, you probably have pip already.

- <a href="https://git-scm.com/downloads">git</a> 

(git is optional if you don't care about upgrades; in this case, ignore step 1 below and just download this repository, and do step 2. If you do care about upgrades, git is safest and easiest).

If you already have these utilities in your system, your versions are detected and used by the bench. 
If not, the installer will complain and exit.

TO INSTALL: 

1.  Open a terminal, and change to the directory where you want to install the tool. Then do:

   <code>git clone https://github.com/bozsahin/thebench</code>

   This will create <code>thebench</code> folder with code and documentation.

2.  In the terminal, and IN <code>thebench</code> directory, do  the following:

   <code>bench.install.sh</code>

You've just installed thebench, the Python libraries needed, and SBCL as Common Lisp, which is used by one of the python libraries and thebench processor. You have also made the tool available from anywhere in your machine.

MULTI-USER SYSTEMS:

The installer is designed to set thebench up in a personal computer, where you would have
<code>sudo</code> access to install goodies like Common Lisp, which we need for
the processor. If you work in a multi-user system, ask your admin to install <code>SBCL</code> for you.
Then thebench install script will detect that and won't complain.

PYTHON UPGRADE NOTE:

Python versions can be daunting for the uninitiated. Don't count on the executable <code>python</code> to be the latest python. You might also have python3.8, python3.9, python3141.59 etc. 

Use the latest for python AND pip. If you have a new one installed, say python3.11,
just re-run the installer with that suffix to update thebench libraries, for example

<code>bench.install.sh 3.11</code>

This will refresh the tool to work with  <code>pip3.11</code> and <code>python3.11</code>.

TO USE: 

just do

<code>bench</code>

Use UP and DOWN keys for command recall. TheBench keeps its specific command history in <code>.thebenchhistory</code>
file at your home directory.

TO DEVELOP A GRAMMAR:

Just use your favourite plain text editor and enter a grammar. Then follow help (? command) of thebench to process it.

I suggest you develop grammars NOT in <code>thebench</code> folder to avoid override in upgrades.

TO UPGRADE:

in your <code>thebench</code> directory do

   <code>git pull</code>

TO UNINSTALL:

Go to <code>src</code> subdirectory of the bench, and do

   <code>bench.uninstall.sh sure</code>

Enjoy. 

My email is somewhere in the webosphere to google; just drop me an email if you need assistance.

-Cem Bozsahin

NOTES FOR THE DISCERNING TECHIE:

In addition to setting a package directory for <code>thebench</code> in your user space, the installer
creates some files to keep things organized and available from
anywhere in the computer. There are four of them:

<code>~/.thebenchhome</code> This file contains the full path of thebench repository in your installation.

<code>~/.thebenchhistory</code> This file contains history of your command use for easier recall.

<code>~/bin/bench</code> This file contains the full python command line to reach thebench from anywhere
in your user space.

<code>~/bin/bench.train</code> This is a  symbolic link to the trainer <code>bench.train.sh</code> used by the 
tool.

Please do not alter them manually.

The installer also creates a <code>~ /bin</code> directory at your home, if you don't already have one.
The only surgical touch to your <code>~/.bashrc</code>, which is where your bash variables
are kept (usually), is to add this directory to the PATH variable of bash and eliminate duplicates in it.
There are no bench-related environment variables.
