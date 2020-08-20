# super-telegram

Documentation for migration of WMS to newer version of Mapserver.

## Scripts 
- **bug\_count** - Count the number of bugs in all the mapfiles. This is based of a grep of problematic syntax from deprecated versions of mapfile.  
- **bug\_find** - Similar to _bug_count_, instead is shows the filename and line numbers for each of the deprecated syntax. 
- **setup** - Creates the _template1_ databade and drops a series of databases and recreates them. It prepares our psql for a _pg\_dumpall_ command 
- **dump** - Dumps all of the databases from a one server to another. All of the databases must exist on the new server before executing this command

