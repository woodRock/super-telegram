# super-telegram

Documentation for migration of WMS to newer version of Mapserver. 

## Purpose
We keep these scripts in a GitHub repository so they can easily be deployed and run on any apache servers. The scripts are a collection of utilities. 

## Background
We are migrating an existing Web Map Service (WMS) to a different server. The existing services uses Apache, Postgres, Postgis (psql extention), and Mapserver. The new version of the server has an updated version of both Mapserver and Postgres installed. Between the major versions of Mapserver some of the syntax from the existing Mapfiles is now deprecated.

## Todo 
1. [x] migrate psql database to _wellmapsrvdev02_
2. [x] migrate map files 
3. [ ] update deprecated syntax for each mapfile 
4. [ ] verify each map file loads correctly via WMS
5. [ ] redirect silverstripe WMS urls 

## Scripts 
- **bug\_count** - Count the number of bugs in all the mapfiles. This is based of a grep of problematic syntax from deprecated versions of mapfile.  
- **bug\_find** - Similar to _bug_count_, instead is shows the filename and line numbers for each of the deprecated syntax. 
- **setup** - Creates the _template1_ databade and drops a series of databases and recreates them. It prepares our psql for a _pg\_dumpall_ command 
- **dump** - Dumps all of the databases from a one server to another. All of the databases must exist on the new server before executing this command
