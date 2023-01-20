# TheBench
A tool to study monadic structures in natural languages using two command relations.

YOU NEED:

- A terminal app, such as those in any Linux, MacOS or Window's WSL system (wsl2 or newer).  You can start using WSL right off the bat if you have Windows; check out <a href="https://learn.microsoft.com/en-us/windows/wsl/install">Window's WSL</a>. 
- A software installer.  The standard installers
in these platforms are <code>apt-get, dnf, pacman, yum</code> or <code>brew</code> (macOS). These are the ones recognized by thebench installer. They are built-in, depending on your platform, even under WSL.
As things Apple go, you need an external installer for such goodies in MacOS, which you can get from <a href="https://brew.sh/">brew home</a>.
- <a href="https://www.python.org/">Python 3.8  or above</a>
- Python module installer <a href="https://pypi.org/project/pip/">pip</a>
- <a href="https://git-scm.com/downloads">git</a> (git is optional if you don't care about upgrades; in this case, ignore step 1 below and just download this repository, and do steps 2-3. If you do care about upgrades, git is safest and easiest).

TO INSTALL: 

1.  Open a terminal, and change to the directory where you want to install the tool. Then do:

   <code>git clone https://github.com/bozsahin/thebench</code>

   This will create <code>thebench</code> folder with code and documentation.

2.  In the terminal, and IN THAT directory, do  the following:

   <code>bench.install.sh</code>

3. Make sure that <code>/usr/local/bin</code> is in your <code>PATH</code> variable. (It is
usually there by default; just check it by doing <code>echo $PATH</code>.)

You've just installed thebench, the Python libraries needed, and SBCL as Common Lisp, which is used by one of the python libraries and thebench processor. You have also made the tool available from anywhere in your machine.

If you already had these utilities in your system, your versions are detected and used by the bench. 

PYTHON NOTE:

Python versions can be daunting for the uninitiated. Don't count on the executable <code>python</code> to be the latest
python. You might also have python3.8, python3.9, python3141.59 etc. 

Use the latest for python AND pip. If you have a new one installed, say python3.11,
just re-ran the installer with that suffix to update thebench libraries, for example

<code>bench.install.sh 3.11</code>

This will refresh the tool with  <code>pip3.11</code> and <code>python3.11</code>.

TO USE: 

just do

<code>bench</code>

Use UP and DOWN keys for command recall. TheBench keeps its specific command history in <code>.thebenchhistory</code>
file at your home directory.

TO DEVELOP A GRAMMAR:

Just use your favourite plain text editor and enter a grammar. Then follow help (? command) of thebench to process it.

I suggest you develop grammars NOT in <code>thebench</code> folder.  The directory would get quite messy with log files etc.  

TO UPGRADE:

in your <code>thebench</code> directory do

   <code>git pull</code>

TO UNINSTALL:

Go to <code>src</code> subdirectory of the bench, and do

   <code>bench.uninstall.sh sure</code>

Enjoy. 

My email is somewhere in the webosphere to google; just drop me an email if you need assistance.

-Cem Bozsahin
