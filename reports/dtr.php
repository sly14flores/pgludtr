<?php

var_dump($_POST); exit();

/**
 * Filters
 */
$staffs = (isset($_POST['staffs']))?json_decode($_POST['staffs'],true):[];
$id = (isset($_POST['id']))?json_decode($_POST['id'],true):null;
$month = $_POST['month'];
$year = $_POST['year'];

$ids = [];
if (count($staffs)) {
	foreach ($staffs as $staff) {
		$ids[] = $staff['id'];
	}
} else {
	$ids[] = $id;
}

# supplimental dates
function doesDateExist($dtrs,$data,$date) {

	global $isHoliday, $travel_orders;

	foreach ($dtrs as $i => $dtr) {

		if ($dtr['ddate'] == $date) return array("date"=>true,"dtr"=>$data[$i]);
		
	}
	
	$suppliment = array(
		date("d",strtotime($date)),
		date("l",strtotime($date)),
		"-",
		"-",
		"-",
		"-",
		"-",
		"-",
		"",
		""
	);		
	
	return array("date"=>false,"dtr"=>$suppliment);
	
}

// $showLeaves = json_decode($_POST['showLeaves'],true);
$showLeaves = false;

require('fpdf181/fpdf.php');
require('../db.php');
require('../classes/dtr.php');

session_start();
if (!isset($_SESSION['id'])) {
	echo "Session timeout please login again.";
	exit();
}

$employees = [];

$con = new pdo_db();

$iso = "HRM-028-0";
$office = "LUMC";

$datef = "$year-$month";
$date = "$year-$month-01";

$firstDay = date("Y-m-d",strtotime($date));
$lastDay = date("Y-m-t",strtotime($date));

$dates = []; # boolean dates

# Holidays
$isHoliday = [];
$day = $firstDay;
while (strtotime($day) <= strtotime($lastDay)) {
	
	$dates[] = date("Y-m-d",strtotime($day));
	$isHoliday[date("Y-m-d",strtotime($day))] = false;
	// $holiday = $con->getData("SELECT * FROM holidays WHERE holiday_date = '".$day."'");
	// foreach ($holiday as $value) {
	// 	$isHoliday[date("Y-m-d",strtotime($day))] = true;
	// }
	$day = date("Y-m-d", strtotime("+1 Day", strtotime($day)));
	
}

foreach ($ids as $i => $id) {

$employee = $con->getData("SELECT empid, UPPER(CONCAT(last_name, ', ', first_name, middle_name)) employee FROM employees WHERE id = $id");

$sql = "SELECT eid, ddate, morning_in, morning_out, afternoon_in, afternoon_out, tardiness, undertime, updated FROM dtr WHERE eid = '$id' AND ddate LIKE '$datef%'";
$dtrs = $con->getData($sql);

$data = [];

if (count($dtrs) > 0) {

	foreach ($dtrs as $key => $row) {

		// $row['morning_in'] = ($row['morning_in']=="0000-00-00 00:00:00")||($row['morning_in']==null)?"-":date("h:i:s",strtotime($row['morning_in']));
		// $row['morning_out'] = ($row['morning_out']=="0000-00-00 00:00:00")||($row['morning_out']==null)?"-":date("h:i:s",strtotime($row['morning_out']));
		// $row['afternoon_in'] = ($row['afternoon_in']=="0000-00-00 00:00:00")||($row['afternoon_in']==null)?"-":date("h:i:s",strtotime($row['afternoon_in']));
		// $row['afternoon_out'] = ($row['afternoon_out']=="0000-00-00 00:00:00")||($row['afternoon_out']==null)?"-":date("h:i:s",strtotime($row['afternoon_out']));
		// // $row['overtime_in'] = ($row['overtime_in']=="0000-00-00 00:00:00")||($row['overtime_in']==null)?"-":date("h:i:s",strtotime($row['overtime_in']));
		// // $row['overtime_out'] = ($row['overtime_out']=="0000-00-00 00:00:00")||($row['overtime_out']==null)?"-":date("h:i:s",strtotime($row['overtime_out']));
		
		$row['morning_in'] = ($row['morning_in']=="0000-00-00 00:00:00")||($row['morning_in']==null)?"-":$row['morning_in'];
		$row['morning_out'] = ($row['morning_out']=="0000-00-00 00:00:00")||($row['morning_out']==null)?"-":$row['morning_out'];
		$row['afternoon_in'] = ($row['afternoon_in']=="0000-00-00 00:00:00")||($row['afternoon_in']==null)?"-":$row['afternoon_in'];
		$row['afternoon_out'] = ($row['afternoon_out']=="0000-00-00 00:00:00")||($row['afternoon_out']==null)?"-":$row['afternoon_out'];
		// $row['overtime_in'] = ($row['overtime_in']=="0000-00-00 00:00:00")||($row['overtime_in']==null)?"-":$row['overtime_in'];
		// $row['overtime_out'] = ($row['overtime_out']=="0000-00-00 00:00:00")||($row['overtime_out']==null)?"-":$row['overtime_out'];

		$data[] = array(
			date("d",strtotime($row['ddate'])),
			date("l",strtotime($row['ddate'])),
			$row['morning_in'],
			$row['morning_out'],
			$row['afternoon_in'],
			$row['afternoon_out'],
			"",
			"",
			"",
			""
		);

	};

} else {
	
	$day = $firstDay;
	while (strtotime($day) <= strtotime($lastDay)) {
		
		$data[] = array(
			date("d",strtotime($day)),
			date("l",strtotime($day)),
			"-",
			"-",
			"-",
			"-",
			"-",
			"-",
			"",
			""
		);
		
		$day = date("Y-m-d", strtotime("+1 Day", strtotime($day)));
		
	}	
	
}

# Travel Orders
$travel_orders = [];
foreach ($dates as $day) {
	
	$travel_orders[date("Y-m-d",strtotime($day))]['is_to'] = false;
	$travel_orders[date("Y-m-d",strtotime($day))]['is_wholeday'] = null;
	$travel_orders[date("Y-m-d",strtotime($day))]['is_halfday'] = null;
	// $travel_order = $con->getData("SELECT tod.tod_wholeday to_wholeday, tod.tod_halfday to_halfday FROM employees_travel_orders eto, travel_orders_dates tod WHERE eto.eto_to = tod.tod_to AND eto.empid = '$id' AND tod.tod_date = '".$day."'");
	// foreach ($travel_order as $value) {
	// 	$travel_orders[date("Y-m-d",strtotime($day))]['is_to'] = true;
	// 	$travel_orders[date("Y-m-d",strtotime($day))]['is_wholeday'] = $value['to_wholeday'];
	// 	$travel_orders[date("Y-m-d",strtotime($day))]['is_halfday'] = $value['to_halfday'];
	// }
	
}

# Leaves
$leaves = [];

// if ($showLeaves) $employees_leaves = $con->getData("SELECT * FROM employees_leaves WHERE employee_leave_credit = 0 AND empid = '$id' AND employee_leave_date_from >= '".$firstDay."' AND employee_leave_date_to <= '".$lastDay."'");
// else $employees_leaves = [];
$employees_leaves = [];

foreach ($dates as $day) {

 	$leaves[date("Y-m-d",strtotime($day))]['is_leave'] = false;
	$leaves[date("Y-m-d",strtotime($day))]['is_wholeday'] = null;
	$leaves[date("Y-m-d",strtotime($day))]['is_halfday'] = null;
	$leaves[date("Y-m-d",strtotime($day))]['leave_type'] = null;
	
	// $leave = onLeave($con,$dtrs,$employees_leaves,$day);
	// if (count($leave)) {
	// 	$leaves[date("Y-m-d",strtotime($day))]['is_leave'] = true;
	// 	$leaves[date("Y-m-d",strtotime($day))]['is_wholeday'] = isLeaveWholeDay($dtrs,$day);
	// 	$leaves[date("Y-m-d",strtotime($day))]['is_halfday'] = isLeaveHalfDay($dtrs,$day);
	// 	$leaves[date("Y-m-d",strtotime($day))]['leave_type'] = $leave['leave_type'];		
	// }
	
}

$_data = [];
$_dates = [];
if (count($data)) {
	foreach ($dates as $i => $date) {
		$doesDateExist = doesDateExist($dtrs,$data,$date);
		$_data[] = $doesDateExist['dtr'];
		$_dates[$i] = $date;
		
	}
}

$employees[] = array("empid"=>$employee[0]['empid'],"employee"=>$employee[0]['employee'],"data"=>$_data,"dates"=>$_dates,"travel_orders"=>$travel_orders,"leaves"=>$leaves,"dtrs"=>$dtrs);

} // for

$header = array(
	array(10=>"Date"),
	array(17=>"Day"),
	array(13=>"Time In"),
	array(13=>"Time Out"),
	array(13=>"Time In"),
	array(13=>"Time Out"),
	array(13=>"OT In"),
	array(13=>"OT Out"),
	array(13=>"HrsWrk"),
	array(13=>"OTHrs"),
);

$row_alignment = array("C","L","C","C","C","C","C","C","C","C");

class PDF extends FPDF
{
// Page header
function Header()
{
	
	global $iso;

    $this->SetFont('Arial','B',12);
    $this->SetTextColor(0,0,0);
    $this->Cell(0,5,"Provincial Government of La Union",0,1,'C');
    $this->SetFont('Arial','',10);
	$this->SetFontSize(10);
    $this->Cell(0,5,"City of San Fernando",0,1,'C');
	$this->Ln(2);
    $this->SetFont('Arial','B',14);
    $this->Cell(0,7,"Daily Time Record",0,1,'C');
    $this->SetFont('Arial','',8);
	$this->SetXY(-40,10);
    $this->Cell(20,5,$iso,0,0,'R');
	$this->Image("pglu-watermark-colored.png",30,55,160);

}

// Page footer
function Footer()
{	
    // Position at 1.5 cm from bottom	
    // $this->SetY(-10);
    // Arial italic 8
    // $this->SetFont('Arial','I',8);
    // Page number
    // $this->SetTextColor(66,66,66);	
    // $this->Cell(0,10,'Page '.$this->PageNo().'/{nb}',0,0,'C');
}

function table($header,$id,$employee,$data,$dtr,$travel_orders,$leaves,$dtrs)
{

	global $dates, $isHoliday, $date, $row_alignment, $office;	

	$employee = iconv('UTF-8', 'ISO-8859-1', $employee);
	
	$this->SetMargins(20,10);
	$this->SetDrawColor(0,0,0);
	$this->Line(20,32,170,32);
    $this->SetTextColor(0,0,0);
	$this->SetFont('Arial','BI',10);
	$this->SetY(33);
    $this->Cell(0,5,"$employee ($id)",0,1,'L');
	$this->SetFont('Arial','',9);
    $this->Cell(0,5,date("F Y",strtotime($date)),0,0,'L');
	$this->Ln(7);
	
    // Colors, line width and bold font
    $this->SetFillColor(120,120,120);
    $this->SetTextColor(0,0,0);
	$this->SetDrawColor(0,0,0);
    $this->SetLineWidth(.1);
    $this->SetFont('Arial','B',8);

    // Header
	$closingLine = 0;
	foreach ($header as $i => $h) {
		$this->Cell(array_keys($header[$i])[0],6,$header[$i][array_keys($header[$i])[0]],1,0,'C',true);
		$closingLine += array_keys($header[$i])[0];
	}
    $this->Ln();

    // Color and font restoration
    $this->SetFillColor(224,235,255);
    $this->SetTextColor(0,0,0);
	$this->SetFont('Arial','',8);
    // Data	

    $fill = false;
    foreach($data as $key => $row) {
		$this->SetFillColor(255,255,255);	
		$fill = false;	
		if (($row[1] == "Saturday") || ($row[1] == "Sunday")) { // Weekdays
			$this->SetFillColor(58,196,236);
			$fill = true;
		}
		if ($isHoliday[$dtr[$key]]) { // Holidays
			$this->SetFillColor(243,116,127);
			$fill = true;			
		}
		if ($travel_orders[$dtr[$key]]['is_to']) { // Travel Orders
			$this->SetFillColor(58,196,236);
			$fill = true;
		}
		if ($leaves[$dtr[$key]]['is_leave']) { // Leaves
			$this->SetFillColor(58,196,236);
			$fill = true;
		}		
		foreach ($header as $i => $h) {
			$txt = $row[array_keys($row)[$i]];
			if (($i>=2) && ($i<=5)) {
				if (isset($dtrs[$key])) {
					if (($txt=="00:00:00") && ($dtrs[$key]['updated']==0)) {
						$txt = "";
					} else {
						$txt = date("h:i:s", strtotime($txt));
					}
				}
			}
			# Travel Orders
			if ($travel_orders[$dtr[$key]]['is_to']) {
				if ($i == 1) $txt = "TO";
				if ($travel_orders[$dtr[$key]]['is_wholeday']) {
					if ($i > 5) $fill = false;
				}
				if ($travel_orders[$dtr[$key]]['is_halfday'] == "AM") {
					if ($i > 3) $fill = false;
				}
				if ($travel_orders[$dtr[$key]]['is_halfday'] == "PM") {
					$fill = false;
					if (($i == 0) || ($i == 1) || ($i == 4) || ($i == 5)) $fill = true;
				}				
			}
			#
			# Leaves
			if ($leaves[$dtr[$key]]['is_leave']) {
				if ($i == 1) $txt = $leaves[$dtr[$key]]['leave_type'];
				if ($leaves[$dtr[$key]]['is_wholeday']) {
					if ($i > 5) $fill = false;
				}
				if ($leaves[$dtr[$key]]['is_halfday'] == "AM") {
					if ($i > 3) $fill = false;
				}
				if ($leaves[$dtr[$key]]['is_halfday'] == "PM") {
					$fill = false;
					if (($i == 0) || ($i == 1) || ($i == 4) || ($i == 5)) $fill = true;
				}				
			}
			#
			if ($i > 7) $fill = false;
			$this->Cell(array_keys($header[$i])[0],4.5,$txt,1,0,$row_alignment[$i],$fill);
		}
        $this->Ln();	
    }	
    $this->Cell($closingLine,0,'','T');

	$this->Ln();
	foreach ($header as $i => $h) {
		if ($i == 6) continue;
		$w = array_keys($header[$i])[0];
		$txt = "";
		$alignment = "C";
		if ($i == 5) {
			$this->SetFont('Arial','B',8);
			$w = array_keys($header[$i])[0] + array_keys($header[$i+1])[0];
			$txt = "Days Absent:";
			$alignment = "R";
		}
		$this->Cell($w,5,$txt,($i>6)?"LBR":0,0,$alignment,0);
	}	

	$this->SetDrawColor(0,0,0);	
	$this->Ln(10);
	$this->SetFont('Arial','I',8);	
    $this->MultiCell(135,4,"I hereby CERTIFY on my honor that the above is true and correct report of the hours of work performed, record of which was made daily at the time of arrival and departure from Office.",0,'L',false);	
	$this->Ln(5);
	$this->SetX(-120);
	$this->SetFont('Arial','B',8);	
    $this->Cell(60,4,"Verified as to the prescribed office hours:",0,0,'C');
	$this->Ln(12);
    $this->Cell(70,5,$employee,"T",0,'C');
	$this->SetX(-122);	
    $this->Cell(65,5,"In Charge","T",0,'C');
	$this->SetX(20);
	$this->Ln(15);
    $this->Cell(150,5,$office,0,1,'C');

}

}

$pdf = new PDF('P','mm','Letter');
$pdf->AliasNbPages();

foreach($employees as $key => $value) {

	$pdf->SetFont('Arial','',14);	
	$pdf->AddPage();
	$pdf->table($header,$value['empid'],$value['employee'],$value['data'],$value['dates'],$value['travel_orders'],$value['leaves'],$value['dtrs']);

}

$pdf->Output();

?>