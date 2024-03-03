FROM ncbi/sra-tools

# Install python/pip, sagemaker-training toolkit
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 python3-dev gcc musl-dev linux-headers && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools sagemaker-training
