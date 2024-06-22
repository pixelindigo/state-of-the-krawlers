<?php include_once("header.php");
require_admin();
if (isset($_POST['submit'])) {
	foreach ($_POST as $name => $value) {
		$name = mysql_real_escape_string($name);
		$name = str_replace("_", " ", $name);
		$value = mysql_real_escape_string($value);
		query("UPDATE options SET value='$value' WHERE name='$name'");
	}
	foreach ($_FILES as $name => $value) {
		if (!$value['error']) {
			$result = query("SELECT value FROM options where name='" . mysql_real_escape_string($name) . "'");
			$row = mysql_fetch_row($result);	
			print file($value['tmp_name']);
			if (! move_uploaded_file($value['tmp_name'], $row[0]))
				die ("There was an error uploading the file. The webserver might not have write permission to the file $row[0]");
		}
	}	
	print "<h3>Changes Saved</h3>";
} else if (isset($_POST['usersubmit'])) {
	$data = array();
	foreach ($_POST as $name => $value) {
		$temp = explode("_", $name);
		$id = $temp[0];
		$type = $temp[1];
		if (is_numeric($id) && count($temp) == 2)
			$data[(int) $id][$type] = $value;
	}
	foreach ($data as $id => $values) {
		if (isset($values['showemail']))
			$data[$id]['showemail'] = 1;
		else
			$data[$id]['showemail'] = 0;
	}
	
	foreach ($data as $id => $values) {
		query("UPDATE users SET " . implode_with_keys(",", $values, "'") . " WHERE user_id='$id'");
	}
	print "<h3>All users updated</h3>";
		
} else if (isset($_GET['delete_email'])) {
	query("DELETE FROM users WHERE email='" . mysql_real_escape_string($_GET['delete_email']) . "'");
}

?>
<form method='post' enctype="multipart/form-data"><table>
<?php
$result = query("SELECT name, type, value FROM options");

while ($row = mysql_fetch_assoc($result)) {
	$row['name'] = str_replace("_", " ", $row['name']);
	print "<tr><td>$row[name]</td><td>";
	if (! strcmp("text", $row['type'])) {
		print "<input name='$row[name]' value='$row[value]' />";
	} else if (! strcmp("boolean", $row['type'])) {
		print "<select name='$row[name]'>";
		if (! strcmp("0", $row['value'])) {
			print "<option value='0' selected='selected'>FALSE</option>";
			print "<option value='1'>TRUE</option>";
		} else {
			print "<option value='0'>FALSE</option>";
			print "<option value='1' selected='selected'>TRUE</option>";
		}
	} else if (! strcmp("file", $row['type'])) {
		print "<input name='$row[name]' type='file' />";
	}
	print "</td></tr>";
}
?>

</table>
<input type='submit' name='submit' value='Save Options'>
</form>

<h3>Users</h3>
<form method='post'>
<table>
<tr><th>Delete<th>Email</th><th>First Name</th><th>Last Name</th><th>Affiliation</th><th>Privilege</th><th>Show email</th></tr>
<?php
$result = query("SELECT user_id, email, firstname, lastname, affiliation, privilege, showemail FROM users ORDER BY lastname");
while ($row = mysql_fetch_assoc($result)) {
	print "<tr><td><input type='button' onclick='if (confirm(\"Are you sure you want to delete $row[firstname] $row[lastname] ($row[email])\") && confirm(\"You understand that if this user has any comments or papers they will now have a BLANK author?\") && confirm(\"Last chance, deleting users is NOT RECOMENDED but you may do it if you wish\")) document.location=\"?delete_email=$row[email]\"' value='Delete' />";
	$id = $row['user_id'];
	foreach ($row as $name => $value) {
		if (!strcmp($name, "showemail")) 
			print "<td><input name='{$id}_$name' type='checkbox' " . (1 == (int) $value ? "checked='checked'" : "") . "></td>";
		else if (!strcmp($name, "privilege")) {
			print "<td><select name='{$id}_$name'>\n";
			print "<option value='admin' " . (!strcmp($value, "admin") ? "selected='selected'" : "") . ">admin</option>\n";
			print "<option value='user' " . (!strcmp($value, "user") ? "selected='selected'" : "") . ">user</option>\n";
		} else if (!strcmp($name, "user_id")) {
			// Do nothing
		} else print "<td><input name='{$id}_$name' value='$value' size='18'></td>\n";
	}
	print "</tr>";
}
?>
</table>
<input type='submit' name='usersubmit' value='Save Changes to Users'>
</form>

<?php
include_once("footer.php");
?>
