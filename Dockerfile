FROM python:3.12-slim

ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    libpq-dev \
    libxml2-dev \
    libxslt1-dev \
    libldap2-dev \
    libsasl2-dev \
    libjpeg-dev \
    zlib1g-dev \
    libffi-dev \
    libssl-dev \
    node-less \
    npm \
    wkhtmltopdf \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/odoo

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8069

CMD ["sh", "-c", "python3 odoo-bin -c odoo.conf --db_host=$PGHOST --db_port=$PGPORT --db_user=$PGUSER --db_password=$PGPASSWORD --http-port=$PORT"]



