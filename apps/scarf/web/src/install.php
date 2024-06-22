<?php include_once('header.php') ?>
<?php 
$usertable = "CREATE TABLE `users` (
`user_id` INT NOT NULL auto_increment,
`email` VARCHAR( 200 ) NOT NULL ,
`password` VARCHAR( 50 ) NOT NULL ,
`firstname` VARCHAR( 200 ) NOT NULL ,
`lastname` VARCHAR( 200 ) NOT NULL ,
`affiliation` VARCHAR( 200 ) NOT NULL ,
`showemail` BOOL DEFAULT 'false' NOT NULL ,
`privilege` ENUM( 'admin', 'user' ) NOT NULL DEFAULT 'user' ,
PRIMARY KEY ( `user_id` )
) ;";
$papertable = "CREATE TABLE `papers` (
`paper_id` INT NOT NULL AUTO_INCREMENT ,
`title` VARCHAR( 200 ) NOT NULL ,
`abstract` TEXT NOT NULL ,
`pdf` LONGBLOB NOT NULL ,
`pdfname` VARCHAR( 200 ) NOT NULL ,
`session_id` INT NOT NULL ,
`order` INT NOT NULL ,
PRIMARY KEY ( `paper_id` )
) ;";
$sessiontable = "CREATE TABLE `sessions` (
`session_id` INT NOT NULL AUTO_INCREMENT ,
`name` VARCHAR( 200 ) NOT NULL ,
`user_id` INT NOT NULL ,
`starttime` DATETIME NOT NULL ,
`duration` INT NOT NULL ,
PRIMARY KEY ( `session_id` )
) ;";
$authortable = "CREATE TABLE `authors` (
`paper_id` INT NOT NULL ,
`user_id` INT NOT NULL ,
`order` INT NOT NULL ,
PRIMARY KEY ( `paper_id`, `order` )
) ;";
$commenttable = "CREATE TABLE `comments` (
`comment_id` INT NOT NULL AUTO_INCREMENT ,
`user_id` INT NOT NULL ,
`paper_id` INT NOT NULL ,
`comment` TEXT NOT NULL ,
`date` DATETIME NOT NULL ,
`approved` BOOL DEFAULT 'false' NOT NULL ,
PRIMARY KEY ( `comment_id` )
) ;";
$optiontable = "CREATE TABLE `options` (
`name` VARCHAR( 200 ) NOT NULL ,
`type` ENUM( 'text', 'file', 'boolean' ) NOT NULL ,
`value` TEXT NOT NULL ,
PRIMARY KEY ( `name` )
) ;";
$filetable = "CREATE TABLE `files` (
`paper_id` INT NOT NULL ,
`name` VARCHAR( 200 ) NOT NULL ,
`ext` VARCHAR( 200 ) NOT NULL ,
`type` VARCHAR( 200 ) NOT NULL ,
`data` LONGBLOB NOT NULL ,
PRIMARY KEY ( `paper_id` , `name` )
)";

$optionquery = "INSERT INTO `options` ( `name` , `type` , `value` )
VALUES (
'Conference Name', 'text', 'SCARF - Stanford Conference And Research Forum'
), (
'Banner Image', 'file', 'images/logo.jpg'
), (
'Background Image', 'file', 'images/container.jpg'
), (
'Style File (CSS)', 'file', 'style.css'
), (
'Is Forum Moderated (emails the admins on every post)', 'boolean', '0'
);";

if (isset($_POST['dbname'])) {
// Submitted the information already
$dbname = ($_POST['dbname']);
$user = ($_POST['user']);
$pass = ($_POST['pass']);
$adminname = ($_POST['adminname']);
$adminpass = ($_POST['adminpass']);
$hostname = ($_POST['hostname']);
/*
$passstring = "";
if (!empty($adminname)) $passstring .= " -u $adminname ";
if (!empty($adminpass)) $passstring .= " -p$adminpass ";
*/

$link = @mysql_connect($hostname, $adminname, $adminpass) or die ("A connection could not be made to your site at: <b>$hostname</b>, using username: <b>$adminname</b>, and password: (not shown). Please check that you have the right values. Click the back button on your browser to resubmit the values. ");

if (! mysql_query("CREATE DATABASE " . mysql_real_escape_string($dbname))) {
	$out = mysql_error();
        if (strstr($out, "database exists")) {
                if (!isset($_POST['confirmdrop'])) {
                        print "<p>Do you want to overwrite the previous database? <b>YOU WILL LOOSE ALL YOUR INFORMATION IN THE PREVIOUS DATABASE IF YOU CLICK THIS BUTTON</b></p>";
                        print "<form action='" . $_SERVER['PHP_SELF'] . "' method='POST'>";
                        print "<input type='submit' name='confirmdrop' value='I want to replace the old Database with an empty one'>";
                        foreach ($_POST as $name => $data) {
                                print "<input type='hidden' name='$name' value='$data'>";
                        }
                        print "</form>";
                        exit();
                } else {
			mysql_query("DROP DATABASE " . mysql_real_escape_string($dbname)) or die ("Could not drop DB: " . mysql_error());
			mysql_query("CREATE DATABASE " . mysql_real_escape_string($dbname)) or die ("Could not create DB: " . mysql_error());
		}
	} else 
		die("Could not create DB: " . mysql_error());
};

mysql_select_db($dbname) or die("Could not select DB: " . mysql_error());


/*
exec ("mysqladmin $passstring create $dbname 2>&1", $output, $return);

if ($return) {
	$out = "";
	foreach ($output as $line)
		$out .= "$line<br>\n";
	if (strstr($out, "database exists")) {
		if (!isset($_POST['confirmdrop'])) {
			print "<p>Do you want to overwrite the previous database? <b>YOU WILL LOOSE ALL YOUR INFORMATION IN THE PREVIOUS DATABASE IF YOU CLICK THIS BUTTON</b></p>";
			print "<form action='" . $_SERVER['PHP_SELF'] . "' method='POST'>";
			print "<input type='submit' name='confirmdrop' value='I want to replace the old Database with an empty one'>";
			foreach ($_POST as $name => $data) {
				print "<input type='hidden' name='$name' value='$data'>";
			}
			print "</form>";
			exit();
		}
	} else {
		print "There was an error creating the database:<br>";
		print $out;
		exit();
	}
}
unset($output);
// escapeshellcmd is used so that it isn't surrounded by 's
exec ("echo \"GRANT ALL ON " . escapeshellcmd($_POST['dbname']) . ".* TO $user@'localhost' IDENTIFIED BY $pass\" | mysql $passstring", $output, $return);
if ($return) {
	foreach ($output as $line)
		print ($line . "<br>\n");
	exit();
}
*/
// Create tables
mysql_query("GRANT ALL ON " . mysql_real_escape_string($_POST['dbname']) . ".* TO '" . mysql_real_escape_string($user) . "'@'localhost' IDENTIFIED BY '" . mysql_real_escape_string($pass) . "'") or die ("Can't Grant Privileges : " . mysql_error());


$link = mysql_connect($hostname, $user, $pass) or die ("Could not connect as newly created user: " . mysql_error());
mysql_select_db($dbname) or die("Could not select DB as new user: " . mysql_error());

mysql_query($usertable) or die(mysql_error());
mysql_query($papertable) or die(mysql_error());
mysql_query($sessiontable) or die(mysql_error());
mysql_query($authortable) or die(mysql_error());
mysql_query($commenttable) or die(mysql_error());
mysql_query($optiontable) or die(mysql_error());
mysql_query($filetable) or die(mysql_error());

// OPTIONS

mysql_query($optionquery) or die(mysql_error());


// Everything worked, write a config file
$fp = @fopen("config.php", "w");
$configstring = "<?php\n\$hostname = \"$hostname\";\n\$username = \"$user\";\n\$password = \"$pass\";\n\$dbname = \"$dbname\";\n?>";
if ($fp === FALSE) {
	print "I can't create a configuration file (probably due to the websever not having permission to write to the file config.php. <b>Please create the file 'config.php' in the base directory with these contents:</b>
	<p><pre>" . htmlentities($configstring) . "</pre></p><p>And then you're done :)";
} else {
	fwrite($fp, $configstring);
	fclose($fp);
	print "Everything worked! The next time you visit <a href='index.php'>this page</a> you will see your new discussion forum";
}

} else {
// No submitted information yet

?>

<h1>One Click Installation</h1>

<p>You can run these commands on your own <a href='?instructions=1'>(click here for instructions)</a>, or I can run them for you if you type in your administrator's mysql username and password:</p>

<?php if (isset($_GET['instructions'])) { ?>
<p><code>
mysqladmin createdatabase <i>dbname</i>
</code></p>
<p><code>
echo "GRANT ALL ON <i>dbname</i>.* TO '<i>new_username</i>' IDENTIFIED BY '<i>new_password</i>'" | mysql
</code></p>

<p>If you run them on your own, please create a config.php file which contains:</p>
<p><pre>
&lt;?php
$hostname = '<i>hostname</i>';
$username = '<i>new_username</i>';
$password = '<i>new_password</i>';
$dbname = '<i>dbname</i>';
?&gt;
</pre></p>

<p>And then make the tables like so:
<?php
print "<p><code>$usertable</code></p>";
print "<p><code>$sessiontable</code></p>";
print "<p><code>$authortable</code></p>";
print "<p><code>$commenttable</code></p>";
print "<p><code>$papertable</code></p>";
print "<p><code>$optiontable</code></p>";
print "<p><code>$filetable</code></p>";
print "<p><code>$optionquery</code></p>";
?>
</p>

<?php } ?>

<form action='install.php' method='POST'>
<table>
<tr><td>Administrator username </td><td><input name='adminname' value='root'></td></tr>
<tr><td>Administrator password </td><td><input type='password' name='adminpass'></td></tr>
<tr><td>Database hostname </td><td><input name='hostname' value='localhost'></td></tr>
<tr><td colspan='2'><b>You can change these defaults if you are going to run more than one copy of this software</b></td></tr>
<tr><td>Database name </td><td><input name='dbname' value='scarf'></td></tr>
<tr><td>New Username </td><td><input name='user' value='scarf'></td></tr>
<tr><td>New User's Password </td><td><input type='password' name='pass' value='<?php print genpassword(16) ?>'></td></tr>
<tr><td>&nbsp;</td><td><input type='submit' value='Create database'></td></tr>
</table>

<?php } ?>
<?php include_once('footer.php') ?>
