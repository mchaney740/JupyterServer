# Base image and dir setup
FROM debian:latest

WORKDIR /mnt/Jupyter

COPY . /mnt/Jupyter
# Expose port 8888
EXPOSE 8888

# Setting up venv
RUN apt-get update && \
    apt-get install -y python3-virtualenv && \
    mkdir /mnt/Jupyter/Projects && \
    python3 -m virtualenv JupyterEnv && \
    . /mnt/Jupyter/JupyterEnv/bin/activate && \
    pip install -U jupyterlab




CMD ["bash"]
