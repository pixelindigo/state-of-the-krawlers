<?php include_once("header.php");
if (!isset($_POST['email'])) {
	if (isset($_SESSION['createnewadmin'])) {
		print "Congratulations! It looks like there isn't an administrator created yet. Please create an <b>admin</b> user<br>";
	} else {
		print "Please register a new user";
	}
                ?>
<form action='register.php' method='POST'>
<table>
<tr><td>Email Address <?php if (is_admin()) print "(Leave blank if you don't know their email)"; ?>:</td><td><input name='email'></td></tr>
<?php if (!is_admin()) {?><tr><td>Retype Email Address:</td><td><input name='email2'></td></tr> <?php } ?>
<!--
<tr><td>Password:</td><td><input name='password' type='password'></td></tr>
<tr><td>Retype Password:</td><td><input name='password2' type='password'></td></tr>
-->
<tr><td>First Name (and Middle Initials if you want):</td><td><input name='firstname'></td></tr>
<tr><td>Last Name :</td><td><input name='lastname'></td></tr>
<tr><td>Affiliation (This goes after your name, leave it blank if you wish):</td><td><input name='affiliation'></td></tr>
<tr><td>&nbsp</td><td><input type='submit' value='Register'></td></tr>
</table>
</form>
<?php
} else {
//	if (empty($_POST['email'])) die("Please enter an email address");
//	if (strcmp($_POST['password'], $_POST['password2'])) die("Your passwords don't match");
	if (! strcmp($_SERVER['PHP_SELF'], $_SERVER['HTTP_REFERER']) && ! is_admin()) if (strcmp($_POST['email'], $_POST['email2'])) die("The email addresses you entered do not match");

//	$password = $_POST['password'];
        $email = trim($_POST['email']);
	$password = genpassword(10);
        $firstname = trim($_POST['firstname']);
        $lastname = trim($_POST['lastname']);
	$privilege = 'user';
	if (!empty ($_POST['email']) ) {
		if (! validate_email($email) ) die ("Invalid Email");
        	$result = query("SELECT * FROM users WHERE email='" .  mysql_real_escape_string($email) . "'");
	        if (mysql_num_rows($result) > 0) die ("Sorry, that email is already taken");
	} else if (is_admin()) {
		print "No email entered for this user. Registration is allowed (for paper authoring) but the user will not be able to log in.";
	} else {
		print "You must enter an email";
	}
	if (isset($_SESSION['createnewadmin'])) {
		$result = query("SELECT * FROM users WHERE privilege='2'");
		if (mysql_num_rows($result) != 0) {
			unset($_SESSION['createnewadmin']);
			die("Two people are trying to create admin users at the same time, and the other user beat you to it. Please talk to them");
		}
		$privilege = 'admin';
	}
        query("INSERT INTO users (email, password, firstname, lastname, privilege, affiliation) VALUES ('" . mysql_real_escape_string($email) . "', '" . mysql_real_escape_string(md5($password)) . "', '" . mysql_real_escape_string($firstname) . "', '" . mysql_real_escape_string($lastname) . "', '$privilege', '" . mysql_real_escape_string(trim($_POST['affiliation'])) . "')");
	unset($_SESSION['createnewadmin']);
	$sitename = getSiteName();
	if (! empty($_POST['email'])) {
		mail($email, "New $sitename account",
"Thanks for signing up for '$sitename'.  If you received this email and did not personally sign up, it is likely that you are an author of one of the submitted papers and someone setup an account for you.

Your email is: $email
Your password is: $password

The URL is: " . getBaseLink() . "/login.php

You may login to your new account at the above website address.  We recommend that you change your password to something that is a little easier to remember.", "From: scarf-do-not-reply@" . $_SERVER['HTTP_HOST']);
print "Thank you for signing up! You will be sent an email with a generated password and instructions on how to login to the site. Please <a href='login.php'>login</a> and comment on some papers";
	}
}

include_once("footer.php");
?>
