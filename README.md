MrBiTs SciPy Geo and Maps
=========================

Docker image for Data Science with Python. 

This image is based on Unidata-Python and Jupyter-Notebook Docker images.

By default, run a container based on this image will raise a Jupyter Notebook with Python 2 and Python 3 kernels, with:

- NumPy
- Pandas
- Matplotlib
- Cartopy
- Basemap (Matplotlib module)
- Geopandas

How to run
----------

Pull image with ```docker pull mrbits/scipy-geo-maps:latest```

Run with:

```docker run --rm -d -p 8888:8888 --name scipy-geo-maps -v $(pwd)/jovyan:/home/jovyan mrbits/scipy-geo-maps:latest```

Mapping container /home/jovyan directory will allow you to save notebooks localy on your computer.

To use running container with bash or iPython, use:

```docker exec -it scipy-geo-maps ipython```

or

```docker exec -it scipy-geo-maps /bin/bash```
