log.php is a php page which log HTTP GET requests with their parameters. The primary way to do this is to store things in an mysql database. As a backup the data is also written to a file.
The php file could be on the same machine as the tracker, logging measurement results.

The file currently saves four parameters: (this could easily be changed)
 -nodeid: Some unique id related to the machine that is running the experiment. It might be a good idea to use the ssh public key for this. (In addition, the php file also logs the ip the request comes from.)
 -timestap: Some timestamp regarding the moment the experiment was run.
 -startDelay
 -skipDelay

To store results use: (replace 127.0.0.1 with the tracker ip) 
	curl 127.0.0.1/log.php -G -d "nodeid=12&timestamp=123&startDelay=10&skipDelay=2"

The tracker must have a mysql setup with a suitable table:
	CREATE TABLE Results(nodeid varchar(512),nodeip varchar(255),timestamp varchar(255),startDelay varchar(255),skipDelay varchar(255));
Read using:
	SELECT * FROM Results;

I tested the php with Apache and mysql on windows, and the .sh file on Ubuntu. Minor changes might be needed.
