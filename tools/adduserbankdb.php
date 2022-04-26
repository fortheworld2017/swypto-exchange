<?php

$db_host = "localhost";
$db_username = "root";
$db_password = "StyWiMdWCPcSlCDEWA9e";
$db_name = "coinnext_production";
$connection = mysql_connect($db_host,$db_username,$db_password) or die(mysql_error());
$databse = mysql_select_db($db_name, $connection) or die(mysql_error());

for ($i = 11; $i <= 2000; $i++)
{
$id = $i;
$query = "INSERT INTO `bank` (id)VALUES ('$id')";
$result = mysql_query($query, $connection);
}
    if ($result != FALSE)
        {
        print "Query was successful <br>";
    }
        else
        {
        print "Query was unsuccessful <br>";
        print "<br>";
        print mysql_errno($connection) . ": " . mysql_error($connection) . "\n";
    }

mysql_close();
?>
