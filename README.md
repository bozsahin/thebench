# TheBench
This is a tool to study the variants in natural language (i.e. crosslingustic and intralinguistic diversity) using an invariant: binary composition.

It uses two command relations in a grammar, one on
syntactic command, one on semantic command. The guide explains these command relations.

It can work in Linuxsphere, Macosphere and Window's Linux sub-atmosphere,  for example in Window's WSL, MacOS, Arch, Debian and RedHat-based distributions.

These spheres are available as systems of various beginner-friendliness, in my opinion in the decreasing order of: latest MacOS, Ubuntu, Mint, Manjaro, Fedora, Kali, Suse, Pop_OS, CentOS, slackware etc. 

I have been able to install and run TheBench fully automatically in top six of the platforms in this list. (I skipped Suse after installing it---see the bottom of this page for the explanation. I have not tried others.)

YOU NEED:

1. A terminal app. (All of the platforms listed above have one built-in.)  

Window's native terminal is not the right one for TheBench, you'd need WSL in a windows system.


2. A software installer.  

The standard installers
in linux platforms are <code>apt-get, dnf, pacman, yum</code> or <code>brew</code> (macOS). These are the ones recognized by TheBench installer. They are built-in, depending on your platform, including WSL. See the note at the bottom for the absence of the <code>rpm</code> package manager.

You can start using WSL right off the shelf if you have late Windows 10 upwards; check out <a href="https://learn.microsoft.com/en-us/windows/wsl/install">Window's WSL</a>. 

As things Apple go these days, you might be left helpless about things we take for granted
in programming, such as having public package managers. You need external help. Brew is an external installer for such goodies in MacOS, which you can get from <a href="https://brew.sh/">brew home</a>.


3. <a href="https://www.python.org/">Python 3.8  to 3.11</a>. (Earlier ones lack the libraries, later ones mess with python's pip in unpredictable ways. 3.11 is supported until the end of 2027.)

4. <a href="https://git-scm.com/downloads">git</a> 

If you already have these utilities in your system, your versions are detected and used by TheBench. 
If not, the installer will complain and exit.

TO INSTALL: 

1.  Open a terminal, and change directory to where you want to install the tool. Then do:

   <code>git clone https://github.com/bozsahin/thebench</code>

   This will create <code>thebench</code> subdirectory in that directory.

2.  In the terminal, <b>AND in <code>thebench</code> directory</b>, do  the following:

   <code>./bench.sh install mypython</code>

where <code>mypython</code> is your python executable, for example <code>python3.10</code> or <code>python3.11</code>, etc.

This will install TheBench, the Python libraries needed, and SBCL as Common Lisp, which is used by one of the python libraries and TheBench processor. You have also made the tool available from anywhere in your machine. You get python's library manager <code>pip</code> as well if you don't already have it (checked by the installer).

TO USE: 

just do anywhere in your machine from a terminal app:

<code>bench</code>

Use UP and DOWN keys for command recall. TheBench keeps its specific command history in <code>.thebenchhistory</code>
file at your home directory.

If you experience problems accessing <code>bench</code> this way, you are probably using a different shell.
In this case, do <code>bash</code>, then do the above. Bash is available in all linux platforms, unlike other shells.

PERSONAL COMPUTER SECURITY and MULTI-USER SYSTEMS:

The installer is designed to set TheBench up in a personal computer, where you would have
<code>sudo</code> access. Please ask your system admin to install it for you if you don't have that access.

When run on a personal computer, it will be your local sudo asking for password. Please do not share it with
anyone. If you are not convinced, please ask a trusted expert to screen the installer for security.

PYTHON UPGRADE NOTE:

If you want to move to another python for this tool, say python3.xx, and have that python installed, then 
re-run the install script FROM thebench home as

<code>./bench.sh reset python3.xx</code>

to change to that python. It will make sure its <code>pip</code> library manager is installed and refreshes TheBench libraries for that python. 

TO DEVELOP A GRAMMAR:

Just use your favourite plain text editor and enter a grammar. Then follow help (the `? command') of TheBench to process it.

I suggest you develop grammars NOT in <code>thebench</code> folder to avoid override in upgrades.

TO UPGRADE:

in your <code>thebench</code> directory do

   <code>git pull</code>

If git complains about conflicts, the usual suspect is local changes to <code>bench.user.lisp</code> file.
Move it somewhere and do the upgrade, then put it back. The contents of this file is not crucial to the tool,
but its presence and location are.

NOTES FOR THE DISCERNING TECHIE:

The installer
creates some files to keep things organized and available from
anywhere in the computer. There are THREE of them: (`~' points to your home directory in the linux world).

<code>~/.thebenchhome</code> This file contains the full path of TheBench repository in your installation.

<code>~/.thebenchhistory</code> This file contains history of your command use for easier recall.

<code>/usr/local/bin/bench</code> This is the executable that allows access to TheBench for anyone on your system from anywhere.

Please do not alter them manually.

TO UNINSTALL:

Change to repo's local directory, and do

   <code>./bench.sh uninstall</code>

This will remove TheBench files and auxiliary directories. It won't touch
your python or SBCL. To remove them, use your package manager. 

SBCL, PYTHON AND PACKAGE MANAGER NOTES: 

SBCL is the Common Lisp that the processor of TheBench uses. It is installed by the installer of TheBench if SBCL does
not exist in your system. (This is checked by the installer.)

I have tried SBCL 1.x to 2.2.x with success in Macs, PCs and anything in between, for this tool. 

Something happened to SBCL with 2.3.x releases, and
TheBench hangs in the beginning. I couldn't locate what causes it to ask the SBCL developers to fix it, so I recommend downgrading
your SBCL to something below 2.3.x to make sure this tool works. You don't need to do anything else.

Downgrading SBCL is unfortunately not automatic. You have to build an older binary using SBCL's install script. 
It is explained <a href="https://sbcl.org/getting.html"> here</a>. It works in Macs and linuxes.

If you are wondering why I am not using Python's virtual environment facility to freeze TheBench to a certain python binary,
it is because it's needlessly complex, a bit wet behind the ear at this day and age, and error-prone. 
For TheBench, it seemed to me  to be the shortest way to lose the python-uninitiated from the start.
TheBench has its on command syntax anyway; it does not need Python or Lisp programming.

You may have noticed the curious absence of <code>rpm</code> package manager support for install. Unlike <code>yum</code>, which
is also available in rpm-based platforms, <code>rpm</code> is subscription-based. I find that quite un-linux, and non-transparent.
So, for Suse and similar RH systems, install <code>yum</code> first before you install TheBench. Fedora is RH, but comes with <code>yum</code>, so no problems (and wise choice, lads and lasses, ditto CentOS).

--enjoy. Cem Bozsahin

My email is somewhere in the webosphere to google; just drop me an email if you need assistance.
