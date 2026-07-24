# TheBench

This is a tool to study natural language structures by writing natural language grammars. It is for writing, assessing and comparing grammars, for typology and for fine-tuning of grammars.

It uses two command relations for every element of grammar, one on syntactic command, one on semantic command. All intra- and cross-linguistic variation is claimed to arise from their local interaction.

The guide in this repo explains these command relations. More comprehensive description of the idea, including its analyses of linguistic diversity, is in the book [Connecting Social Semiotics, Grammaticality, and Meaningfulness: The Verb](https://www.cambridgescholars.com/product/978-1-0364-1830-4)

## Installation (thanks to Deniz Akdemir for Docker help)

### Docker

#### 0. Install Docker

Go to <https://www.docker.com/products/docker-desktop/> and download the Docker Desktop app for your OS.

#### 1. Pull the TheBench Docker image

Click on the Docker Desktop app. This starts the Docker Engine (deamon). Then do:

```bash
docker pull bozsahin/thebench:main
```

#### 2. Create the TheBench shortcuts (one for initiation, one for resumption of work later on)

Do the following ONCE to create a permanent aliases:

* **Linux:**

  ```bash
  echo 'alias thebench-init="docker run -it --name thebench-session -v \"\$(pwd)\":/work -w /work bozsahin/thebench:main"' >> ~/.bashrc && source ~/.bashrc
  echo 'alias thebench="docker start -ai thebench-session"' >> ~/.bashrc && source ~/.bashrc
  ```

* **Mac:**
  
  ```bash
  echo 'alias thebench-init="docker run -it --name thebench-session -v \"\$(pwd)\":/work -w /work bozsahin/thebench:main"' >> ~/.zshrc && source ~/.zshrc
  echo 'alias thebench="docker start -ai thebench-session"' >> ~/.zshrc && source ~/.zshrc
  ```

* **Windows (Powershell v7 onwards):**

  Run powershell. In it edit the $PROFILE file:

  ```powershell
  notepad $PROFILE
  ```
  Paste the following in it:
  
  ```powershell
  function thebench-init {
    docker run -it --name thebench-session `
        -v "${PWD}:/work" `
        -w /work `
        bozsahin/thebench:main @args
  }
  function thebench {
    docker start -ai thebench-session
  }
  ```

 Save and exit. Then reload the profile:

 ```powershell
 . $PROFILE
 ```

After this, you can simply type:

`thebench-init` in any terminal, inside any folder, and the app will initiate thebench from the current directory.

`thebench` in any terminal, inside any folder, and the app will resume thebench work from the current directory.

#### To Upgrade

On the terminal, run

   `docker pull bozsahin/thebench`

#### To Uninstall

1. Remove the alias / function

* Linux (bash)

```bash
sed -i '/alias thebench-init=/d' ~/.bashrc && source ~/.bashrc
sed -i '/alias thebench=/d' ~/.bashrc && source ~/.bashrc
```

* macOS (zsh)

```bash
sed -i '' '/alias thebench-init=/d' ~/.zshrc && source ~/.zshrc
sed -i '' '/alias thebench=/d' ~/.zshrc && source ~/.zshrc
```

* Windows (PowerShell)
Open your PowerShell profile with `notepad $PROFILE`, delete the lines containing `function thebench... { ... }`, save the file, then restart PowerShell.

2. Remove the Docker image

```bash
docker rmi bozsahin/thebench:main
```

3. (Optional) Uninstall Docker Desktop

Follow [the official guides](https://docs.docker.com/desktop/uninstall/).



## Using TheBench

You can run `thebench` and `thebench-init`  in any directory you wish to use TheBench.

Use UP and DOWN keys for command recall. TheBench keeps its specific command history in `.thebenchhistory` file at your home directory.

In case the docker cannot run thebench, you may reinitiate it using `thebench-init`. KEEP IN MIND THAT WHEN YOU DO THAT YOUR PREVIOUS RESULTS AND COMMAND HISTORY WILL BE LOST.

### How to develop a grammar

Just use your favourite PLAIN TEXT editor and enter a grammar. Then follow help (the `? command`) of TheBench to process it.
I suggest you develop grammars NOT in `thebench` folder to avoid override in upgrades.
If you uninstall TheBench, the repo directory is deleted as well, so you might lose data if you work in this directory.

My email is somewhere in the webosphere to google; just drop me an email if you need assistance.

Enjoy. -Cem
