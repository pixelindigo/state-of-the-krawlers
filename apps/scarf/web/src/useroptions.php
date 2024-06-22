<?php include_once("header.php");

require_loggedin();
$email = getEmail();
$id = getUserID();
if (isset($_POST['submit']) ) {
	if ($_POST['showemail']) $showemail = '1';
	else $showemail = '0';
	query("UPDATE users SET firstname='" . mysql_real_escape_string($_POST['firstname']) . "', lastname='" . mysql_real_escape_string($_POST['lastname']) . "', showemail='$showemail', affiliation='" . mysql_real_escape_string($_POST['affiliation']) . "' WHERE user_id='$id'");
	logToFile("$email changed their personal information");
	if (!empty($_POST['password'])) {
		if (strcmp($_POST['password'], $_POST['password2'])) die ("You're passwords don't match");
		else {
			$pass = md5($_POST['password']);
			query("UPDATE users SET password='$pass' WHERE user_id='$id'");
			logToFile("$email changed their password");
		}
	}
	if (strcmp($email, $_POST['email'])) {
		if (strcmp($_POST['email'], $_POST['email2'])) die ("Your email addresses don't match.");
		print "Your email address has been changed. <b>Your password has been reset to a random one to make sure your email is valid. Please check your mail before logging out or you might not be able to log back in</b>.";
		$pass = genpassword(10);
		$email = mysql_real_escape_string($_POST['email']);
		$ret = mail($email, "Password Reset for " . getSiteName(), "The person at address: " . $_SERVER['REMOTE_ADDR'] . " requested a password reset for your user account.

Your email is: $email
Your new password is: $pass

You may log in at: " . getBaseLink() . "/login.php", "From: scarf-do-not-reply@" . $_SERVER['HTTP_HOST']);
		if ($ret === FALSE)
			die("Email could not be sent to that address. Update aborted.");
		query("UPDATE users SET password='" . md5($pass) . "', email='$email' WHERE user_id='$id'");
	}
	print "<h3>Changes saved</h3>";
}
$result = query("SELECT firstname, lastname, showemail, affiliation, email FROM users WHERE user_id='" . $id . "'");
$row = mysql_fetch_row($result);
$first = $row[0];
$last = $row[1];
$showemail = $row[2];
$affiliation = $row[3];
$email = $row[4];
?>
<form method="POST">
<table>
<tr><td>Email:</td><td><input name='email' value='<?php print $email ?>'</td></tr>
<tr><td>Type Email Again To Change:</td><td><input name='email2'</td></tr>
<tr><td>First Name:</td><td><input name='firstname' value='<?php print $first ?>'></td></tr>
<tr><td>Last Name:</td><td><input name='lastname' value='<?php print $last ?>'></td></tr>
<tr><td>Show Email Publically:</td><td><input name='showemail' type='checkbox' <?php if($showemail) print "checked='true'"; ?>></td></tr>
<tr><td>Affiliation:</td><td><input name='affiliation' value='<?php print $affiliation ?>'></td></tr>
<tr><td>&nbsp;</td><td>Only fill these in if you want to change your password</td></tr>
<tr><td>New Password:</td><td><input name='password' type='password'></td></tr>
<tr><td>New Password Again:</td><td><input name='password2' type='password'></td></tr>
<tr><Td>&nbsp;</td><td><input type='submit' name='submit' value='Save changes'></td></tr>
</table>
</form>

<?php
include_once("footer.php");
?>
