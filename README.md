Latexinkice container
======================
[https://hub.docker.com/repository/docker/icewire314/latexinkice](https://hub.docker.com/repository/docker/icewire314/latexinkice)

This container holds latex, inkscape and icemaker all in one container

Why should I use this container?
-----

- Easy setup, compile immediately after image download
- Preserves UID and GID of local user
- Use container like local command: `latexdockercmd.sh pdflatex main.tex`
- Inkscape command: `latexdockercmd.sh inkscape --help`
- Icemaker command: `latexdockercmd.sh icemaker -help`

Quick Setup
-----------

Use Latex, Inkscape or Icemaker (all in command line mode) using docker:
```bash

# Download the command wrapper from github
# Make it executable
chmod +x latexdockercmd.sh

# Compile using pdflatex (docker will pull the image automatically)
./latexdockercmd.sh pdflatex main.tex

# Or use Inkscape
./latexdockercmd.sh inkscape --help

# Or use Icemaker
./latexdockercmd.sh icemaker -help
```

Requirements
------------

First, add your local user to docker group (should already be the case):
```bash
sudo usermod -aG docker YOURUSERNAME
```

The `latexdockercmd.sh` will use your current user and group id to compile.


Daemon setup
------------

If you're working on source in latex, you might want to compile it multiple times and don't want to start a container each time.

```
cd my_latex_source

# Start a daemon container on this path, it accepts commands from latexdockerdaemoncmd.sh
latexinkicedaemon.sh

# Execute the command in the daemon container, only the daemon container is running
latexdockerdaemoncmd.sh pdflatex main.tex

# Stop the daemon
docker stop latex_daemon
```

License
-------
This docker container is based on the container created by blang...

[https://github.com/blang/latex-docker](https://github.com/blang/latex-docker)

See [LICENSE](LICENSE) file.
