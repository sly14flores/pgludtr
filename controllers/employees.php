<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../db.php';

switch ($_GET['r']) {
	
	case "start":
	
		$con = new pdo_db();
		
		$sql = "SELECT * FROM employees WHERE is_built_in != 1";
		$employees = $con->getData($sql);
		
		echo json_encode($employees);
	
	break;
	
	case "new":

		$con = new pdo_db("employees");
		
		$employee = $con->insertData(array("is_built_in"=>0));
		
		echo $con->insertId;
	
	break;
	
	case "cancel":
		
		$con = new pdo_db("employees");
		
		$delete = $con->deleteData(array("id"=>implode(",",$_POST['id'])));
	
	break;
	
	case "upload_profile_picture":
		
		$dir = "pictures/";
		
		move_uploaded_file($_FILES['file']['tmp_name'],$dir."$_GET[empid]$_GET[en]");

	break;
	
}

?>