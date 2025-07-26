# TheBench
This is a tool to study natural language structures by writing natural language grammars. It is
for assessing and comparing grammars, for typology, and for fine-tuning of grammars.

It uses two command relations for every element of grammar, one on
syntactic command, one on semantic command. The guide explains these command relations.
    Much more is covered in the book <a href="https://www.cambridgescholars.com/product/978-1-0364-1830-4">Connecting Social Semiotics, Grammaticality, and Meaningfulness: The Verb</a>.

It works in Linux, MacOS, and Windows 11 using Window's Linux native apps;  for example in Window's WSL, MacOS, Arch, Ubuntu, Debian, Fedora and RedHat-based distributions.

You can start using WSL right off the shelf if you have late Windows 11 upwards; check out <a href="https://learn.microsoft.com/en-us/windows/wsl/install">Window's WSL</a>. 

YOU NEED:

1. <a href="https://www.python.org/">Python 3.8 upwards</a>. I recommend stable versions.

2. <a href="https://pip.pypa.io/en/stable/installation/">pip</a>. This is the maintainer of python libraries that we need.

   PLEASE USE THE get-pip.py METHOD (the second method in the pip install page) TO MAKE SURE YOUR pip IS THE ONE YOU USE FOR THE python THAT YOU INTEND TO USE FOR TheBencch.

   TO DO THAT, GET get-pip.py AS EXPLAINED IN THE PAGE, THEN DO <code>python.x get-pip.py</code> WHERE python.x IS THE PYTHON YOU INTEND TO USE.

   (Why are we doing this? Because python's infamous ensurepip library is not available in every linux, and pyenv is more of a hack than software engineering). 

3. <a href="https://git-scm.com/downloads">git</a>. This is the maintainer of the tool overall.

TO INSTALL: 

NOTE: The installer does not require sudo password or any password, and needs no package manager.

1.  Open a terminal app, and change directory to where you want to install the tool. Then do:

   <code>git clone https://github.com/bozsahin/thebench</code>

   This will create <code>thebench</code> subdirectory in that directory.

2.  In the terminal, <b>AND in <code>thebench</code> directory</b>, do  the following:

   <code>./bench.sh install mypython mypip</code>

where <code>mypython</code> is your python executable, for example <code>python3.10</code> or <code>python3.11</code>, etc; <mypip> is the pip for that, e.g. <code>pip3.10</code> or <code>pip3.11</code>.

This will install TheBench, the Python libraries needed, and SBCL as Common Lisp, which is used by one of the python libraries and TheBench processor. You have also made the tool available from anywhere in your machine. You get python's library manager <code>pip</code> as well if you don't already have it (checked by the installer).

TO USE: 

just do anywhere in your machine from a terminal app:

<code>thebench</code>

Use UP and DOWN keys for command recall. TheBench keeps its specific command history in <code>.thebenchhistory</code>
file at your home directory.

If you experience problems accessing <code>thebench</code> this way, you are probably using a different shell.
In this case, do <code>bash</code>, then do the above. Bash is available in all linux platforms, unlike other shells.

PYTHON UPGRADE NOTE:

If you want to move to another python for this tool, say python3.xx, and have that python installed, then 
re-run the install script FROM thebench home as

<code>./bench.sh reset python3.xx pip3.xx</code>

to change to that python. It will make sure its <code>pip</code> library manager is installed and refreshes TheBench libraries for that python. 

TO DEVELOP A GRAMMAR:

Just use your favourite plain text editor and enter a grammar. Then follow help (the `? command') of TheBench to process it.

I suggest you develop grammars NOT in <code>thebench</code> folder to avoid override in upgrades.
If you uninstall TheBench, the repo directory is deleted as well, so you might lose data if you work in this directory.

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

<code>~/.local/bin/thebench</code> This is the executable that allows access to TheBench for anyone on your system from anywhere.

Please do not alter them manually.

TO UNINSTALL:

Change to repo's local directory, and do

   <code>./bench.sh uninstall</code>

This will remove the official TheBench files and auxiliary directories. It won't touch
your python or SBCL. To remove them, use your package manager. 


My email is somewhere in the webosphere to google; just drop me an email if you need assistance.
