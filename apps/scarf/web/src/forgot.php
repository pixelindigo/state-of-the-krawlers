<?php include_once("header.php");
if (! isset($_POST['email']) ) {
?>
If you have forgotten your password, please enter the email address you use to sign in to your account.  A new password will be generated and sent to your email.
<form action="forgot.php" method="POST">
Email:<input name='email'><input type='submit' value='Create new password'>
</form>
<?php
} else {
	$pass = genpassword(10);
	$email = $_POST['email'];
	$result = query("SELECT * FROM users WHERE email='" . mysql_real_escape_string($email) . "'");
	if (mysql_num_rows($result) == 0) {
		die("Invalid email address");
	} else {
		logToFile("$email forgot their password");
		query("UPDATE users SET password='" . md5($pass) . "' WHERE email='" . mysql_real_escape_string($email) . "'");
		mail($email, "Password Reset for " . getSiteName(), "The person at address: " . $_SERVER['REMOTE_ADDR'] . " requested a password reset for your user account.
	
Your email is: $email
Your new password is: $pass

You may log in at: " . getBaseLink() . "/login.php", "From: scarf-do-not-reply@" . $_SERVER['HTTP_HOST']);
		print "Your password has been reset. Please check your inbox for a new password.";
	}

}

include_once("footer.php");
?>
