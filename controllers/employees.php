<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../db.php';

switch ($_GET['r']) {
	
	case "start":
	
		$con = new pdo_db();
		
		$sql = "SELECT id, empid, CONCAT(first_name, ' ', last_name) full_name FROM employees WHERE is_built_in != 1";
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
		$picture = "../pictures/".$_POST['empid'].".jpg";
		if (file_exists($picture)) unlink($picture);
		
		$delete = $con->deleteData(array("id"=>implode(",",$_POST['id'])));
	
	break;
	
	case "upload_profile_picture":
		
		$dir = "../pictures/";
		
		move_uploaded_file($_FILES['file']['tmp_name'],$dir."$_GET[empid]$_GET[en]");

	break;
	
	case "update":
		
		$_POST['birthday'] = (isset($_POST['birthday'])) ? date("Y-m-d",strtotime($_POST['birthday'])) : "0000-00-00";
		
		$con = new pdo_db("employees");
		
		$update = $con->updateData($_POST,'id');
		
	break;
	
	case "view":
	
		$con = new pdo_db();
		
		$employee = $con->getData("SELECT * FROM employees WHERE id = $_POST[id]");
		// $employee[0]['birthday'] = date("Y-m-d",strtotime($employee[0]['birthday']));
		
		echo json_encode($employee[0]);
	
	break;
}

?>