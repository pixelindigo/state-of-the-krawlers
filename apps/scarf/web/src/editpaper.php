<?php include_once("header.php");

require_admin();

if (isset($_GET['paper_id'])) {
	$id = (int) $_GET['paper_id'];
	$result = query("SELECT title, abstract, session_id, pdf, pdfname FROM papers WHERE paper_id='$id'");
	list($title, $abstract, $session_id, $pdf, $pdfname) = mysql_fetch_row($result);
	$result = query("SELECT user_id FROM authors WHERE paper_id='$id' ORDER BY `order`");
	$authors = Array();
	while ($row = mysql_fetch_row($result)) {
		$authors[] = $row[0];
	}
}

if (!isset($_POST['submit'])) {
?>
<script type="text/javascript">
function ajax(url, request) {
    var xmlHttpReq = false;
    var self = this;
    // Mozilla/Safari
    if (window.XMLHttpRequest) {
        self.xmlHttpReq = new XMLHttpRequest();
    }
    // IE
    else if (window.ActiveXObject) {
        self.xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
    }
    self.xmlHttpReq.open('POST', url, true);
    self.xmlHttpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    self.xmlHttpReq.onreadystatechange = function() {
        if (self.xmlHttpReq.readyState == 4) {
//            alert(self.xmlHttpReq.responseText);
//		document.getElementById('response').innerHTML = self.xmlHttpReq.responseText;
		if (confirm("If you didn't leave out any information, then your entry has been added to the database!\n\nDo you wish to reload the page to see the change you just made? (All form entries so far will be lost). You may also manually reload the page after saving your form entries by pressing the reload button in your browser"))
			document.location.reload();
        }
    }
    self.xmlHttpReq.send(request);

    // Make a new option
    /*
    o = document.createElement("OPTION");
    o.text = last + ", " + first + " (" + email + ")";
    o.value = email
    o.selected = false;
    select.options[select.length] = o;
    */
}
</script>
<div id='response' />
<form method='POST' name='form' enctype="multipart/form-data">
<table>
<tr><td>Title:</td><td><input name='title' size='80' value='<?php print "$title"; ?>'></td></tr>
<tr><td>Abstract:</td><td><textarea name='abstract' rows='10' cols='60'><?php print "$abstract"; ?></textarea></td></tr>
<tr><td>Authors: <br>(First author first)</td><td>
<div id='authorlist'>
<?php 
$result = query("SELECT * FROM users ORDER BY lastname");
$users = Array();
while ($row = mysql_fetch_array($result)) {
	$users[] = $row;
}
if (!isset($authors)) { ?>
<select name='authors[]'>
<?php
foreach($users as $row) {
	print "<option value='$row[user_id]'>$row[lastname], $row[firstname] ($row[email])</option>";
}
?>
</select>
<?php } else {
	$count = 0;
	foreach($authors as $user_id) {
		if ($count != 0) 
			print "<br><select name='authors[]'><option value=''></option>";
		else 
                	print "<select name='authors[]'>";
		$count++;
		foreach($users as $row) {
       			print "<option value='$row[user_id]'";
			if (!strcmp($row['user_id'], $user_id)) print " selected='selected' ";
			print ">$row[lastname], $row[firstname] ($row[email])</option>";
		}
		print "</select>";
	}
}
?>

</div>
<script type="text/javascript">

var values=new Array(0);

function save(id, value) {
	values[id] = value;
}
<?php /*
function restore() {
	document.getElementById('authorlist').innerHTML = "";
	alert(values);
	for (i=0; i < values.length; i++) {
		document.getElementById('authorlist').innerHTML += createAuthor(i)
		var name = "author" + i;
		document.getElementById(name).selectedIndex = values[i];
	}
}
*/ ?>

function createAuthor(num) {
	var html = "<br><select name='authors[]' id='author" + num + "' onChange='javascript:save(" + num + ", this.selectedIndex)'><option value=''></option><?php
$result = query("SELECT * FROM users ORDER BY lastname");
while ($row = mysql_fetch_array($result)) {
        print "\" +\n \"<option value='$row[user_id]'>$row[lastname], $row[firstname] ($row[email])</option>";
}
?>
	</select>";
	return html;	
}

function addAuthor() {
	values.push(0);
	var num = values.length;
	html = createAuthor(num);
	document.getElementById('authorlist').innerHTML += html
}
</script>

<input type='button' onclick='addAuthor()' value="Select Another Author"/>

<?php
/* This part didn't work well as the page had to be reloaded to refill in the box. Could be fixed in a future version

<input type='button' id='adduserbutton' onclick="document.getElementById('adduser').style.display = 'inline'; this.style.display = 'none'; return false" value="Add New User"/>
<div style='display:none' id='adduser'>
<table>
<tr><td>Email:</td><td><input name='email'></td></tr>
<tr><td>First Name:</td><td><input name='firstname'></td></tr>
<tr><td>Last Name:</td><td><input name='lastname'></td></tr>
<tr><td>Affiliation:</td><td><input name='affiliation'></td></tr>
<tr><td></td><td><input type='button' onclick="ajax('register.php', 'firstname=' + document.form.firstname.value + '&lastname=' + document.form.lastname.value + '&email=' + document.form.email.value + '&affiliation=' + document.form.affiliation.value)" value="Add User" /> <input type='button'  onclick="document.getElementById('adduserbutton').style.display = 'inline'; document.getElementById('adduser').style.display = 'none'" value="Cancel Adding User" /></td></tr>
</table>
</div>
*/
?>
</td></tr>
<tr><td>PDF:</td><td><input type='hidden' name='MAX_FILE_SIZE' value="100000000" /><input type='file' name='pdf'>Current Filename: <?php print "$pdfname (" . strlen($pdf) . " bytes)"; ?></td></tr>

<tr><td>Other Files:</td><td><div id='filelist'>
<?php
$result = query("SELECT name, data FROM files WHERE paper_id='$id'");
$count = 0;
while ($row = mysql_fetch_row($result)) {
	print "Name: <input type='hidden' name='oldfilename" . $count . "' value='$row[0]'>";
	print "<input type='text' name='filename" . $count. "' value='$row[0]'> File: <input type='hidden' name='MAX_FILE_SIZE' value='100000000' /><input type='file' name='file" . $count . "'>Current Size (" . strlen($row[1]) . " bytes)<br>\n";
	$count++;
}
?>
</div>
<script type="text/javascript">
filecount = <?php print $count ?>;

function createFile(num) {
        var html = "Name: <input type='text' name='filename" + num + "'> File: <input type='hidden' name='MAX_FILE_SIZE' value='100000000' /><input type='file' name='file" + num + "'><br>";
        return html;
}

function addFile() {
        html = createFile(filecount);
	filecount++;
        document.getElementById('filelist').innerHTML += html
}
</script>

<input type='button' onclick='addFile()' value="Attach other files to this paper">


<tr><td>Session:</td><td>
<?php if (isset($session_id) && ! is_admin()) {
	$result = query("SELECT * FROM sessions LEFT JOIN users ON sessions.user_id = users.user_id WHERE session_id='$session_id'");
	$row = mysql_fetch_array($result);
	print "$row[name], Chair: $row[firstname] $row[lastname], $row[starttime]";	
} else {
	print "<select name='session'>";
	$result = query("SELECT * FROM sessions LEFT JOIN users ON sessions.user_id = users.user_id ORDER BY starttime");
	while ($row = mysql_fetch_array($result)) {
		print "<option value='$row[session_id]'";
		if (isset($session_id) && $session_id == $row[session_id]) print " selected='selected' ";
		print ">$row[name], Chair: $row[firstname] $row[lastname], $row[starttime]</option>";
	}
?>
</select>
<?php

/* This part didn't work well as the page had to be reloaded to refill in the box. Could be fixed in a future version
<input type='button' id='addsessionbutton' onclick="document.getElementById('addsession').style.display = 'inline'; this.style.display = 'none'" value="Add New Session" />
<div style='display:none' id='addsession'>
<table>
<tr><td>Session Name:</td><td><input name='sessionname' size='60'></td></tr>
<tr><td>Session Chairperson:</td><td>
<select name='sessionchair'>
<?php
$result = query("SELECT * FROM users ORDER BY lastname");
while ($row = mysql_fetch_array($result)) {
        print "<option value='$row[user_id]'>$row[lastname], $row[firstname] ($row[email])</option>";
}
?>
</select></td></tr>
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
<tr><td></td><td><input type='button' onclick='
var starthour = + document.form.starthour.value;
var endhour = + document.form.endhour.value;
var startminute = + document.form.startminute.value;
var endminute = + document.form.endminute.value;
if (endhour < starthour || (endhour == starthour && endminute < startminute)) alert ("Your End Time is before your Start Time. You might want to fix that.");else ajax("addsession.php", "name=" + document.form.sessionname.value + "&chair=" + document.form.sessionchair.options[document.form.sessionchair.selectedIndex].value + "&month=" + document.form.month.value + "&day=" + document.form.day.value + "&year=" + document.form.year.value + "&starthour=" + document.form.starthour.value + "&startminute=" + document.form.startminute.value + "&endhour=" + document.form.endhour.value + "&endminute=" + document.form.endminute.value + "&submit=1")' value='Add Session' />
<input type='button' onclick="document.getElementById('addsessionbutton').style.display = 'inline'; document.getElementById('addsession').style.display = 'none'" value='Cancel Adding Session' />

print "</td></tr> </table>";
<?php } // End of Session adding stuff
*/
}
 ?>
</td></tr>
<tr><td>&nbsp</td><td><input type='submit' name='submit' value='<?php if (isset($_GET['paper_id'])) print "Save Changes"; else print "Add Paper" ?>'></tr></tr>
</table>
<?php
if (isset($_GET['paper_id']))
	print "<input type='hidden' name='paper_id' value='$id'>";
?>
</form>
</div>
<?php
} else {
// Put it in the DB
	$error = "Click <a href='javascript:history.back()'>Back</a> and fix the errors please.";
	if (empty($_POST['title'])) die ("A title is required. $error");
	if (empty($_POST['abstract'])) die ("An abstract is required. $error");
	if (0 == count($_POST['authors'])) die ("At least one author is required. $error");
	$session = $_POST['session'];
	if ((string)$session !== (string)(int)$session) die ("Something has gone wrong with your session selection. Either you don't have any sessions created, or the submission failed. $error");
	$session = (int)$session;
	if (0 == mysql_num_rows(query("SELECT * FROM sessions WHERE session_id='$session'"))) die("There isn't a session with that id. $error");
	
	$title = mysql_real_escape_string($_POST['title']);
	
	
	$abstract = mysql_real_escape_string($_POST['abstract']);


//	$pdf = mysql_real_escape_string(file_get_contents($_FILES['pdf']['tmp_name']));

	$filename = $_FILES['pdf']['tmp_name'];
	if (!empty($filename)) {
		$pdf = addslashes(fread(fopen($filename, 'r'), filesize($filename)));
		$pdfname = mysql_real_escape_string($_FILES['pdf']['name']);
	}

	if (!isset($_POST['paper_id'])) {
		$row = mysql_fetch_row(query ("SELECT MAX( `order` ) as max FROM `papers` WHERE session_id = '$session'"));
		$order = (int) $row[0] + 1;
		query ("INSERT INTO papers (title, abstract, pdf, pdfname, session_id, `order`) VALUES ('$title', '$abstract', '$pdf', '$pdfname', '$session', '$order')");
		$result = query ("SELECT paper_id FROM papers WHERE title='$title' AND abstract='$abstract' AND pdfname='$pdfname' AND session_id='$session' ORDER BY paper_id DESC");

		$row = mysql_fetch_row($result);
		$id = $row[0];
	} else {
		if (!empty($filename)) {
			$pdfSetString = "pdf='$pdf', pdfname='$pdfname',";	
		}
		query("UPDATE papers SET title='$title', abstract='$abstract', $pdfSetString session_id='$session' WHERE paper_id='$id'");
		$id = (int) $_POST['paper_id']; 
		query("DELETE FROM authors WHERE paper_id='$id'");
	}

	// Aditional files part

	foreach ($_POST as $name => $value) {
		if (!strcmp(substr($name, 0, 11), "oldfilename")) {
			$num = substr($name, 11);
			$oldname = mysql_real_escape_string($value);
			$newname = mysql_real_escape_string($_POST["filename$num"]);
			if (empty($_POST["filename$num"]))
				query("DELETE FROM files WHERE paper_id='$id' AND name='$oldname'");
			else
				query("UPDATE files SET name='$newname' WHERE paper_id='$id' AND name='$oldname'");
		}
	}

	foreach ($_FILES as $name => $file) {
		if (!strcmp(substr($name, 0, 4), "file")) {
			$num = substr($name, 4);
			$filename = $file['tmp_name'];
			if (!empty($filename)) {
		                $data = addslashes(fread(fopen($filename, 'r'), filesize($filename)));
				$oldname = mysql_real_escape_string($_POST["oldfilename$num"]);
                		$name = mysql_real_escape_string($_POST["filename$num"]);
				// HACK
				$oldname = $name;
				$ext = substr($file['name'],strrpos($file['name'],'.')+1);
				$type = mysql_real_escape_string($file['type']);

				
				query("DELETE FROM files WHERE paper_id='$id' AND name='$oldname'");
				query("INSERT INTO files (paper_id, name, ext, type, data) VALUES ('$id$', '$name', '$ext', '$type', '$data')");
		        }
			

		}
	}

	$num = 0;
	foreach ($_POST['authors'] as $author) {
		if (! empty($author)) {
			query ("INSERT INTO authors (`paper_id`, `user_id`, `order`) VALUES ('$id', '" . mysql_real_escape_string($author) . "', '$num')");
		}
		$num++;
	}

	if (!isset($_POST['paper_id'])) {
		print "Paper added successfully";
	} else {
		print "Paper updated successfully";
	}
	print ". View <a href='showpaper.php?paper_id=$id'>the paper</a>";
}

include_once("footer.php");

?>
