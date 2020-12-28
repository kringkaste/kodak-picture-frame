# Image preperation for Kodak picture frame

This docker image prepares pictures for a Kodak picture frame.

All pictures will be prepared as follow:

 - Rotating based on their EXIF meta data.
 - Stripping the EXIF meta data from the pictures.
 - Resizing to fit in 800x800, keeping the aspect ratio.

## Build

```
docker build . -t kringkaste/kodak-piture-frame
```

## Run

Run this command within the image folder, it will create a new folder named "converted-%Y-%m-%d-%H-%M-%S" with the converted pictures:

```
docker run "${PWD}:/images" --rm -it kringkaste/kodak-piture-frame /usr/local/bin/run.sh
```
