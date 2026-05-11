# TheBench

This is a tool to study natural language structures by writing natural language grammars. It is for writing, assessing and comparing grammars, for typology and for fine-tuning of grammars.

It uses two command relations for every element of grammar, one on syntactic command, one on semantic command. All intra- and cross-linguistic variation is claimed to arise from their local interaction.

The guide in this repo explains these command relations. Much more is covered in the book [Connecting Social Semiotics, Grammaticality, and Meaningfulness: The Verb](https://www.cambridgescholars.com/product/978-1-0364-1830-4)

## Installation Methods

### Docker

#### 0. Install Docker

Go to <https://www.docker.com/products/docker-desktop/> and download the Docker Desktop app for your OS.

#### 1. Pull the TheBench Docker image

```bash
docker pull denizakdemir/thebench:main
```

#### 2. Create the TheBench shortcut

Run this command once to create a permanent alias:

* **Linux:**

  ```bash
  echo 'alias thebench="docker run -it --rm -v \"\$(pwd)\":/work -w /work denizakdemir/thebench"' >> ~/.bashrc && source ~/.bashrc
  ```

* **Mac:**
  
  ```bash
  echo 'alias thebench="docker run -it --rm -v \"\$(pwd)\":/work -w /work denizakdemir/thebench"' >> ~/.zshrc && source ~/.zshrc
  ```

* **Windows (Powershell):**

  ```powershell
  Add-Content -Path $PROFILE -Value 'function thebench { docker run -it --rm -v "$PWD:/work" -w /work denizakdemir/thebench $args }'
  ```

After this, you can simply type `thebench` in any terminal, inside any folder, and the app will run using the current directory.

#### To Upgrade

On the terminal, run

   `docker pull denizakdemir/thebench`

#### To Uninstall

1. Remove the alias / function

* Linux (bash)

```bash
sed -i '/alias thebench=/d' ~/.bashrc && source ~/.bashrc
```

* macOS (zsh)

```bash
sed -i '' '/alias thebench=/d' ~/.zshrc && source ~/.zshrc
```

* Windows (PowerShell)
Open your PowerShell profile with `notepad $PROFILE`, delete the line containing `function thebench { ... }`, save the file, then restart PowerShell.

2. Remove the Docker image

```bash
docker rmi denizakdemir/thebench:latest
```

3. (Optional) Uninstall Docker Desktop

Follow [the official guides](https://docs.docker.com/desktop/uninstall/).

**Use Advice for Docker installations:**

* **Your Files:** Any grammar files you create in the local folder you run `thebench` in will be instantly available inside TheBench, and they will be safe when you exit.

* **Command History:** Docker containers are disposable (`--rm`), but this one is wired to save your command history. You will notice a hidden `.thebenchhistory` file appear in your working folder alongside your grammar files.

### Native

#### 1. (THIS STEP IS FOR WINDOWS USERS ONLY) Installing the Windows Subsystem for Linux

TheBench is written to work as a Linux program. Therefore we need a translation layer named Windows Subsystem for Linux (WSL) to use it in Windows.

If you're a Windows 11 user, go to the [Microsoft Store](https://apps.microsoft.com/) and install `Ubuntu`. Click on the app, and set up a local user for yourself.

If you use Linux/MacOS, there is nothing to do in this step.

#### 2. Installing TheBench

Open a terminal app (for W11, do that in the ubuntu app), and change your directory to where you want to install the tool by running `cd my_directory`. Then run the following code:

```bash
curl -LO https://raw.githubusercontent.com/bozsahin/thebench/main/install-thebench.sh && chmod +x install-thebench.sh && ./install-thebench.sh
```

The installer checks and installs if the following: `thebench`, `brew` (for MacOS only), `curl`, `git`, `SBCL`, `python3.11`, its `pip`, and TheBench's python libraries is not present in your system. It then installs TheBench.

> [!TIP]
> Please keep your work files outside TheBench folder. That would make your life easier. That way, when you uninstall the tool, your work won't be lost.

> [!NOTE]
> The installer creates some local files to keep things organized and available from anywhere in the user space. There are THREE of them: (`~' points to your home directory in the linux world).
>
> `~/.thebenchhome` This file contains the full path of TheBench repository in your installation.
>
> `~/.thebenchhistory` This file contains history of your command use for easier recall.
>
> ` ~/.local/bin/thebench` This is the executable that allows access to TheBench from anywhere in your personal account.
>
> Please do not alter them manually.

#### To Upgrade:

In your `thebench` directory, run

   `git pull`

If git complains about conflicts, the usual suspect is local changes to `bench.user.lisp` file. Move it somewhere and do the upgrade, then put it back. The contents of this file is not crucial to the tool, but its presence and location are.

#### To Uninstall

Just delete the folder `thebench`.


## Using TheBench

You can run `thebench` in any directory you wish to use TheBench.

Use UP and DOWN keys for command recall. TheBench keeps its specific command history in `.thebenchhistory` file at your home directory.

### How to develop a grammar

Just use your favourite PLAIN TEXT editor and enter a grammar. Then follow help (the `? command`) of TheBench to process it.
I suggest you develop grammars NOT in `thebench` folder to avoid override in upgrades.
If you uninstall TheBench, the repo directory is deleted as well, so you might lose data if you work in this directory.

My email is somewhere in the webosphere to google; just drop me an email if you need assistance.

Enjoy. -Cem
