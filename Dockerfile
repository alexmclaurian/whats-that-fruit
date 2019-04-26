ROM python:3.6-slim-stretch

RUN apt update
RUN apt install -y python3-dev gcc

RUN pip install torch_nightly -f https://download.pytorch.org/whl/nightly/cpu/torch_nightly.html
RUN pip install fastai

RUN pip install starlette uvicorn python-multipart aiohttp

ADD fruits-project.py fruits-project.py
ADD clean-1.pth clean-1.pth

RUN python fruits-project.py

EXPOSE 8008

# Start the server
CMD ["python", "fruits-project.py", "serve"]
