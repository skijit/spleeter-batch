## Introduction
- Refer to [Spleeter](https://github.com/deezer/spleeter)
- Batch invocation of spleeter: runs spleeter on all audio files in a given directory

## Dependencies
- docker
- a bash shell
- works on mac and linux (including WSL2)

## Getting Started Manually
- `docker pull deezer/spleeter:3.8`
  - but I guess you could build it from github as well
- `mkdir spleeter`
- `cd spleeter`
- move an audio file into spleeter directory
- `mkdir output`
- running with 2 channel stem:
  - `docker run -v $(pwd)/output:/output -v $(pwd):/input deezer/spleeter:3.8 separate -o /output input/Link_Ray-Fire_and_Brimstone.wav`
  - does a 2 channel stem creation into output/Link_Ray-Fire_and_Brimstone
- running with 4 channel stem and in the windows fs, with custom output filename format:
  - `docker run -v /mnt/c/Users/skijit/Desktop/export-test:/output -v /mnt/c/Users/skijit/Desktop/export-test:/input deezer/spleeter:3.8 separate -o /output -p spleeter:4stems input/Link_Ray-Fire_and_Brimstone.wav -f {filename}/4-stems/{instrument}.{codec}`

## Using the Automation
- `spleet-dir <directory_path_containing_only_music_files>`
