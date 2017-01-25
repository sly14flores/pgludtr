<?php

$dat_files = array(
	array("machine"=>1,"location"=>"","file"=>"3574154000004_attlog")
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

?>