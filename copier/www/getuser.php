<?php
// call from windows bat via scripts/register.bat
echo "Address 1: ".gethostbyaddr($_SERVER['REMOTE_ADDR'])."<br>\n";
echo "Address 2: ".$_SERVER['REMOTE_ADDR']."<br>\n";
echo "User: ".$_GET['username']."<br>\n";
echo "Computer: ".$_GET['computername']."<br>\n";
echo "Address 3: ".$_GET['userip']."<br>\n"; // needed because some clients go via the proxy, and hence the REMOTE_ADDR entry above is just the proxy IP

// can write to mongodb
