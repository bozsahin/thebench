# thebench
Bench tool for working with Natural Language Monad of Command


To use the tool you need:

- <a href="https://www.python.org/">Python 3.8  or above</a>
- Python module installer <a href="https://pypi.org/project/pip/">pip</a>
n
- Optional but very highly recommended: <a href="https://git-scm.com/downloads">git</a>

Once you have them, please do steps 1-2 to install <code>thebench</code>:

1. In a directory where you want to save the tool, clone this repo. Or, download it if you don't want to use <code>git</code>.

   For example, you can  open a terminal app and do <code>git clone https://github.com/bozsahin/thebench</code>

   This will create <code>thebench</code> folder with code and documentation.

2. Open a terminal  and change to that directory
   (linux, Mac, Windows with WSL system---with terminal in that system):

   In the terminal, do  the following:

   <code>./install-bench</code>
   <code>pip install sly</code>
   <code>pip install cl4py</code>

Now you can run <code>bench.py</code> from any folder in your system. 

To run an interactive grammar development/testing session, please do

   <code>python ...bench.py</code>

   where dots are the full path to where you keep the <code>bench.py</code>.

- And, ehm, yes, please read the manual.

- I suggest you develop grammars NOT in <code>thebench</code> folder.  The directory would get quite messy with log files etc.

For updates, <code>git</code> is easiest.  In your <code>thebench</code> directory do

   <code>git pull</code>


MORE GOODIES:

-Python note: Default python interpreters are SLOW. You may want to try <code><a href="https://pypy.org">pypy</a></code>.
This tool is much faster in it.
 
If you do make the switch, change <code>pip install ..</code> commands in step 2 above
to <code>pip_pypy3 install ..</code>


  And wherever you see <code>python</code> call above, change it to <code>pypy3</code>.

Enjoy.
-Cem
