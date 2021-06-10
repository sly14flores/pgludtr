<?php

$_POST = json_decode(file_get_contents('php://input'), true);

include("zklib/ZKLib.php");

$attendances = [];
$enableGetData = true;

$zk = new ZKLib($_POST['ip'], 4370);

$ret = $zk->connect();

sleep(1);
if ($ret) {
	
	$zk->disableDevice();
	sleep(1);

	$zk->enableDevice();
	sleep(1);
	
	// $user = $zk->getUser();
	
	if($enableGetData === true) {
		
		$attendances = $zk->getAttendance();
		// $attendances = array_reverse($attendances, true;
		
	};	
	
	$zk->disconnect();
	
};

// var_dump($attendances); exit();

$r_logs = [];
foreach ($attendances as $attendance) {

	$date = substr($attendance['timestamp'],0,10);

	$r_logs[] = array(
		"date"=>$date,
		"log"=>$attendance['timestamp'],
		"machine"=>$_POST['machine'],
		"pers_id"=>$attendance['id']
	);


};

$_logs = [];

$begin = date("Y-m-d",strtotime($_POST['start']));
$end = date("Y-m-d",strtotime($_POST['end']));

$day = $begin;
while (strtotime($day) <= strtotime($end)) {

	foreach ($r_logs as $l) {

		if ($l['date'] == $day) {

			$_logs[] = $l;

		};

	};

	$day = date ("Y-m-d", strtotime("+1 day", strtotime($day)));

};

$logs = $_logs;

echo json_encode($logs);

?>