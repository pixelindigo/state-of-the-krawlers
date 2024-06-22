<?php include_once("header.php");

require_admin();

if (isset($_POST['submit'])) {

$name = $_POST['name'];
$chair = $_POST['chair'];
if (empty($name)) die ("A Name is Required");
if (empty($chair)) die ("A Chair is Required");
if (empty ($_POST['starthour']) || empty($_POST['startminute']) || empty($_POST['month']) || empty($_POST['day']) || empty($_POST['year']))
	$date = -1;
else {
	$timestamp = mktime($_POST['starthour'], $_POST['startminute'], 0, $_POST['month'], $_POST['day'], $_POST['year']);
	$date = date("Y-m-d H:i:s", $timestamp);
}

$endtimestamp = mktime($_POST['endhour'], $_POST['endminute'], 0, $_POST['month'], $_POST['day'], $_POST['year']);

if ($endtimestamp < $timestamp) die("Your endtime was after your starttime.");

$duration = ($endtimestamp - $timestamp) / 60;

query("INSERT INTO sessions (name, user_id, starttime, duration) VALUES ('" . mysql_real_escape_string($name) . "', '" . mysql_real_escape_string($chair) . "', '$date', '$duration')");

print "<h3>Session Successfully Added</h3>";
} 
?>
<form method='post'>
<table>
<tr><td>Session Name:</td><td><input name='name' size='60'></td></tr>
<tr><td>Session Chair:</td><td>
<select name='chair'>
<?php
$result = query("SELECT * FROM users ORDER BY lastname");
while ($row = mysql_fetch_array($result)) {
        print "<option value='$row[user_id]'>$row[lastname], $row[firstname] ($row[email])</option>";
}
?>
</select>
<?php /*
<input name='chair' size='60'></td></tr>
*/ ?>
<tr><td>Date : (Not required)</td><td>
<select name="month">
<option value="0"></option>
<option value="1">January</option>
<option value="2">February</option>
<option value="3">March</option>
<option value="4">April</option>
<option value="5">May</option>
<option value="6">June</option>
<option value="7">July</option>
<option value="8">August</option>
<option value="9">September</option>
<option value="10">October</option>
<option value="11">November</option>
<option value="12">December</option>
</select>
<select name="day">
<option value="0"></option>
<?php for ($i=1; $i < 32; $i++) print "<option value='$i'>$i</option>";  ?>
</select>
<input name="year"/>
</tr>
<tr><td>Time: (Not required)</td><td>
Start:<select name="starthour">
<option value="-1"></option>
<?php for ($i=0; $i < 24; $i++) print "<option value='$i'>$i</option>";  ?>
</select>
:<select name="startminute">
<option value="-1"></option>
<?php for ($i=0; $i < 60; $i+=5) print "<option value='$i'>$i</option>"; ?>
</select>
End:<select name="endhour">
<option value="-1"></option>
<?php for ($i=0; $i < 24; $i++) print "<option value='$i'>$i</option>";  ?>
</select>
:<select name="endminute">
<option value="-1"></option>
<?php for ($i=0; $i < 60; $i+=5) print "<option value='$i'>$i</option>"; ?>
</select>
</td></tr>
<tr><td></td><td><input type='submit' name='submit' value='Add Session'>
</td></tr>
</table>
</form>

<?php 
include_once("footer.php");
?>
