#!/bin/bash

# We need this to use the `createdb` command
createdb -T template0 template1;

# The Databses that need to be created
declare -a DATABASES=("acoustic" "basemap" "bioregions" "bio" "bio_atlas" "chat-call" "cli_map" "corax2005" "nzoa" "nzoi" "nzpolitical" "os2020_oceans" "test" "test_mafbnz" "trawl")

# Create each database in the list of databases
for DATABASE in ${DATABASES[@]}; do
        echo "Initializing ${DATABASE}."
        dropdb $DATABASE
        createdb $DATABASE
	psql -d $DATABASE -c "create extension postgis;"
done

echo "Finished"
