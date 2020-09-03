#!/bin/bash


# The IP address of the original psql database server
WMS='192.168.16.39'

# The postgres user to perform the operation with
USER='woodj'

# An existing database on the new psql server
EXISTING='postgres'

# Performs the dump from an the old server to the new one
# The inserts flag, means that failures become non-critical to execution
# We pipe the output of the pg_dumpall from standard out into our new database

pg_dumpall -h $WMS -U $USER --inserts | psql -d $EXISTING;
