# Music Sniper

This repo is the backend for [Music Sniper](https://github.com/mickmister/music-sniper), a music collaboration application.

# Environment Setup

1. Clone/fork repo

2. Install docker
https://docs.docker.com/v17.09/engine/installation

3. In the directory of the repo, run `docker-compose up`

When running this again in the future, you may get an error "Server already running". If this happens need to run `docker-compose rm -f rails` first. Or you can run the small script `./run` after running `chmod a+x run` one time.

Visit the [frontend repo](https://github.com/mickmister/music-sniper) for information on deploying the frontend application.
