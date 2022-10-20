# thebench
A tool to study monadic structures in natural languages using two command relations.

YOU NEED:

- A terminal app, such as those in any Linux, MacOS or Window's WSL system (wsl2 or newer).  You can start using WSL right off the bat if you have Windows; check out <a href="https://learn.microsoft.com/en-us/windows/wsl/install">Window's WSL</a>. 
- A software installer.  The standard installers
in these platforms are <code>apt-get, dnf, pacman, yum</code> or <code>brew</code> (macOS). These are the ones recognized by thebench installer. They are built-in, depending on your platform, even under WSL.
As things Apple go, you need an external installer for such goodies in MacOS, which you can get from <a href="https://brew.sh/">brew home</a>.
- <a href="https://www.python.org/">Python 3.8  or above</a>
- Python module installer <a href="https://pypi.org/project/pip/">pip</a>
- <a href="https://git-scm.com/downloads">git</a> (actually, git is optional if you don't care about upgrades; in this case, ignore step 1 below and just download this repository, and do step 2. If you do care about upgrades, git is safest and easiest).

TO INSTALL: 

1.  Open a terminal, and change to the directory where you want to install the tool. Then do:

   <code>git clone https://github.com/bozsahin/thebench</code>

   This will create <code>thebench</code> folder with code and documentation.

2.  In the terminal, and in that directory, do  the following:

   <code>install-bench</code>

   <code>pip install sly</code>

   <code>pip install cl4py</code>

   <code>pip install prompt_toolkit</code>

You are done with installation.  (I did not put these steps in the installer because you need the same version of pip as your python, which seems impossible
				    to detect in a script. For example <code>pip3.9</code> if you have <code>python3.9</code>.)

You've just installed thebench, the Python libraries needed, and SBCL as Common Lisp, which is used by one of the python libraries. You have also made the tool available from anywhere in your machine.

If you already had these utilities in your system, your versions are detected and used by the bench. 

TO USE:

Open a fresh terminal, change to your working directory, and do

   <code><b>python $bench</b></code>

where <code>python</code> is the most recent (and >= 3.8) python executable.

Use UP and DOWN keys for command recall. TheBench keeps its specific command history in <code>.thebenchhistory</code>
file at your home directory.

TO DEVELOP A GRAMMAR:

Just use your favourite plain text editor and enter a grammar. Then follow help (h command) of thebench to process it.

I suggest you develop grammars NOT in <code>thebench</code> folder.  The directory would get quite messy with log files etc.  

TO UPGRADE:

in your <code>thebench</code> directory do

   <code>git pull</code>

PYTHON NOTE 1:

Default python interpreters are SLOW. You may want to try <code><a href="https://pypy.org">pypy</a></code>.
This tool is much faster in it.
 
If you do make the switch, change <code>pip install ..</code> commands in step 2 above
to <code>pip_pypy3 install ..</code>


  And wherever you see <code>python</code> call above, change it to <code>pypy3</code>.

NOTE 2:

Python versions can be daunting for the uninitiated. Don't count on executable <code>python</code> to be the latest
python. You might also have python3.8, python3.9, python3141.59 etc. Ditto for pip and pypy. Use the latest for all of them.

Enjoy. 

My email is somewhere in the webosphere to google; just drop me an email if you need assistance.

-Cem Bozsahin
