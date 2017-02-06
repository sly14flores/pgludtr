<?php

require('fpdf181/fpdf.php');
require('../db.php');

$con = new pdo_db();


class PDF extends FPDF
{
// Page header
function Header()
{

	// $this->Ln(25);	
    $this->SetFont('Arial','B',12);
    $this->SetTextColor(66,66,66);
    $this->Cell(0,5,"Provincial Government of La Union",0,1,'C');
    $this->SetFont('Arial','',10);
	$this->SetFontSize(10);
    $this->Cell(0,5,"San Fernando City, La Union",0,1,'C');
	$this->Ln(2);	
    $this->SetFont('Arial','B',14);
    $this->Cell(0,7,"Daily Time Record",0,1,'C');
	$this->SetDrawColor(92,92,92);	
	$this->Line(20,36,195,36);

}

// Page footer
function Footer()
{	
    // Position at 1.5 cm from bottom	
    $this->SetY(-10);
    // Arial italic 8
    $this->SetFont('Arial','I',8);
    // Page number
    $this->SetTextColor(66,66,66);	
    $this->Cell(0,10,'Page '.$this->PageNo().'/{nb}',0,0,'C');
}

function table($header, $data)
{
	
	$this->SetMargins(20,0);
    $this->Ln(2);
    $this->SetTextColor(66,66,66);
	$this->SetFont('Arial','B',10);
    $this->Cell(0,5,"QUINIVISTA, VANESSA L.",0,1,'L');
    $this->Ln(1);	
	$this->SetFont('Arial','',9);
    $this->Cell(87.5,4,"December 2016",0,0,'L');
    $this->Cell(87.5,4,"BDH Casuals",0,0,'R');
    
	$this->Ln(7);
	
    // Colors, line width and bold font
    $this->SetFillColor(60,159,223);
    $this->SetTextColor(66,66,66);
	$this->SetDrawColor(92,92,92);
    $this->SetLineWidth(.1);
    $this->SetFont('Arial','B',8);

    // Header
	$closingLine = 0;
	foreach ($header as $i => $h) {
		$this->Cell(array_keys($header[$i])[0],7,$header[$i][array_keys($header[$i])[0]],1,0,'C',true);
		$closingLine += array_keys($header[$i])[0];
	}
    $this->Ln();
	
    // Color and font restoration
    $this->SetFillColor(224,235,255);
    $this->SetTextColor(66,66,66);
	$this->SetFont('Arial','',8);
    // Data	
	
    $fill = false;
    foreach($data as $key => $row) {
		foreach ($header as $i => $h) {
			$this->Cell(array_keys($header[$i])[0],5,$row[array_keys($row)[$i]],1,0,'C',$fill);
		}
        $this->Ln();
        // $fill = !$fill;		
    }	
    $this->Cell($closingLine,0,'','T');
	
	$this->Ln(2);
	$this->SetFont('Arial','B',8);
	$this->SetX(-86);
    $this->Cell(10,4,"Total:",0,0,'R');
	$this->Ln();
	$this->SetX(-96);	
    $this->Cell(20,4,"Days Absent:",0,0,'R');

	$this->Ln(8);
	$this->SetFont('Arial','I',8);	
    $this->Cell(0,4,"I hereby CERTIFY on my honor that the above is true and correct report of the hours of work performed, record of which was made daily",0,1,'L');	
    $this->Cell(0,4,"at the time of arrival and departure from Office.",0,1,'L');
	$this->Ln(5);
	$this->SetFont('Arial','B',8);	
    $this->Cell(0,4,"Verified as to the prescribed office hours",0,1,'R');
	$this->Ln(10);	
    $this->Cell(87.5,5,"QUINIVISTA, VANESSA L.",0,0,'C');
    $this->Cell(87.5,5,"Head/Supervisor",0,0,'C');
	$this->SetDrawColor(92,92,92);	
	$this->Line(30,246,97,246);
	$this->Line(118,246,185,246);

}

}

$pdf = new PDF('P','mm','Letter');
$pdf->AliasNbPages();
$pdf->AddPage();
$pdf->SetFont('Arial','',14);

$header = array(
	array(25=>"Date"),
	array(20=>"Day"),
	array(25=>"Time In"),
	array(25=>"Time Out"),
	array(25=>"Time In"),
	array(25=>"Time Out"),
	array(30=>"Tardiness")
);

// $sql = "";
// $data = $con->getData($sql);

$date = "2017-01-01";
$start = date("Y-m-d",strtotime($date));
$end = date("Y-m-t",strtotime($date));		
$data = [];

while (strtotime($start) <= strtotime($end)) {
	
	$data[] = array(date("j",strtotime($start)),
			date("D",strtotime($start)),
			"Time In",
			"Time Out",
			"Time In",			
			"Time Out",
			"Tardiness"
	);
	
	$start = date("Y-m-d", strtotime("+1 day", strtotime($start)));	
	
}

$pdf->table($header,$data);
$pdf->Output();

?>