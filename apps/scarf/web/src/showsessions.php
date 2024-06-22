<?php include_once("header.php");

print "<div style='float:right'>";
if (!isset($_SESSION['email'])) print "<a href='login.php'>Not logged in</a><br>";
else print "Logged in as " . $_SESSION['email'] . (is_admin() ? " (admin)" : "") . "<br>";
print "</div><br>";

$result = query ("SELECT session_id, name, UNIX_TIMESTAMP(starttime) AS starttime, UNIX_TIMESTAMP(starttime + INTERVAL duration MINUTE) AS endtime, CONCAT(firstname, ' ', lastname) AS fullname FROM sessions LEFT JOIN users ON sessions.user_id = users.user_id ORDER BY starttime");

if (mysql_num_rows($result) == 0) {
	print ("Sorry, there aren't any papers uploaded yet. Please check back soon.");
}

$curday = -1;

while ($row = mysql_fetch_array($result)) {
//	if (strcmp($row['starttime'], "0000-00-00 00:00:00"))
		$day = date("F j", $row['starttime']);
		if (strcmp($curday, $day))
			print "<h2>$day</h2>";
		$curday = $day;
	print "\n\n<b>$row[name]</b>: ";
	if (strcmp($row['starttime'], "0")) {
		print date("l F j, g:ia", $row['starttime']);
		print date(" - g:ia ", $row['endtime']);
//		print "$row[starttime] ";
	}
	if (is_admin()) {
		print " <a href='editsession.php?session_id=$row[session_id]'>(edit)</a> <a href='editsession.php?session_id=$row[session_id]&action=delete'>(delete)</a>";
	}
	print "\n<br>Session Chair: $row[fullname]<br>
<table width='100%'>";

	$result2 = query("SELECT paper_id, title FROM papers WHERE session_id='$row[session_id]' ORDER BY `order`");

	if (mysql_num_rows($result2) == 0) {
        	print ("Sorry, there aren't any papers uploaded yet for this session. Please check back soon.");
	}

	
	while ($row2 = mysql_fetch_array($result2)) {
		print "<tr><td><a href='showpaper.php?paper_id=$row2[paper_id]'>$row2[title]</a>";
		if (is_admin()) {
			print " <a href='editpaper.php?paper_id=$row2[paper_id]'>(edit)</a>";
		}
		$result3 = query("SELECT COUNT(comment) AS num_comments FROM comments WHERE paper_id='$row2[paper_id]' AND approved='1'");
		$row3 = mysql_fetch_row($result3);
		print "</td><td align='right'><a href='showpaper.php?paper_id=$row2[paper_id]'>$row3[0] comment";
		if ($row3[0] != 1) print "s";
		print "</a></td></tr>\n";
		$result3 = query("SELECT firstname, lastname FROM authors LEFT JOIN users USING (user_id) WHERE paper_id='$row2[paper_id]' ORDER BY `order`");	
		print "<tr><td>&nbsp;&nbsp;";	
		$count = 0;
		while ($row3 = mysql_fetch_row($result3)) {
			if ($count != 0) print ", ";
			$count++;
			$parts = explode(" ", $row3[0]);
			foreach ($parts as $value)
				print $value[0] . ". ";
			print $row3[1];
		}
		print "</td></tr>\n";	
	}
	print "</table><br>\n";
}

include_once("footer.php");
?>
