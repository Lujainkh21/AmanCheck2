FROM python:3.12-bookworm

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

RUN python -m playwright install --with-deps chromium

COPY . .

ENV PORT=10000

CMD gunicorn app:app --bind 0.0.0.0:$PORT --timeout 120
