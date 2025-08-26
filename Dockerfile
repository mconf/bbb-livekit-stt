FROM python:3.10-slim

# Use uv instead of pip, see https://github.com/astral-sh/uv
RUN pip install uv

ENV VIRTUAL_ENV=/opt/venv

RUN uv venv $VIRTUAL_ENV

ENV PATH="$VIRTUAL_ENV/bin:$PATH"

WORKDIR /app

COPY pyproject.toml uv.lock ./

RUN uv sync --no-cache --active

COPY . .

CMD ["python3", "main.py", "start"]
