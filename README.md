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

#### 2. Create the TheBench shortcut.

Do the following ONCE to create a permanent alias:

* **Linux:**

```bash
 cat >> ~/.bashrc <<'EOF'

 function thebench {
    full="$PWD"
    safe=$(printf '%s' "$full" | sed 's/[^A-Za-z0-9_.-]/_/g')
    name="thebench-$safe"

    if docker ps -aq -f "name=^${name}$" | grep -q .; then
        docker start -ai "$name"
    else
        docker run -it \
            --name "$name" \
            -v "$PWD:/work" \
            -w /work \
            bozsahin/thebench:main "$@"
    fi
 }
EOF
```

Then do

```bash
source ~/.bashrc
```

* **Mac:**
  
```zsh
cat >> ~/.zshrc <<'EOF'

function thebench {
    full="$PWD"
    safe=$(printf '%s' "$full" | sed 's/[^A-Za-z0-9_.-]/_/g')
    name="thebench-$safe"

    if docker ps -aq -f "name=^${name}$" | grep -q .; then
        docker start -ai "$name"
    else
        docker run -it \
            --name "$name" \
            -v "$PWD:/work" \
            -w /work \
            bozsahin/thebench:main "$@"
    fi
}
EOF
```

Then do

```bash
source ~/.bashrc
```

* **Windows (Powershell v7 onwards):**

  Run powershell. In it edit the $PROFILE file:

```powershell
  notepad $PROFILE
```
  Paste the following in it:
  
```powershell
  function thebench {
    $full = (Get-Location).Path
    $safe = ($full -replace '[^A-Za-z0-9_.-]', '_')
    $name = "thebench-$safe"

    $exists = docker ps -aq -f "name=^${name}$"

    if ($exists) {
        docker start -ai $name
    }
    else {
        docker run -it `
            --name $name `
            -v "${PWD}:/work" `
            -w /work `
            bozsahin/thebench:main @args
         }
    }
```

 Save and exit. Then reload the profile:

```powershell
 . $PROFILE
```

After this, you can simply type:

`thebench` in any terminal, inside any folder, and the app will start or resume thebench work from the current directory.

#### To Upgrade

On the terminal, run

   `docker pull bozsahin/thebench`

#### To Uninstall

1.Remove the Docker image

```bash
docker rmi bozsahin/thebench:main
```

2. (Optional) Remove thebench function from your `~/.bashrc`. Uninstall Docker Desktop

Follow [the official guides](https://docs.docker.com/desktop/uninstall/).


## Using TheBench

Use UP and DOWN keys for command recall. TheBench keeps its specific command history.

KEEP IN MIND THAT YOUR COMMAND HISTORY IS KEPT SEPARATELY DEPENDING ON FROM WHICH WORKING DIRECTORIES YOU HAVE RUN thebench.

### How to develop a grammar

Just use your favourite PLAIN TEXT editor and enter a grammar. Then follow help (the `? command`) of TheBench to process it.
I suggest you develop grammars NOT in `thebench` folder to avoid overrides and git conflicts in upgrades.
If you uninstall TheBench, the repo directory is deleted as well, so you might lose data if you work in this directory.

My email is somewhere in the webosphere to google; just drop me an email if you need assistance.

Enjoy. -Cem
