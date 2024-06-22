<?php
session_start();
if (is_file("config.php") && is_readable("config.php")) {
	require("config.php");
	mysql_connect($hostname, $username, $password) or die(mysql_error());
	mysql_select_db($dbname) or die(mysql_error());
}

function query($sql) {
	$result = mysql_query($sql);
	if (!$result) die(mysql_error());
	return $result;
}

function is_admin() {
	if ($_SESSION['privilege'] == 'admin') return TRUE;
	else return FALSE;
}
function validate_email($user_email) {
        $chars = "/^([a-z0-9+_]|\\-|\\.)+@(([a-z0-9_]|\\-)+\\.)+[a-z]{2,6}\$/i";
        if(strstr($user_email, '@') && strstr($user_email, '.')) {
                if (preg_match($chars, $user_email)) {
                        return true;
                } else {
                        return false;
                }
        } else {
                return false;
        }
}
function genpassword($length){
	$chars = "abcdefghijklmnpqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ123456789";
	srand((double)microtime()*1000000);
	$password="";
	for ($i=0;$i<$length;$i++)
        	$password .= substr ($chars, rand() % strlen($chars), 1);
	return $password;
}
function getEmail() {
	/*
	if (array_key_exists("email", $_SESSION))
		return $_SESSION['email'];
	else
		return FALSE;
	*/
	$result = query("SELECT email FROM users WHERE user_id='" . getUserID() ."'");
	if (mysql_num_rows($result) == 0) return FALSE;
	$row = mysql_fetch_row($result);
	
	return $row[0];
}
function getUserID() {
	if (array_key_exists("user_id", $_SESSION))
		return $_SESSION['user_id'];
	else
		return FALSE;
}

function getName() {
	$result = query("SELECT CONCAT(firstname, ' ', lastname) from users where `email`='" . getEmail() . "'");
	$row = mysql_fetch_row($result);
	return $row[0];
}

function require_admin() {
	if (!is_admin()) {
	        die ("You don't have access to view this page, sorry. Please try going to the <a href='index.php'>index page</a> to view the site.");
	}
}
function require_loggedin() {
	if (getEmail() === FALSE) {
		die ("You mube be logged in to access this feature. Please try going to the <a href='index.php'>index page</a> to view the site.");
	}
}
function showEmail($email) {
	$result = query("SELECT showemail FROM users WHERE email='$email'");
	$row = mysql_fetch_row($result);
	if ($row[0]) return TRUE;
	else return FALSE;
}
function is_moderated() {
	$result = query("SELECT value FROM options WHERE name='Is Forum Moderated (emails the admins on every post)'");
        $row = mysql_fetch_row($result);
        if ($row[0]) return TRUE;
        else return FALSE;
}
function getBaseLink() {
        $pos = strrpos($_SERVER['REQUEST_URI'], "/");
        return "http://" . $_SERVER['HTTP_HOST'] . substr($_SERVER['REQUEST_URI'],0,$pos);
}
function getSiteName() {
	$result = mysql_query("SELECT value FROM options WHERE name='Conference Name'");
	if (! $result) return "Conf DB Conference Disussion Forum";
	$row = mysql_fetch_row($result);
	return $row[0];
}
function logToFile($string) {
	if (is_writeable("log")) {
		$f = fopen("log", "a");
		fwrite($f, date("F j, Y, g:i a") . ": $string\n");
		fclose($f);
	}
}
function implode_with_keys($glue, $array, $valwrap='')
   {
       foreach($array AS $key => $value) {
           $ret[] = $key."=".$valwrap.mysql_real_escape_string($value).$valwrap;
       }
       return implode($glue, $ret);
   }

// Quote variable to make safe
set_magic_quotes_runtime(0);
function quote_smart($value)
{
   // Stripslashes
   if (get_magic_quotes_gpc()) {
       $value = stripslashes($value);
   }
   // Quote if not a number or a numeric string
   if (!is_numeric($value)) {
       $value = "'" . mysql_real_escape_string($value) . "'";
   }
   return $value;
}

if ( get_magic_quotes_gpc() ) {
   function stripslashes_deep($value) {
       if( is_array($value) )
       {
             $value = array_map('stripslashes_deep', $value);
       }
       elseif ( !empty($value) && is_string($value) )
       {
             $value = stripslashes($value);
       }
       return $value;
   }

   $_POST = stripslashes_deep($_POST);
   $_GET = stripslashes_deep($_GET);
   $_COOKIE = stripslashes_deep($_COOKIE);
}
?>
