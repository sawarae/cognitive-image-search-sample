FROM sawarae/miniconda:py39cuda124
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV LD_LIBRARY_PATH /usr/lib64:$LD_LIBRARY_PATH
RUN apt install -y git libgl1-mesa-glx libglib2.0-0 libsm6 libxext6 libxrender-dev

# conda環境でpip install
RUN conda init && \
    echo "conda activate py39" >> ~/.bashrc
ENV CONDA_DEFAULT_ENV py39 && \
    PATH /opt/conda/envs/py39/bin:$PATH
SHELL ["conda", "run", "-n", "py39", "/bin/bash", "-c"]
RUN pip install tensorflow==2.16.1 azure-search-documents==11.3.0 flask==2.3.2