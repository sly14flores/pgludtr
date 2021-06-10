<?php

$devices = [
	["id"=>1, "location"=>"X-Ray", "ip"=>"192.168.100.2", "machine" => 1],
	["id"=>2, "location"=>"Admin", "ip"=>"192.168.100.3", "machine" => 2],
	["id"=>3, "location"=>"Security Guard", "ip"=>"192.168.100.4", "machine" => 3],
];

foreach ($devices as $i => $device) {

	$devices[$i]['location'] = $device['location']." (".$device['ip'].")";

}

echo json_encode($devices);

?>