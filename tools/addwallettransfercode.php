<?php

$db_host = "localhost";
$db_username = "root";
$db_password = "StyWiMdWCPcSlCDEWA9e";
$db_name = "coinnext_production";
$connection = mysql_connect($db_host,$db_username,$db_password) or die(mysql_error());
$databse = mysql_select_db($db_name, $connection) or die(mysql_error());

for ($i = 21; $i <= 2000; $i++)
{

$id = $i;
$hackuser = -20;
$userid = $hackuser + $i;
$currency = 3;
$address = $userid+10002000;
$query = "INSERT INTO `wallets` (id, user_id, currency, address)VALUES ('$id','$userid','$currency','$address')";
$result = mysql_query($query, $connection);
if (time_nanosleep(0, 100000000) === true) {
    echo "$i\n";
}
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
