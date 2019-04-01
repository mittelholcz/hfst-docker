# HFST-DOCKER

Alpine based Docker image for [Helsinki Finite-State Technology](https://github.com/hfst/hfst).

## Features

* HFST version: [3.15.0](https://github.com/hfst/hfst/releases/tag/v3.15.0)
* python3 bindings
* minimalized image size:
  * use multi-stage build
  * stripped HFST install (see [Installation from the sources](https://github.com/hfst/hfst#installation-from-the-sources))

## Usage

```sh
docker pull mittelholcz/hfst:hfst-v3.15.0
docker run --rm -it mittelholcz/hfst:hfst-v3.15.0 sh
```
