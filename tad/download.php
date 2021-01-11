<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require 'vendor/autoload.php';

require 'lib/TADFactory.php';
require 'lib/TAD.php';
require 'lib/TADResponse.php';
require 'lib/Providers/TADSoap.php';
require 'lib/Providers/TADZKLib.php';
require 'lib/Exceptions/ConnectionError.php';
require 'lib/Exceptions/FilterArgumentError.php';
require 'lib/Exceptions/UnrecognizedArgument.php';
require 'lib/Exceptions/UnrecognizedCommand.php';

use TADPHP\TADFactory;
use TADPHP\TAD;

$machine = isset($_POST['machine'])?$_POST['machine']:0;

$options = array(
	'ip'=>$_POST['ip'],
	'internal_id'=>1,    // 1 by default.
	'com_key'=>0,        // 0 by default.
	'description'=>'N/A', // 'N/A' by default.
	'soap_port'=>80,     // 80 by default,
	'udp_port'=>4370,      // 4370 by default.
	'encoding'=>'iso8859-1'    // iso8859-1 by default. / utf-8
);

try {

	$tad_factory = new TADFactory($options);
	$tad = $tad_factory->get_instance();

	$filter_dates = array("start"=>date("Y-m-d",strtotime($_POST['start'])),"end"=>date("Y-m-d",strtotime($_POST['end'])));	
	$logs = $tad->get_att_log()->filter_by_date($filter_dates);

	if ($logs->is_empty_response()) {

		echo "no_logs";
		exit();

	}

	$logs_arr = $logs->to_array();
	$parsed_logs = parseLogs($logs_arr);

	echo json_encode($parsed_logs);	

} catch (Exception $e) {



}

function parseLogs($logs) {

	global $machine;

	$parsed_logs = [];

	/**
	 * pers_id
	 * date
	 * log
	 * machine
	 */
	foreach ($logs['Row'] as $log) {

		$date = explode(" ",$log['DateTime']);
		$row = [
			'pers_id'=>$log['PIN'],
			'date'=>$date[0],
			'log'=>$log['DateTime'],
			'machine'=>$machine
		];
		$parsed_logs[] = $row;

	}

	return $parsed_logs;

}

?>