#!/usr/bin/env sh

dropdb sqlzoo
createdb sqlzoo
# fill the sqlzoo databae with < file
psql sqlzoo < data/create_tables.sql
