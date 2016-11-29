# atomconda - data science in docker
This container bundles together Atom, Hydrogen, and Anaconda3 for an entire portable, reproducible data science platform. Anaconda provides the data science tools, Atom provides the editor, and Hydrogen provides in-line execution via Anaconda's kernel.

# running the container
Must run `xhost +` before executing the docker command below.

`docker run \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v /path/to/project:/opt/project \
-e DISPLAY=unix$DISPLAY \
name \
/opt/project`

# to-do

* consider pulling the kernel out into a separate container
* figure out how to launch directly into any path specified with `-v`
* deal with `xhost` vulnerability
