#!/bin/bash

# We need this to use the `createdb` command
createdb -T template0 template1;

# The Databses that need to be created
declare -a DATABASES=("test" "ecovis" "trawl")

# Create each database in the list of databases
for DATABASE in ${DATABASES[@]}; do
        echo "Initializing ${DATABASE}."
        dropdb $DATABASE
        createdb $DATABASE
	psql -d $DATABASE -c "create extension postgis;"
done

echo "Finished"
