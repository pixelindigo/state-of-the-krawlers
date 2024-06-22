<?php include_once("functions.php"); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
<title>
<?php
if (is_file("config.php") && is_readable("config.php")) {
$result = query ("SELECT value FROM options WHERE name='Conference Name'");
$row = mysql_fetch_row($result);
print $row[0];

/*
$dotpos = strrpos($_SERVER['PHP_SELF'], '.');
$slashpos = strrpos($_SERVER['PHP_SELF'], '/');
$page = substr($_SERVER['PHP_SELF'], $slashpos+1, $dotpos-$slashpos-1);
*/
if (isset($_GET['paper_id'])) {
	$id = (int) $_GET['paper_id'];
	$result = query("SELECT title from papers WHERE paper_id='$id'");
	$row = mysql_fetch_row($result);
	print " >> $row[0]";
}

} else {
	print "SCARF - Stanford Conference And Research Forum";
}
?>
</title>
<link rel='stylesheet' type="text/css" href="style.css" media='screen' />

</head>
<body>
<div id="container">
<a href="index.php" title="Back to the Front Page" style='display:block'>
<div id="header"></div>
</a>

<div id="menu">
<table>
<tr>

<?php
                if (is_admin())
                        print "<td><a href='editpaper.php'>Add Paper</a></td><td><a href='addsession.php'>Add Session</a></td><td><a href='register.php'>Add User</a></td><td><a href='comments.php'>Moderate</a></td><td><a href='generaloptions.php'>Options</a></td>";
		else 
			print "<td><a href='showsessions.php'>Show Sessions</a></td>";
                if (!isset($_SESSION['email']))
                        print "<td><a href='register.php'>Register</a></td><td><a href='login.php?referer=" . urlencode($_SERVER['REQUEST_URI']) . "'>Login</a></td>";
                else
                        print "<td><a href='useroptions.php'>User Options</a></td><td><a href='login.php?logout=1'>Logout</a></td>";
?>
</tr>

</table>

</div>

<div id="content">
