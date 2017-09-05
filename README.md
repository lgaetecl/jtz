**How to Use**

============================================================

**Pre requirements:**

Download tzupdater from oracle page http://www.oracle.com/technetwork/java/javase/downloads/tzupdater-download-513681.html

Syntax: 

       sh CheckJTZ.sh -c check -dir FOLDER -day NUMBER
       sh CheckJTZ.sh -c update -dir FOLDER -day NUMBER

Example Command: 

       sh CheckJTZ.sh -c check -dir /usr/openv/ -day 10

Example Output:

        Path Java: /usr/openv/java/jre/bin/java
        Version TZ:
        JRE tzdata version: tzdata2009m

        TIME ZONE                       : America/Santiago

        Date and time today             : 21/08/2017 11:06:15 Chile Time -0400
        Date and time in 10 days        : 31/08/2017 11:06:14 Chile Time -0400


Example Command: 

       sh CheckJTZ.sh -c update -dir /usr/openv/ -day 10

Example Output:

        Path Java: /usr/openv/java/jre/bin/java
        Version TZ Previous:
        JRE tzdata version: tzdata2009m


        Using http://www.iana.org/time-zones/repository/tzdata-latest.tar.gz as source for tzdata bundle.

        Version TZ Current:
        JRE tzdata version: tzdata2017b

        TIME ZONE                       : America/Santiago

        Date and time today             : 21/08/2017 12:11:33 Chile Summer Time -0300
        Date and time in 10 days        : 31/08/2017 12:11:33 Chile Summer Time -0300


In this case it will look for the JRE or SDK that are in the directory /var, in case of not entering a parameter it will search from the Root.

**Notes**: 
- You must run this scripts with a user who has permissions on the directories that are searched.
- The java class is compiled with 1.3 so that it can run on all JVMs
- In case of not having internet access, modify the FIX parameter giving the path where the file tzdata-latest.tar.gz is located
