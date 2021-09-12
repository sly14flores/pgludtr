<?php

$devices = [
	["id"=>1, "location"=>"X-Ray", "ip"=>"192.168.100.2", "machine" => 1, "type" => "tad"],
	["id"=>2, "location"=>"Admin", "ip"=>"192.168.100.3", "machine" => 2, "type" => "tad"],
	["id"=>3, "location"=>"Security Guard", "ip"=>"192.168.100.4", "machine" => 3, "type" => "zklib"],
];

foreach ($devices as $i => $device) {

	$devices[$i]['location'] = $device['location']." (".$device['ip'].")";

}

echo json_encode($devices);

?>