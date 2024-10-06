# First Github Project
## This Dockerfile creates a Jupyter Lab server running on tcp port 8888. It is intended to run with a volume mount mapped to a network share (samba) so that all project files are centralized and adding/removing files are simplified.
## The container works with Podman/Docker and the usage is the same for both as of 7/1/2024. 

### To build and run the Docker container locally using Podman,follow these steps:
Edit the config.py file and set your own password for the jupyter server
```bash
nano config.py
```
Build the image. The "." is used if your are in the same directory as the Dockerfile. Otherwise, specify the path.
```bash
podman build -t jupyterlab:latest .
```
Create a container and specify the host path of your samba share or folder where you will drop your project files into. (Note: the --restart=always option only works in docker or in podman if you are running as root/systemd)
```bash
podman run -itd --name JupyterLabs -p 8888:8888 --volume /path/to/samba/share:/mnt/Jupyter/Projects --restart=always jupyterlab
```
Now enter the container
```bash
podman exec -it JupyterLabs /bin/bash
```
Finally. run the Run_Jupyter.sh to start the Jupyter Server. Navigate to localhost:8888 and use the password you set in config.py
```bash
./Run_Jupyter.sh
```

Enjoy
