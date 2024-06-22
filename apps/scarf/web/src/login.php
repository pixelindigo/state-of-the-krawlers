<?php include_once("functions.php"); 
if (isset($_GET["logout"])) {
	session_start();
	unset($_SESSION['email']);
	unset($_SESSION['privlege']);
	unset($_SESSION['user_id']);
	session_destroy();
        header("Location: index.php");
} else if (isset($_POST["email"])) {
	$result = query("SELECT * FROM users WHERE email='" . mysql_real_escape_string($_POST['email']) . "' AND password='" . mysql_real_escape_string(md5($_POST['password'])) . "'");
	if (mysql_num_rows($result) == 0) {
		include_once("header.php");
		print "You have entered an email address and/or password that is invalid. Please go <a href='javascript:back()'>back</a> to the main page.";
	} else if (mysql_num_rows($result) == 1) {
		$row = mysql_fetch_assoc($result);
		session_start();
		$_SESSION['email'] = $row['email'];
		$_SESSION['privilege'] = $row['privilege'];
		$_SESSION['user_id'] = $row['user_id'];
		logToFile($row['email'] . " logged in");
		if (isset($_GET['referer']))
			header("Location: $_GET[referer]");
		else
			header("Location: index.php");
	}
} else { include("header.php");
?>
<form action='login.php' method='POST'>
<table>
<tr><td>Email Address:</td><td><input name='email'></td></tr>
<tr><td>Password:</td><td><input name='password' type='password'></td></tr>
<tr><td>&nbsp</td><td><input type='submit' value='Login'></td></tr>
</table>
</form>
<a href='register.php'>Register</a> <a href='forgot.php'>Forgot your password</a> 
<?php 
}
include_once("footer.php");
?>
