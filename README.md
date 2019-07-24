MrBiTs SciPy Geo and Maps
=========================

Docker image for Data Science with Python, with emphasis in maps, geodata and astronomical calculations.

This image is based on Unidata-Python and Jupyter-Notebook Docker images.

By default, run a container based on this image will raise a Jupyter Notebook with Python 2 and Python 3 kernels, with:

- NumPy
- Pandas
- Matplotlib
- Cartopy
- Basemap (Matplotlib module)
- Geopandas
- Terminals
- Jupyter-nbextensions
- PyEphem
- Astropy
- Pylunar

How to run
----------

Due to permissions, run docker with a non-root user will cause errors in run.sh. Please use your root account.

Pull image with ```docker pull mrbits/scipy-geo-maps:latest```

Run with:

```docker run --rm -d -p 8888:8888 --name scipy-geo-maps -v /docker/jovyan:/home/jovyan mrbits/scipy-geo-maps:latest```

or with provided **run.sh**.

Mapping container /home/jovyan directory will allow you to save notebooks localy on your computer. Notebooks will be saved in /docker/jovyan directory.

To use running container with bash or iPython, use:

```docker exec -it scipy-geo-maps ipython```

or

```docker exec -it scipy-geo-maps /bin/bash```

MIT License
===========

Copyright 2019 MrBiTs <mrbits.dcf@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

- The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

