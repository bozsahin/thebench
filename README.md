# thebench
Bench tool for working with Natural Language Monad of Command


To use the tool you need:

- <a href="https://www.python.org/">Python 3.8  or above</a>
- Python module installer <a href="https://pypi.org/project/pip/">pip</a>
- <a href="https://git-scm.com/downloads">git</a>

Once you have them, please do steps 1-2 to install <code>thebench</code>:

1.  Open a terminal (in Linux, Mac or Windows with WSL system---with terminal in that system), 
   for example by doing 

   <code>git clone https://github.com/bozsahin/thebench</code>

   This will create <code>thebench</code> folder with code and documentation.

2.  In the terminal and in that directory, do  the following:

   <code>./install-bench</code>

   <code>pip install sly</code>

   <code>pip install cl4py</code>

You are done with installation.

Open a fresh terminal.

Now you can use the tool from any folder in your system. 

To run an interactive session, please do

   <code><b>bench</b></code>

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
