FROM python:3

WORKDIR /app
COPY hello.py .

CMD ["python", "hello.py"]
