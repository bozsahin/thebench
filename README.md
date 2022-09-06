# thebench
A tool for working with Natural Language Monad of Command


To install and use the tool you need:

- <a href="https://www.python.org/">Python 3.8  or above</a>
- Python module installer <a href="https://pypi.org/project/pip/">pip</a>
- <a href="https://git-scm.com/downloads">git</a>

Once you have them, please do steps 1-2 to install <code>thebench</code>:

1.  Open a terminal (in Linux, Mac or Windows with WSL system---with terminal in that system), 
   for example by doing 

   <code>git clone https://github.com/bozsahin/thebench</code>

   This will create <code>thebench</code> folder with code and documentation.

2.  In the terminal, and in that directory, do  the following:

   <code>install-bench</code>

   <code>pip install sly</code>

   <code>pip install cl4py</code>

You are done with installation. 

(You've just installed thebench, pip, rlwrap and SBCL as Common Lisp, which is used by one of the python libraries.) If you already had them, your versions are detected and used by the bench. Rlwrap is great for recalling
earlier commands in an interactive session.

TO USE:

Open a fresh terminal, and do

   <code><b>python $bench</b></code>

where <code>python</code> is the most recent (and >= 3.8) python executable.


I suggest you develop grammars NOT in <code>thebench</code> folder.  The directory would get quite messy with log files etc.

For updates, in your <code>thebench</code> directory do

   <code>git pull</code>


-Python note: Default python interpreters are SLOW. You may want to try <code><a href="https://pypy.org">pypy</a></code>.
This tool is much faster in it.
 
If you do make the switch, change <code>pip install ..</code> commands in step 2 above
to <code>pip_pypy3 install ..</code>


  And wherever you see <code>python</code> call above, change it to <code>pypy3</code>.

Enjoy.
-Cem
