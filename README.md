# TheBench
This is a tool to study natural language structures by writing natural language grammars. It is
for writing, assessing and comparing grammars, for typology and for fine-tuning of grammars.

It uses two command relations for every element of grammar, one on syntactic command, one on semantic command. 
All intra- and cross-linguistic variation is claimed to arise from their local interaction.

The guide explains these command relations. Much more is covered in the book <a href="https://www.cambridgescholars.com/product/978-1-0364-1830-4">Connecting Social Semiotics, Grammaticality, and Meaningfulness: The Verb</a>.

SOFTWARE NEEDED:

   A common Linux distro, MacOS or Windows11 and up.

TO INSTALL: 
 
1. Make sure your OS has the basics: `curl` and `git`.

    -In Linux, do the following one by one to find out if you have them:

     <pre><code> 
        command -v curl
        command -v git
     </code></pre> 

        If you get a blank response, you don't have them. Use your installer to install them before proceeding.

    -In MacOS, open a terminal app and get `brew` (you already have `curl` and `git`, but need an installer):

     <pre><code>
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
     </code></pre>

    -In Windows, 11 and up, Go to Microsoft Store and install the linux called `Ubuntu` (any version).
        Click on the app, and set up a local user for yourself. 
        Then check `curl` and `git` as in Linux above.

        If `curl` or `git` is not available, install them with your Ubuntu's installer by doing the following:
        <pre><code>
        sudo apt install curl 
        sudo apt install git
        </code></pre>

2.  Open a terminal app (for W11, do that in the ubuntu app), and change directory to where you want to install the tool. Then do:

   <pre><code>git clone https://github.com/bozsahin/thebench</code></pre>

   This will create `thebench` subdirectory in that directory.

3.  Finally, do  the following in the terminal:

   <pre><code>
   cd thebench
   ./install-bench.sh   
   </code></pre>
   

This will install TheBench, a specific isolated Python for it (currently python3.11), Python libraries needed, SBCL as Common Lisp, which is used by one of the python libraries and TheBench processor. You have also made the tool available from anywhere in your machine. In case you have another python in your machine, even the same one that `TheBench` uses, it is untouched.

TO USE: 

just do anywhere in your machine from a terminal app:

<code>thebench</code>

Use UP and DOWN keys for command recall. TheBench keeps its specific command history in `.thebenchhistory`
file at your home directory.

USE ADVICE: 

Please keep your work files outside TheBench folder. That would make your life easier. That way, when you uninstall the tool, your work won't be lost.

TO DEVELOP A GRAMMAR:

Just use your favourite PLAIN TEXT editor and enter a grammar. Then follow help (the `? command') of TheBench to process it.
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
