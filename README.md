# TheBench

This is a tool to study natural language structures by writing natural language grammars. It is for writing, assessing and comparing grammars, for typology and for fine-tuning of grammars.

It uses two command relations for every element of grammar, one on syntactic command, one on semantic command. All intra- and cross-linguistic variation is claimed to arise from their local interaction.

The guide in this repo explains these command relations. Much more is covered in the book [Connecting Social Semiotics, Grammaticality, and Meaningfulness: The Verb](https://www.cambridgescholars.com/product/978-1-0364-1830-4)

## Installation (Many thanks to Deniz Akdemir for Docker help)

### Docker

#### 0. Install Docker

Go to <https://www.docker.com/products/docker-desktop/> and download the Docker Desktop app for your OS.

#### 1. Pull the TheBench Docker image

Click on the Docker Desktop app. Then do:

```bash
docker pull bozsahin/thebench:main
```

#### 2. Create the TheBench shortcut

Run this command once to create a permanent alias:

* **Linux:**

  ```bash
  echo 'alias thebench="docker run -it -v \"\$(pwd)\":/work -w /work bozsahin/thebench:main"' >> ~/.bashrc && source ~/.bashrc
  ```

* **Mac:**
  
  ```bash
  echo 'alias thebench="docker run -it -v \"\$(pwd)\":/work -w /work bozsahin/thebench:main"' >> ~/.zshrc && source ~/.zshrc
  ```

* **Windows (Powershell):**

  ```powershell
  Add-Content -Path $PROFILE -Value 'function thebench { docker run -it -v "$PWD:/work" -w /work bozsahin/thebench:main $args }'
  ```

After this, you can simply type `thebench` in any terminal, inside any folder, and the app will run using the current directory.

#### To Upgrade

On the terminal, run

   `docker pull bozsahin/thebench`

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
docker rmi bozsahin/thebench:main
```

3. (Optional) Uninstall Docker Desktop

Follow [the official guides](https://docs.docker.com/desktop/uninstall/).



## Using TheBench

You can run `thebench` in any directory you wish to use TheBench.

Use UP and DOWN keys for command recall. TheBench keeps its specific command history in `.thebenchhistory` file at your home directory.

### How to develop a grammar

Just use your favourite PLAIN TEXT editor and enter a grammar. Then follow help (the `? command`) of TheBench to process it.
I suggest you develop grammars NOT in `thebench` folder to avoid override in upgrades.
If you uninstall TheBench, the repo directory is deleted as well, so you might lose data if you work in this directory.

My email is somewhere in the webosphere to google; just drop me an email if you need assistance.

Enjoy. -Cem
