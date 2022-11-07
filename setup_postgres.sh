#!/usr/bin/env bash

# install requirements
sudo apt update
sudo apt install postgresql postgresql-contrib

# start and enable postgres
sudo systemctl start postgresql
sudo systemctl enable postgresql

# setup user and db
sudo -i -u postgres psql -c "CREATE USER pg_user WITH PASSWORD 'thePassword'";
sudo -i -u postgres psql -c "CREATE DATABASE pg_db";
sudo -i -u postgres psql -c "ALTER ROLE pg_user SET client_encoding TO 'utf8'";
sudo -i -u postgres psql -c "ALTER ROLE pg_user SET default_transaction_isolation TO 'read committed'";
sudo -i -u postgres psql -c "ALTER ROLE pg_user SET timezone TO 'UTC'";
sudo -i -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE pg_db TO pg_user";
