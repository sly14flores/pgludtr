<?php

class log_order {
	
	var $schedules;
	var $isFlexi;
	
	function __construct($con,$id) {
		
		$this->isFlexi = false;
		
		$schedule = $con->getData("SELECT schedule_id FROM employees WHERE id = $id");
		$schedules = $con->getData("SELECT * FROM schedule_details WHERE schedule_id = ".$schedule[0]['schedule_id']." ORDER BY id");
		
		if ($schedule[0]['schedule_id']==0) $this->isFlexi = true;		
		
		foreach ($schedules as $key => $schedule) {
			
			unset($schedules[$key]['id']);
			unset($schedules[$key]['schedule_id']);
			unset($schedules[$key]['day']);
			$this->schedules[$schedule['day']] = $schedules[$key];
			
		}

	}
	
	function allot($date,$log,$ta) {

		$allotment = null;

		$tlog = strtotime($log);		
		
		if ($this->isFlexi) {
			
			if ($ta) $allotment = array("morning_in"=>date("H:i:s",$tlog));
			else $allotment = array("afternoon_out"=>date("H:i:s",$tlog));
			
		} else {
		
			$morning_cutoff = strtotime("$date ".$this->schedules[date("l",strtotime($date))]['morning_cutoff']);
			$lunch_cutoff = strtotime("$date ".$this->schedules[date("l",strtotime($date))]['lunch_break_cutoff']);
			$afternoon_cutoff = strtotime("$date ".$this->schedules[date("l",strtotime($date))]['afternoon_cutoff']);
			
			if ($tlog < $morning_cutoff) $allotment = array("morning_in"=>date("H:i:s",$tlog));
			if ( ($tlog >= $morning_cutoff) && ($tlog < $lunch_cutoff) ) $allotment = array("morning_out"=>date("H:i:s",$tlog));

			if ( ($tlog < $afternoon_cutoff) && ($tlog >= $lunch_cutoff) ) $allotment = array("afternoon_in"=>date("H:i:s",$tlog));
			if ($tlog >= $afternoon_cutoff) $allotment = array("afternoon_out"=>date("H:i:s",$tlog));
		
		}
		
		return $allotment;

	}

}

?>