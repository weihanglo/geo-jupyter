GeoSpatial Jupyter Notebook in Docker X Fedora
==============================================

### When [Fedora](https://getfedora.org/) meets Jupyter, Dockerness will show you the spatial light.

## What is inside

- Python 3.5.x
- R 3.3.x
- Jupyter 5.x (with Python and R kernels)
- GDAL library
- An unprivileged user `nbuser` with ownership over `home/nbuser`
- A Jupyter Notebook runs at `http://localhost:8888`
- Other pre-installed [R pakcages](Rpackages.R) and [Python packages](http://example.com)


## Get Started

Ensure you have [Docker](https://www.docker.com/) installed and run in background/daemon mode.
Then do

```
docker run -d -p 8888:8888 weihanglo/geo-jupyter
```

which will launch a Jupyter Notebook server instance in `http://localhost:8888`.
Just open your **firefox** and work as normal!

You could also run alternative commands in the container.

```
docker run -it --rm weihanglo/geo-jupyter bash
```


## Why not use the official Jupyter Notebook Image

Because I am a big fan of **Fedora**!!

## License

MIT
