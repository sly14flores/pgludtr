<?php

$devices = [
	["id"=>1, "location"=>"Main", "ip"=>"10.10.32.3", "machine" => 1],
	["id"=>2, "location"=>"Lobby", "ip"=>"", "machine" => 2],
];

echo json_encode($devices);

?>