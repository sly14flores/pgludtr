<?php

$appointment_status = $_POST['appointment_status'] ?? null;
$month = $_POST['month'] ?? null;
$year = $_POST['year'] ?? null;
$coverage = $_POST['coverage'] ?? null;
$wwh = $_POST['wwh'] ?? null;

$_staffs = $_POST['staffs'] ?? [["id"=>intval($_POST['id'])]];

$staffs = (gettype($_staffs)==="string")?json_decode($_staffs,true):$_staffs;

$ids = [];
foreach ($staffs as $staff) {
    $ids[] = $staff['id'];
}

require('../db.php');
require('../work_hour.php');

$con = new pdo_db();

$sql = "SELECT id, empid, UPPER(CONCAT(last_name, ', ', first_name, ' ', SUBSTRING(middle_name,1,1), '.')) employee, appointment_status FROM employees WHERE id IN (".implode(",",$ids).")";
if ($appointment_status!==null) {
    $sql.=" AND appointment_status = '".$appointment_status."'";
}
$employees = $con->getData($sql);

require '../vendor/autoload.php';

// reference the Dompdf namespace
use Dompdf\Dompdf;

// instantiate and use the dompdf class
$dompdf = new Dompdf();

$header = null; //
$sub_header = null; //

$sql = "SELECT * FROM settings WHERE id = 1";
$settings = $con->getData($sql);

if (count($settings)) {
    $header = $settings[0]['dtr_header']; //
    $sub_header = $settings[0]['dtr_sub_header']; //
}

$supervisor = "Head/Supervisor"; //
$title = "Daily Time Record"; //

$date = "$year-$month-01";
$period = date("F Y",strtotime($date));

$firstDay = date("Y-m-d",strtotime($date));
$lastDay = date("Y-m-t",strtotime($date));
switch ($coverage) {
    case "first":
        $lastDay = date("Y-m-15",strtotime($date));
        break;
    case "second":
        $firstDay = date("Y-m-16",strtotime($date));
        break;
}

$contents = "";
foreach ($employees as $i => $emp) {
    $content = dtrContent($emp['id'],$emp['employee'],$emp['appointment_status'],$period,$firstDay,$lastDay);
    $classes = ($i>0)?"wrapper page-break":"wrapper";
    $contents.='<div class="'.$classes.'">'.$content.'</div>';
}

function dtrContent($id,$name,$status,$period,$first,$last)
{
    global $con, $header, $sub_header, $supervisor, $title, $wwh;

    $sql = "SELECT * FROM dtr WHERE eid = $id AND ddate BETWEEN '$first' AND '$last'";
    $dtr = $con->getData($sql);

    $hours_work = "";
    $work_hour_start = date("Y-m-d 00:00:00");
    $work_hour_end = "";
    $total_absences = 0;

    $rows = "";
    foreach ($dtr as $d) {        
        $date = date("j",strtotime($d['ddate']));
        $day = date("D",strtotime($d['ddate']));
        $morning_in = ($d['morning_in'] == "00:00:00")?"":date("h:i A",strtotime($d['morning_in']));
        $morning_out = ($d['morning_out'] == "00:00:00")?"":date("h:i A",strtotime($d['morning_out']));
        $afternoon_in = ($d['afternoon_in'] == "00:00:00")?"":date("h:i A",strtotime($d['afternoon_in']));
        $afternoon_out = ($d['afternoon_out'] == "00:00:00")?"":date("h:i A",strtotime($d['afternoon_out']));        

        $hour_work = $d['work_hour'];

        $hour_work = ($wwh == "true") ? $hour_work : "";

        if ($wwh=="true") {
            if ($d['work_hour']!=="") {
                if ($work_hour_end === "" ) {
                    $work_hour_end = addWorkHours($work_hour_start,$d['work_hour']);
                } else {
                    $work_hour_end = addWorkHours($work_hour_end,$d['work_hour']);
                }
            }
        }

        $tr = <<<EOT
            <tr>
            <td>$date</td>
            <td>$day</td>
            <td>$morning_in</td>
            <td>$morning_out</td>
            <td>$afternoon_in</td>
            <td>$afternoon_out</td>
            <td>$hour_work</td>
            <td>&nbsp;</td>
            </tr>
        EOT;
        $rows .= $tr;
    }

    $total_absences = ($total_absences == 0) ? "" : $total_absences;

    $hours_work = totalWorkHours($work_hour_start,$work_hour_end);
    
    $content = <<<EOT
        <h1 class="header">$header</h1>
        <p class="sub-header">$sub_header</p>
        <h3 class="title">$title</h3>
        <h1 class="name">$name</h1>
        <div class="coverage-status-wrapper">
            <p class="coverage">$period</p>
            <p class="status">$status</p>
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
                        <td>$total_absences</td>
                        <td>$hours_work</td>
                        <td></td>
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
    EOT;
    
    return $content;

}

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
                width: 620px;
                margin-left: auto;
                margin-right: auto;
                font-family: Verdana, Geneva, Tahoma, sans-serif;
                font-size: 16px;
                margin-top: 30px;            
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
                text-align: center;           
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
            
            .page-break {
                page-break-before: always;
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