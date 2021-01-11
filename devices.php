<?php

$devices = [
	["id"=>1, "location"=>"Main", "ip"=>"10.10.26.88", "machine" => 1],
	["id"=>2, "location"=>"Lobby", "ip"=>"", "machine" => 2],
];

foreach ($devices as $i => $device) {

	$devices[$i]['location'] = $device['location']." (".$device['ip'].")";

}

echo json_encode($devices);

?>