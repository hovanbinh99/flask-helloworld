FROM python:3.7-slim

WORKDIR app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PORT 3000

COPY ./src ./
COPY requirements.txt ./

RUN pip install -r requirements.txt


EXPOSE 3000

 CMD ["sh", "-c", "gunicorn --bind :$PORT --workers 1 --threads 4 --timeout 0 main:app"]

CMD python main.py runserver 0.0.0.0:$PORT