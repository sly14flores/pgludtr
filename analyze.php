<?php

class log_order {
	
	var $schedules;
	
	function __construct($con,$id) {
		
		$schedule = $con->getData("SELECT schedule_id FROM employees WHERE id = $id");
		$schedules = $con->getData("SELECT * FROM schedule_details WHERE schedule_id = ".$schedule[0]['schedule_id']." ORDER BY id");
		
		foreach ($schedules as $key => $schedule) {
			
			unset($schedules[$key]['id']);
			unset($schedules[$key]['schedule_id']);
			unset($schedules[$key]['day']);
			$this->schedules[$schedule['day']] = $schedules[$key];
			
		}		

	}
	
	function allot($date,$log) {

		$allotment = null;
		
		$morning_cutoff = strtotime("$date ".$this->schedules[date("l",strtotime($date))]['morning_cutoff']);
		$lunch_cutoff = strtotime("$date ".$this->schedules[date("l",strtotime($date))]['lunch_break_cutoff']);
		$afternoon_cutoff = strtotime("$date ".$this->schedules[date("l",strtotime($date))]['afternoon_cutoff']);

		$tlog = strtotime($log);
		
		if ($tlog < $morning_cutoff) $allotment = array("morning_in"=>date("H:i:s",$tlog));
		if ( ($tlog >= $morning_cutoff) && ($tlog < $lunch_cutoff) ) $allotment = array("morning_out"=>date("H:i:s",$tlog));

		if ( ($tlog < $afternoon_cutoff) && ($tlog >= $lunch_cutoff) ) $allotment = array("afternoon_in"=>date("H:i:s",$tlog));
		if ($tlog >= $afternoon_cutoff) $allotment = array("afternoon_out"=>date("H:i:s",$tlog));
		
		return $allotment;

	}

}

?>