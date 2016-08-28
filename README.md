# Geospatial Jupyter in Docker X Fedora

[![Docker Automated build](https://img.shields.io/docker/automated/weihanglo/geo-jupyter.svg)](https://hub.docker.com/r/weihanglo/geo-jupyter)
[![Travis](https://img.shields.io/travis/weihanglo/geo-jupyter.svg)](https://travis-ci.org/weihanglo/geo-jupyter)

When [Fedora][1] meets [Jupyter][2], [Docker][3]ness will show you the [spatial][4] light.

[1]: https://getfedora.org/
[2]: http://jupyter.org/
[3]: https://www.docker.com/
[4]: https://en.wikipedia.org/wiki/Geospatial_analysis

## What is inside

- Python 3.5.x
- R 3.3.x
- Jupyter 5.x (with Python and R kernels)
- GDAL library
- An unprivileged user `nbuser` with ownership over `home/nbuser`
- A Jupyter Notebook runs at `http://localhost:8888`
- Other pre-installed [R pakcages](Rpackages.R) and [Python packages](http://example.com)

## Get Started

Ensure you have **Docker** installed and run in background/daemon mode. 
For **macOS** user, it is recommended to download the new [docker for mac][docker-mac] via `hombrew-cask`.

```
brew cask install docker
```

[docker-mac]: https://docs.docker.com/docker-for-mac/


After the installation,  do

```
docker run -d -p 8888:8888 weihanglo/geo-jupyter
```

which will launch a Jupyter Notebook server instance in `http://localhost:8888`.
Just open your **firefox** and work as normal!

If you need to share files/directories between docker container and the host machine, use `-v` or `--volume` flag to link the two volumes:

```bash
docker run -d -p 8888:8888 -v /path/to/host:/home/notebooks weihanglo/geo-jupyter
```

or simplify the host path to current work directory:

```bash
docker run -d -p 8888:8888 -v $(pwd):/home/notebooks weihanglo/geo-jupyter
```

You could also run alternative commands in the container.

```bash
docker run -it --rm weihanglo/geo-jupyter bash
```

## Why not use official Jupyter Image

Because I am a big fan of **Fedora**!!

## License

MIT
