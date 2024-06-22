<?php
include_once("functions.php");
// If not installed, run the install script
if (is_file("config.php") && is_readable("config.php")) {
	$result = query("SELECT * FROM users WHERE privilege='admin'");
	if (mysql_num_rows($result) == 0) {
		// Create a new user
		$_SESSION['createnewadmin'] = TRUE;
		header("Location: register.php");	
	} else {
		// Logged in user
		include_once("header.php");
		include_once("showsessions.php");
	}
} else {
	header("Location: install.php");
}
include_once("footer.php");
?>
