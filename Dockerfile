FROM python:3.8

WORKDIR /app

RUN pip install pip-tools

COPY ./requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt
RUN python setup.py develop

ENV PYTHONPATH /app

CMD ["uvicorn", "main:app", "--proxy-headers", "--host", "0.0.0.0", "--port", "8000"]