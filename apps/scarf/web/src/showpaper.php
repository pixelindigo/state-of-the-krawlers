<?php include_once("header.php");

$id = (int) $_GET['paper_id'];

$result = query("SELECT paper_id, title, abstract FROM papers WHERE paper_id='$id'");
if (mysql_num_rows($result) == 0) die("I'm sorry, there isn't any paper with that id");
$row = mysql_fetch_row($result);

list($id, $title, $abstract) = $row;

$result = query("SELECT showemail, users.email, CONCAT(firstname, ' ', lastname) AS fullname, affiliation FROM authors LEFT JOIN users ON users.user_id = authors.user_id WHERE paper_id='$id'");

print "<h2>$title</h2><br>\n";

if (is_admin()) print "<a href='editpaper.php?paper_id=$id'>(Edit this paper)</a><br>";

print "<table>
<tr><td><a href='getpaper.php?paper_id=$id'>View Paper</a></td><td><img src='images/pdf.gif'></td>";

$result2 = query("SELECT name, type FROM files WHERE paper_id='$id'");
while ($row = mysql_fetch_row($result2)) {
	$name = $row[0];
	print "<td><a href='getfile.php?paper_id={$id}&name=$name'>$name</a></td>";
	if (!strcmp($row[1], "application/xpdf") || !strcmp($row[1], "application/pdf")) print "<td><img src='images/pdf.gif'></td>";
}

print "</tr>
</table><br>\n";

while ($row = mysql_fetch_array($result)) {
	print "<b><i>$row[fullname]</b>, $row[affiliation]";
	if ($row['showemail'] || is_admin())
		print " (<a href='mailto:$row[email]'>$row[email]</a>)";
	print "</i><br>\n";
}

print "<br><b>Abstract</b><br>$abstract<br><hr>\n";

include_once("comments.php");

$email = getEmail();
logToFile("$email viewed paper '$title'");

include_once("footer.php");
?>
