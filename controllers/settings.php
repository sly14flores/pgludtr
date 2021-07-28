<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../db.php';

switch ($_GET['r']) {

    case "view":

        $con = new pdo_db();
        $sql = "SELECT * FROM settings WHERE id = 1";        
        $settings = $con->getData($sql);

        $data = [
            "dtr_header" => null,
            "dtr_sub_header" => null
        ];

        if (count($settings)) {
            $data['dtr_header'] = $settings[0]['dtr_header']; //
            $data['dtr_sub_header'] = $settings[0]['dtr_sub_header']; //
        }

        echo json_encode($data);

        break;

    case "update":

		$con = new pdo_db("settings");        

        $_POST['id'] = 1;
        $update = $con->updateData($_POST,'id');

        break;

}

?>