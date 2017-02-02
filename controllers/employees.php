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
		$_POST['schedule_id'] = $_POST['schedule_id']['id'];
		
		$con = new pdo_db("employees");
		
		if (isset($_POST['has_profile_pic'])) unset($_POST['has_profile_pic']);
		$update = $con->updateData($_POST,'id');
		
	break;
	
	case "view":
	
		$con = new pdo_db();
		
		$employee = $con->getData("SELECT *, (SELECT description FROM schedules WHERE id = schedule_id) description FROM employees WHERE id = $_POST[id]");
		$picture = "../pictures/".$employee[0]['empid'].".jpg";
		$employee[0]['schedule_id'] = array("id"=>$employee[0]['schedule_id'],"description"=>$employee[0]['description']);
		unset($employee[0]['description']);
		$employee[0]['has_profile_pic'] = file_exists($picture);
		
		echo json_encode($employee[0]);
	
	break;
	
	case "dtr":
	
		$table = [];
		$table["columns"][] = array("title"=>"Date","dataKey"=>"date");
		$table["columns"][] = array("title"=>"Day","dataKey"=>"day");
		$table["columns"][] = array("title"=>"Time In","dataKey"=>"morning_in");
		$table["columns"][] = array("title"=>"Time Out","dataKey"=>"morning_out");
		$table["columns"][] = array("title"=>"Time In","dataKey"=>"afternoon_in");
		$table["columns"][] = array("title"=>"Time Out","dataKey"=>"afternoon_out");
		$table["columns"][] = array("title"=>"Tardiness","dataKey"=>"tardiness");
	
		$date = "2017-01-01";
		$start = date("Y-m-d",strtotime($date));
		$end = date("Y-m-t",strtotime($date));		
	
		$key = 0;
		while (strtotime($start) <= strtotime($end)) {
			
			$table["rows"][$key]["date"] = date("j",strtotime($start));
			$table["rows"][$key]["day"] = date("D",strtotime($start));
			$table["rows"][$key]["morning_in"] = "";
			$table["rows"][$key]["morning_out"] = "";
			$table["rows"][$key]["afternoon_in"] = "";
			$table["rows"][$key]["afternoon_out"] = "";
			$table["rows"][$key]["tardiness"] = "";
			
			$start = date("Y-m-d", strtotime("+1 day", strtotime($start)));	
			$key++;			
			
		}
	
		echo json_encode($table);
	
	break;
	
	case "schedules":
	
		$con = new pdo_db();
		
		$results = $con->getData("SELECT * FROM schedules");
		
		$schedules[0] = array("id"=>0,"description"=>"Default");
		foreach ($results as $result) {
			$schedules[] = $result;
		}

		echo json_encode($schedules);
	
	break;
	
}

?>