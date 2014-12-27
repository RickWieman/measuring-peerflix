<?php
//Logs get requests made to the page in two ways: dumping the request to a file and writing to a mysql database
//The following parameters should be supplied in the GET request: nodeid, nodeip, timestamp, startDelay, skipDelay
//PHP will also get the ip the request was made from

$nodeip=$_SERVER['REMOTE_ADDR'];

//----------------------
//Dump everything to a file for use as backup
//----------------------
$req_dump = print_r($_GET, TRUE);
$fp = fopen('request.log', 'a');
fwrite($fp, $nodeip."\n");
fwrite($fp, $req_dump);
fclose($fp);

//----------------------
//Write to mysql db
//----------------------
$servername = "localhost";
$username = "user";  //EDIT
$password = "pass"; //EDIT
$dbname = "database"; //EDIT

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

//Generate query
$nodeid=$conn->real_escape_string($_GET["nodeid"]);
$timestamp=$conn->real_escape_string($_GET["timestamp"]);
$startDelay=$conn->real_escape_string($_GET["startDelay"]);
$skipDelay=$conn->real_escape_string($_GET["skipDelay"]);

$sql = "INSERT INTO Results (nodeid, nodeip, timestamp, startDelay, skipDelay)
VALUES ('".$nodeid."','".$nodeip."','".$timestamp."','".$startDelay."','".$skipDelay."')";

//Attempt to make the query
if ($conn->query($sql) === TRUE) {
    echo "The server successfully logged your results
";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}
//Close the database connection
$conn->close();