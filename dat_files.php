<?php

$dat_files = array(
	array("machine"=>1,"location"=>"Admin","file"=>"3574154000074_attlog"),
	array("machine"=>2,"location"=>"Hospital","file"=>"3574154000120_attlog")
);

function getDeviceNo($dev) {
	
	global $dat_files;
	$no = 0;
	
	foreach ($dat_files as $i => $dat_file) {

		if (explode("_",$dat_file["file"])[0] == $dev) {
			$no = $dat_file["machine"];
			break;
		}
	
	}
	
	return $no;
	
}

function getLocation($no) {

	global $dat_files;
	$loc = "";
	
	foreach ($dat_files as $i => $dat_file) {

		if ($no == $dat_file['machine']) {
			$loc = $dat_file["location"];
			break;
		}
	
	}
	
	return $loc;
	
}

?>