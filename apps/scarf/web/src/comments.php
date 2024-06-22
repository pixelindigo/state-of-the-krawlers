<?php include_once("header.php");

function sendAuthorsEmails($comment_id) {
	$row = mysql_fetch_row(query("SELECT paper_id FROM comments WHERE comment_id='$comment_id'"));
	$paper_id = (int) $row[0];
	$row = mysql_fetch_row(query("SELECT users.email, comments.comment FROM comments LEFT JOIN users USING (user_id) WHERE comment_id='$comment_id'"));
	$author = $row[0];
	$comment = $row[1];
	$row = mysql_fetch_row(query("SELECT title FROM papers WHERE paper_id='$paper_id'"));
	$title = $row[0];
	$result = query("SELECT users.email FROM authors INNER JOIN users USING (user_id) WHERE paper_id='$paper_id'");

	while ($row = mysql_fetch_row($result)) {
		mail($row[0], "Comment on $title", "$author has posted a comment on your paper titled '$title':

$comment

Please visit " . getBaseLink() . "/showpaper.php?paper_id=$paper_id

to respond.", "From: scarf-do-not-reply@" . $_SERVER['HTTP_HOST']);
	}
	
	$result = query("SELECT DISTINCT users.email FROM comments INNER JOIN users USING (user_id) WHERE paper_id='$paper_id'");
	while ($row = mysql_fetch_row($result)) {
                mail($row[0], "Comment on $title", "$author has posted a comment on the paper titled '$title'. You are being notified since you have posted to that topic as well.

$comment

Please visit " . getBaseLink() . "/showpaper.php?paper_id=$paper_id

to respond.", "From: scarf-do-not-reply@" . $_SERVER['HTTP_HOST']);
        }

}

if (! isset($_GET['paper_id']) ) {
	// Moderate ALL comments mode
	$where = "WHERE approved='0'";
} else {
	$id = (int) $_GET['paper_id'];
	$where = "WHERE paper_id='$id' AND approved='1'";
}


if (isset($_GET['comment_id'])) {
	require_admin();

	$comment_id = (int) $_GET['comment_id'];
	if (isset($_GET['delete'])) {
		query("DELETE FROM comments WHERE comment_id='$comment_id'");
		print "Comment Deleted";
	} else if (isset($_GET['approve'])) {
		query("UPDATE comments SET approved='1' WHERE comment_id='$comment_id'");
		print "Comment Approved";
		// Email Authors
		sendAuthorsEmails($comment_id);
	} else {
		$result = query("SELECT approved, showemail, users.email AS email, comment, UNIX_TIMESTAMP(date) AS date, CONCAT(firstname, ' ', lastname) AS fullname FROM comments LEFT JOIN users on comments.user_id = users.user_id WHERE comment_id='$comment_id'");
		if (mysql_num_rows($result) != 1) die("Invalid Comment");
		$row = mysql_fetch_array($result);
		print "Posted by ";
	        if ($row['showemail'])
        	        print "<a href='mailto:$row[email]'>$row[fullname]</a>";
	        else
        	        print "<b>$row[fullname]</b>";
	        print " on <i>" . date("l F j, g:ia", $row[date]) . "</i><br>";
	        print str_replace("\n", "<br>", $row[comment]);
		if (! $row['approved']) 
			print "<br><input type='button' onclick='document.location = \"?comment_id={$comment_id}&approve=true\"' value='Approve Comment' />";
		print "<input type='button' onclick='if (confirm(\"Are you sure you want to delete this comment\")) document.location = \"?comment_id={$comment_id}&delete=true\"' value='Delete Comment' />";
	}
	die();
}


if (isset($_POST['submit'])) {
	require_loggedin();
        $comment = strip_tags($_POST['comment'], "<a>");
	if (is_moderated()) $approved = 0;
	else $approved = 1;
        query("INSERT INTO comments (user_id, paper_id, comment, date, approved) VALUES ('" . getUserID() . "', '$id', '" . mysql_real_escape_string($comment) . "', NOW(), '$approved')");
	if (! $approved) {
?>
<script type="text/javascript">
<!--
        alert ("You comment was successfully processed!\n\nHowever, it was placed on hold and will appear on the site once the administrator moderates it.\n\nPlease be patient and do not resubmit your comment.");
//-->
</script>
<?php
	$result = query("SELECT title FROM papers WHERE paper_id='$id'");
	$row = mysql_fetch_row($result);
	$title = $row[0];
	$row = mysql_fetch_row(query("SELECT comment_id, comment FROM comments where user_id='" . getUserID() . "' AND comment='" . mysql_real_escape_string($comment) . "' AND paper_id='$id'"));
	$comment_id= $row[0];
	$comment = $row[1];
	$comment = ereg_replace("[[:alpha:]]+://[^<>[:space:]]+[[:alnum:]/]", "<a href=\"\\0\">\\0</a>", $comment);
	$url = getBaseLink();
	$result = query("SELECT email FROM users WHERE privilege='admin'");
	while ($row = mysql_fetch_row($result)) {
		mail($row[0], "Comment Moderation for paper \"$title\"", getEmail() . " has posted a comment on " . date("l F j, g:ia") . " on the paper

\"$title\" at ($url/showpaper.php?paper_id=$id)

$comment

To moderate this comment, please visit $url/comments.php?comment_id=$comment_id", "From: scarf-do-not-reply@" . $_SERVER['HTTP_HOST']);
	}
	// Send out the emails
	} else {
		sendAuthorsEmails($comment_id);
	}
}

print "<h4>Comments</h4>";

$result = query("SELECT approved, paper_id, comment_id, showemail, users.email, comment, UNIX_TIMESTAMP(date) AS date, CONCAT(firstname, ' ', lastname) AS fullname FROM comments LEFT JOIN users on comments.user_id = users.user_id $where ORDER BY paper_id");

if (mysql_num_rows($result) == 0)
	print "There are <b>0</b> comments";
$cur_id = -1;
print "<ol id='commentlist'>\n";
while ($row = mysql_fetch_array($result)) {
	print "<li>";
	if (! isset($id) && (int) $row['paper_id'] != $cur_id) {
		$cur_id=  (int) $row['paper_id'] ;
		$result2 = query("SELECT title FROM papers WHERE paper_id='$cur_id'");
		$row2 = mysql_fetch_row($result2);
		print "<hr><h3>$row2[0]</h3>";
        }
	print "Posted by ";
        if ($row['showemail'])
                print "<a href='mailto:$row[email]'>$row[fullname]</a>";
        else
                print "<b>$row[fullname]</b>";
        print " on <i>" . date("l F j, g:ia", $row[date]) . "</i>";
	if (is_admin())
		if ($row['approved'])
			print " APPROVED (<a href='comments.php?comment_id=$row[comment_id]'>delete</a>)";
		else 
			print " (<a href='comments.php?comment_id=$row[comment_id]'>approve / delete</a>)";
	$comment = ereg_replace("[[:alpha:]]+://[^<>[:space:]]+[[:alnum:]/]", "<a href=\"\\0\">\\0</a>", $row['comment']);
        print "<br>" . str_replace("\n", "<br>", $comment);
	print "</li>";
}
print "</ol>";

if (isset($id)) {
if (getEmail() === FALSE)
        print "<h4><a href='login.php'>Login</a> to post a comment</h4>";
else {
        print "<h4>Please leave a comment:</h4>";
        print "<div id='commentform'>";
        print "Logged in as <a href='useroptions.php'>" . getName() . "</a><br><br>";
        print "<form method='post'><textarea name='comment' rows='11' cols='55'></textarea><br><br><input name='submit' type='submit' value='Leave a Comment'></form>";

        print "</div>";

}
}

?>
