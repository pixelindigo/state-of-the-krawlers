<?php 

if (!isset($_GET['session_id'])) {
	header("Location: showsessions.php");
	die();
}

include_once("header.php");
require_admin();
$id = (int) $_GET['session_id'];

if (isset($_GET['action'])) {
	if (!strcmp($_GET['action'], "delete")) {
		print "Are you sure you want to delete this session?<br>\n<a href='editsession.php?session_id=$id&action=confirmdelete'>YES</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href='editsession.php?session_id=$id'>NO</a>";
	} else if (!strcmp($_GET['action'], "confirmdelete")) {
		query("DELETE FROM sessions WHERE session_id='$id'");
		print "Session Deleted";
	}
	die();
}

if (isset($_POST['submit'])) {
	if ((-1 == (int) $_POST['starthour']) || (-1 == (int) $_POST['startminute']) || (0 == (int) $_POST['month']) || (0 == (int) $_POST['day']) || empty($_POST['year'])) {
		if ((-1 == (int) $_POST['starthour']) && (-1 == (int) $_POST['startminute']) && (0 == (int) $_POST['month']) && (0 == (int) $_POST['day']) && empty($_POST['year'])) {
			print "Removed Date and Time<br>";
			query("UPDATE sessions SET starttime='0', duration='0' WHERE session_id='$id'");
		}
	} else {
		$timestamp = mktime($_POST['starthour'], $_POST['startminute'], 0, $_POST['month'], $_POST['day'], $_POST['year']);
        	$date = date("Y-m-d H:i:s", $timestamp);
		$endtimestamp = mktime($_POST['endhour'], $_POST['endminute'], 0, $_POST['month'], $_POST['day'], $_POST['year']);

		if ($endtimestamp < $timestamp) die("Your endtime was after your starttime.");

		$duration = ($endtimestamp - $timestamp) / 60;
		query("UPDATE sessions SET starttime='$date', duration='$duration' WHERE session_id='$id'");
	}


	foreach($_POST as $pap_id => $num) {
		if (!strcmp($pap_id, "name")) {
			query("UPDATE sessions SET name='". mysql_real_escape_string($num) . "' WHERE session_id='$id'");
		} else if (!strcmp($pap_id, "chair")) {
			query("UPDATE sessions SET user_id='". mysql_real_escape_string($num) . "' WHERE session_id='$id'");
		} else if (is_numeric($pap_id)) {
			$pap_id = (int) $pap_id;
			$num = (int) $num;
			query("UPDATE papers SET `order`='$num' WHERE paper_id='$pap_id'");
		}
	}	
	print "<h3>Session changes saved</h3>";
}

print "<a href='editsession.php?session_id=$id&action=delete'>Delete This Session</a><br>";

print "<form method='post'>";

$result = query("SELECT name, user_id, UNIX_TIMESTAMP(starttime) AS starttime, UNIX_TIMESTAMP(DATE_ADD(starttime, INTERVAL duration MINUTE)) AS endtime FROM sessions WHERE session_id='$id'");
$row = mysql_fetch_assoc($result);
$chair = $row['user_id'];
$starttime = (int) $row['starttime'];
$endtime = (int) $row['endtime'];

print "<table>";
print "<tr><td>Session Name</td><td><input name='name' value='$row[name]'></td></tr>";
print "<tr><td>Session Chair:</td><td><select name='chair'>";
$result = query("SELECT * FROM users ORDER BY lastname");
while ($row = mysql_fetch_array($result)) {
        print "<option value='$row[user_id]'";
	if (!strcmp($row['user_id'], $chair)) print " selected='selected' ";
	print ">$row[lastname], $row[firstname] ($row[email])</option>";
}
?>
</select>
<tr><td>Date : (Not required)</td><td>
<select name="month">
<option value="0"></option>
<?php
$months = array("January","February","March","April","May","June","July","August","September","October","November","December");
for ($i=0; $i < count($months); $i++) {
	print "<option value='" . ($i + 1) . "' " . ($starttime != 0 && $i + 1 == (int) date("n", $starttime) ? "selected='selected'" : "") . ">$months[$i]</option>";
}
?>
</select>
<select name="day">
<option value="0"></option>
<?php for ($i=1; $i < 32; $i++) print "<option value='$i' " . ($starttime != 0 && $i == (int) date("j", $starttime) ? "selected='selected'" : "") . ">$i</option>";  ?>
</select>
<input name="year" value='<?php if ($starttime != 0) print date("Y", $starttime) ?>'/>
</tr>
<tr><td>Time: (Not required)</td><td>
Start:<select name="starthour">
<option value="-1"></option>
<?php for ($i=0; $i < 24; $i++) print "<option value='$i' " . ($starttime != 0 && $i == (int) date("G", $starttime) ? "selected='selected'" : "") . ">$i</option>";  ?>
</select>
:<select name="startminute">
<option value="-1"></option>
<?php for ($i=0; $i < 60; $i+=5) print "<option value='$i' " . ($starttime != 0 && $i == (int) date("i", $starttime) ? "selected='selected'" : "") . ">$i</option>"; ?>
</select>
End:<select name="endhour">
<option value="-1"></option>
<?php for ($i=0; $i < 24; $i++) print "<option value='$i' " . ($starttime != 0 && $i == (int) date("G", $endtime) ? "selected='selected'" : "") . ">$i</option>";  ?>
</select>
:<select name="endminute">
<option value="-1"></option>
<?php for ($i=0; $i < 60; $i+=5) print "<option value='$i' " . ($starttime != 0 && $i == (int) date("i", $endtime) ? "selected='selected'" : "") . ">$i</option>"; ?>
</select>
</td></tr>
</table>

Note that you may use the same number for more than one paper, but the tie will be broken by addition order to the database<br>

<table><tr><th>Paper</th><th>Order</th></tr>

<?php
$result = query("SELECT paper_id, title, `order` FROM papers WHERE session_id='$id' ORDER BY `order`");

$num = mysql_num_rows($result);

while ($row = mysql_fetch_assoc($result)) {
 	print "<tr><td><a href='showpaper.php?paper_id=$row[paper_id]'>$row[title]</a></td><td><select name='$row[paper_id]'>";
	for ($i=1; $i<= $num; $i++) {
		print "<option value='$i' ";
		if ($i == $row['order']) print " selected='selected'";
		print ">$i</option>";
	}
	print "</select></td></tr>";
 
}

print "<tr><td><input type='submit' value='Save Session' name='submit'>";

print "</table>";

print "</form>";

include_once("footer.php");
?>
