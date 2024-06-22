<?php  include_once("functions.php");

$id = (int) $_GET['paper_id'];

$result = query("SELECT title, pdf, pdfname FROM papers WHERE paper_id='$id'");

list($title, $pdf, $pdfname) = mysql_fetch_row($result);

$pdfname = $title . ".pdf";

header("Content-type: application/xpdf");
header("Content-Length: ". strlen($pdf));
header("Content-Disposition: attachement; filename=\"$pdfname\"");

print $pdf;

?>
