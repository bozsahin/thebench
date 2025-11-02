# TheBench
This is a tool to study natural language structures by writing natural language grammars. It is
for writing, assessing and comparing grammars, for typology and for fine-tuning of grammars.

It uses two command relations for every element of grammar, one on syntactic command, one on semantic command. 
All intra- and cross-linguistic variation is claimed to arise from their local interaction.

The guide in this repo explains these command relations. Much more is covered in the book <a href="https://www.cambridgescholars.com/product/978-1-0364-1830-4">Connecting Social Semiotics, Grammaticality, and Meaningfulness: The Verb</a>.

SOFTWARE NEEDED:

   A common Linux distro, MacOS or Windows11 and up.

TO INSTALL (involves 2 steps): 
 
1. In Windows 11 and up, go to <a href="https://apps.microsoft.com/">Microsoft Store</a> and install the linux called `Ubuntu` (any version).
Click on the app, and set up a local user for yourself. 

In Linux/MacOS, there is nothing to do in this step.

2.  Open a terminal app (for W11, do that in the ubuntu app), and CHANGE DIRECTORY to where you want to install the tool. Then do one of the following:

    2.1 If you know your way around `git` and `linux` installs, clone this repo and run the installer in the repo directory: `./install-thebench.sh`

    2.2 Or do the following one by one to install TheBench:

```bash
    curl -LO https://github.com/bozsahin/thebench/install-thebench.sh && chmod +x install-thebench.sh
    ./install-thebench.sh newbie
```
The installer checks and installs if not present the following: `brew` (for MacOS only), `curl`, `git`, `SBCL`, `python3.11`, its `pip`, and TheBench's python libraries.

TO USE: 

just do anywhere in your machine from the terminal app:

```bash
    thebench
```
Use UP and DOWN keys for command recall. TheBench keeps its specific command history in `.thebenchhistory`
file at your home directory.

USE ADVICE: 

Please keep your work files outside TheBench folder. That would make your life easier. That way, when you uninstall the tool, your work won't be lost.

TO DEVELOP A GRAMMAR:

Just use your favourite PLAIN TEXT editor and enter a grammar. Then follow help (the `? command`) of TheBench to process it.
I suggest you develop grammars NOT in `thebench` folder to avoid override in upgrades.
If you uninstall TheBench, the repo directory is deleted as well, so you might lose data if you work in this directory.

TO UPGRADE:

in your `thebench` directory do

   `git pull`

If git complains about conflicts, the usual suspect is local changes to `bench.user.lisp` file.
Move it somewhere and do the upgrade, then put it back. The contents of this file is not crucial to the tool,
but its presence and location are.

NOTES FOR THE DISCERNING TECHIE:

The installer
creates some local files to keep things organized and available from
anywhere in the user space. There are THREE of them: (`~' points to your home directory in the linux world).

`~/.thebenchhome` This file contains the full path of TheBench repository in your installation.

`~/.thebenchhistory` This file contains history of your command use for easier recall.

` ~/.local/bin/thebench` This is the executable that allows access to TheBench from anywhere in your personal account. 

Please do not alter them manually.

TO UNINSTALL:

Just delete the folder `thebench`.

My email is somewhere in the webosphere to google; just drop me an email if you need assistance.

Enjoy. -Cem
