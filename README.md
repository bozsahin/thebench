# thebench
A tool for working with Natural Language Monad of Command


YOU NEED:

- A linux-like command facility, such as any Linux, MacOS or Window's WSL system (wsl2 or newer). The standard installers
in these platforms are <code>apt-get, dnf, pacman, yum</code> or <code>brew</code> (macOS). These are the ones recognized by thebench installer. They are built-in, depending on your platform, even under WSL, except brew for MAcOS, which you can install from <a href="https://brew.sh/">brew home</a>.)
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

You are done with installation. 

You've just installed thebench, rlwrap, the Python libraries needed, and SBCL as Common Lisp, which is used by one of the python libraries. You have also made the tool available from anywhere in your machine.

If you already had these utilities in your system, your versions are detected and used by the bench. Rlwrap is great for recalling earlier commands in an interactive session.

TO USE:

Open a fresh terminal, change to your working directory, and do

   <code><b>python $bench</b></code>

where <code>python</code> is the most recent (and >= 3.8) python executable.


TO DEVELOP GRAMMARS:

Just use your favourite text editor and enter a grammar. Then follow help (h command) of thebench to process it.

I suggest you develop grammars NOT in <code>thebench</code> folder.  The directory would get quite messy with log files etc.  

TO UPGRADE:

in your <code>thebench</code> directory do

   <code>git pull</code>

PYTHON NOTE:

Default python interpreters are SLOW. You may want to try <code><a href="https://pypy.org">pypy</a></code>.
This tool is much faster in it.
 
If you do make the switch, change <code>pip install ..</code> commands in step 2 above
to <code>pip_pypy3 install ..</code>


  And wherever you see <code>python</code> call above, change it to <code>pypy3</code>.

Enjoy. (My email is somewhere in the webosphere to google; just drop me an email if you need assistance.)
-Cem
