<?php  include_once("functions.php");

$id = (int) $_GET['paper_id'];
$name = mysql_real_escape_string($_GET['name']);

$result = query("SELECT name, ext, type, data, title FROM files LEFT JOIN papers USING (paper_id) WHERE files.paper_id='$id' AND name='$name'");

if (mysql_num_rows($result) == 0) {
	print ("I'm sorry, no files with that name exist. Please click this link and send a mail to <a href=\"mailto:scarf-do-not-reply@paulisageek.com?&subject=ConfDB error&body=" . htmlspecialchars($_SERVER["REQUEST_URI"]) . "\">Paul Tarjan</a> containing this message:<br><br>");
	print $_SERVER["REQUEST_URI"];
} else {

	list($name, $ext, $type, $data, $title) = mysql_fetch_row($result);

	header("Content-type: $type");
	header("Content-Length: ". strlen($data));
	header("Content-Disposition: inline; filename=\"$name - $title.$ext\"");

	print $data;
}

?>
