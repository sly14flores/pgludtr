<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../db.php';

switch ($_GET['r']) {
	
	case "start":
	
		$con = new pdo_db();
		
		$sql = "SELECT * FROM schedules";
		$schedules = $con->getData($sql);
		
		echo json_encode($schedules);
	
	break;

	case "new":

		$con = new pdo_db("schedules");
		
		$schedule = $con->insertData(array("description"=>$_POST['description']));
		
		echo $con->insertId;
	
	break;
	
	case "update":
	
		$con = new pdo_db("schedules");
		
		$schedule = $con->updateData(array("id"=>$_POST['id'],"description"=>$_POST['description']),"id");
	
	break;
	
	case "cancel":

		$con = new pdo_db("schedules");		
		$delete = $con->deleteData(array("id"=>implode(",",$_POST['id'])));
	
	break;	
	
}

?>