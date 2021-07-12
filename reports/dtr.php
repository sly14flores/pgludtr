<?php

// somewhere early in your project's loading, require the Composer autoloader
// see: http://getcomposer.org/doc/00-intro.md
require '../vendor/autoload.php';

// reference the Dompdf namespace
use Dompdf\Dompdf;

// instantiate and use the dompdf class
$dompdf = new Dompdf();

$header = "La Union Medical Center";
$sub_header = "Agoo, La Union";
$title = "Daily Time Record";

$name = "IPSUM LOREM H";
$coverage = "May 2021";
$status = "CASUAL";

$supervisor = "Supervisor Head";

$rows = "";
for ($i=1; $i<=31; $i++) {
    $tr = "<tr>";
    $tr .= "<td>&nbsp;</td>";
    $tr .= "<td>&nbsp;</td>";
    $tr .= "<td>&nbsp;</td>";
    $tr .= "<td>&nbsp;</td>";
    $tr .= "<td>&nbsp;</td>";
    $tr .= "<td>&nbsp;</td>";
    $tr .= "<td>&nbsp;</td>";
    $tr .= "<td>&nbsp;</td>";
    $tr .= "</tr>";
    
    $rows .= $tr;
}

$content = <<<EOT
<div class="wrapper">
    <h1 class="header">$header</h1>
    <p class="sub-header">$sub_header</p>
    <h3 class="title">$title</h3>
    <h1 class="name">$name</h1>
    <div class="coverage-status-wrapper">
        <p class="coverage">May 2021</p>
        <p class="status">CASUAL</p>
    </div>
    <div class="table-wrapper">
        <table class="table">
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Day</th>
                    <th>Time In</th>
                    <th>Time Out</th>
                    <th>Time In</th>
                    <th>Time Out</th>
                    <th>Hours Work</th>
                    <th>Tardiness</th>
                </tr>
            </thead>
            <tbody>
                $rows                                                 
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="5">Total Absences</td>
                    <td>0</td>
                    <td>98.02</td>
                    <td>0</td>
                </tr>
                <tr>
                    <td class="footer-name" colspan="4">
                        <p>$name</p>
                    </td>
                    <td class="footer-head" colspan="4">
                        <p>$supervisor</p>
                    </td>
                </tr>
            </tfoot>
        </table>
    </div>
</div>
EOT;

$contents = "";
$contents.=$content;
$contents.=$content;

$html = <<<EOT
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<title>DTR</title>	
		<style>

            .h {
                border: 1px solid black;
            }

            *, html {
                margin: 0;
            }

            .clearfix {
                overflow: auto;
            }

            .wrapper {
                width: 600px;
                margin-left: auto;
                margin-right: auto;
                font-family: Verdana, Geneva, Tahoma, sans-serif;
                font-size: 16px;                
            }

            .header {
                text-align: center;
                font-size: 1rem;
            }

            .sub-header {
                text-align: center;
                font-size: 1rem;
                margin-top: 3px;
            }

            .title {
                text-align: center;
                font-size: 1.3rem;
                margin-top: 16px;
            }

            .name {
                font-size: 1rem;
                margin-top: 20px;
                border-bottom: 2px solid rgb(136, 136, 136);
                padding-bottom: 3px;
                color: rgb(49, 49, 49);
            }

            .coverage-status-wrapper {
                margin-top: 5px;
                display: flex;
                align-items: stretch;
            }

            .coverage {
                font-size: 1rem;
                flex-grow: 1;
            }

            .status {
                font-size: 1rem;
                flex-grow: 1;
                text-align: right;      
            }

            .table-wrapper {
                text-align: center;
                display: flex;
                justify-content: center;
                margin-top: 25px;
            }

            .table {
                width: 100%;
                border-collapse: collapse;
                font-size: .7rem;                
            }

            .table thead th {
                border: 1px solid rgb(77, 77, 77);
                padding-top: 3px;
                padding-bottom: 3px;
                background-color: rgb(121, 173, 216);
            }

            .table tbody td {
                border: 1px solid rgb(77, 77, 77);
                padding-top: 3px;
                padding-bottom: 3px;            
            }

            .table tfoot td {
                padding-top: 10px;
            }

            .table tfoot tr:first-child td {
                font-size: .8rem;
            }            

            .table tfoot tr td:first-child {
                text-align: right;
            }

            .table tfoot tr:first-child td {
                text-align: center;
            }            

            .footer-name, .footer-head {
                text-align: center;
            }         

            .footer-name p, .footer-head p {
                width: 90%;
                border-top: 1px solid rgb(80, 80, 80);             
                margin-top: 60px;
                font-size: 1rem;
                text-align: center;
                margin-left: auto;
                margin-right: auto;
            }      

        </style>
    </head>
    <body>$contents</body>
</html>
EOT;

$dompdf->loadHtml($html);

// (Optional) Setup the paper size and orientation
$dompdf->setPaper('letter', 'portrait');

// Render the HTML as PDF
$dompdf->render();

// Output the generated PDF to Browser
$filename = "dtr-".mt_rand().".pdf";
$dompdf->stream($filename);

?>