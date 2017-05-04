## stylelint Docker Container.
[![Docker Pulls](https://img.shields.io/docker/pulls/rvannauker/stylelint.svg)](https://hub.docker.com/r/rvannauker/stylelint/) [![Docker Stars](https://img.shields.io/docker/stars/rvannauker/stylelint.svg)](https://hub.docker.com/r/rvannauker/stylelint/) [![](https://images.microbadger.com/badges/image/rvannauker/stylelint:latest.svg)](https://microbadger.com/images/rvannauker/stylelint:latest) [![GitHub issues](https://img.shields.io/github/issues/RichVRed/docker-stylelint.svg)](https://github.com/RichVRed/docker-stylelint) [![license](https://img.shields.io/github/license/RichVRed/docker-stylelint.svg)](https://tldrlegal.com/license/mit-license)

Docker container to install and run stylelint

### Installation / Usage
1. Install the rvannauker/stylelint container:
```bash
docker pull rvannauker/stylelint
```
2. Run stylelint through the stylelint container:
```bash
sudo docker run --rm --volume $(pwd):/src --name="stylelint" "rvannauker/stylelint"
```

### Download the source:
To run, test and develop the SASS Dockerfile itself, you must use the source directly:
1. Download the source:
```bash
git clone https://github.com/RichVRed/docker-stylelint.git
```
2. Build the container:
```bash
sudo docker build --force-rm --tag "rvannauker/stylelint" --file stylelint.dockerfile .
```
3. Test running the container:
```bash
 $ docker run rvannauker/stylelint --help
```