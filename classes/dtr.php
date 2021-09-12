<?php

function onLeave($con,$dtr,$employees_leaves,$day) {
	
	$leave = [];
	
	foreach ($employees_leaves as $el) {

		if ( (strtotime($day) >= strtotime($el['employee_leave_date_from'])) && (strtotime($day) <= strtotime($el['employee_leave_date_to']." 23:59:59")) ) {
			
			# except weekends
			if ( (date("D",strtotime($day))!="Sat") && (date("D",strtotime($day))!="Sun") ) {
				
				# check if days between from and to has no DTR
				if (noDTR($dtr,$day)) {
				
					# count days		
					$days = countDays($el['employee_leave_date_from'],$el['employee_leave_date_to']);
					$leave = $el;
					
					# leave type
					$q = $con->getData("SELECT leave_type_shortname FROM leave_types WHERE leave_type_id = ".$leave['employee_leave_type']);
					$leave['leave_type'] = $q[0]['leave_type_shortname'];
					
				}
				
			};

		};
	
	};
	
	return $leave;
	
};

function countDays($start,$end) {
	
	$days = 0;
	while (strtotime($start) <= strtotime($end)) {
		$days++;
		$start = date("Y-m-d",strtotime("+1 Day",strtotime($start)));
	}
	
	return $days;
	
};

function isLeaveWholeDay($dtr,$day) {
	
	$wholeday = false;
	
	foreach ($dtr as $d) {
		
		if ($d['date'] == $day) {
		
			$morning_in = (($d['morning_in'] == "0000-00-00 00:00:00")||($d['morning_in'] == null))?true:false;
			$morning_out = (($d['morning_out'] == "0000-00-00 00:00:00")||($d['morning_out'] == null))?true:false;
			$afternoon_in = (($d['afternoon_in'] == "0000-00-00 00:00:00")||($d['afternoon_in'] == null))?true:false;
			$afternoon_out = (($d['afternoon_out'] == "0000-00-00 00:00:00")||($d['afternoon_out'] == null))?true:false;
			
			$wholeday = $morning_in && $morning_out && $afternoon_in && $afternoon_out;
			
		}
		
	};
	
	return $wholeday;
	
};

function isLeaveHalfDay($dtr,$day) {
	
	$halfday = false;
	
	foreach ($dtr as $d) {
		
		if ($d['date'] == $day) {
		
			$morning_in = (($d['morning_in'] == "0000-00-00 00:00:00")||($d['morning_in'] == null))?true:false;
			$morning_out = (($d['morning_out'] == "0000-00-00 00:00:00")||($d['morning_out'] == null))?true:false;
			$afternoon_in = (($d['afternoon_in'] == "0000-00-00 00:00:00")||($d['afternoon_in'] == null))?true:false;
			$afternoon_out = (($d['afternoon_out'] == "0000-00-00 00:00:00")||($d['afternoon_out'] == null))?true:false;
			
			$am = $morning_in && $morning_out;
			$pm = $afternoon_in && $afternoon_out;
			
			if ($am && !$pm) $halfday = "AM";
			if (!$am && $pm) $halfday = "PM";
		
		}
		
	};
	
	return $halfday;
	
};

function noDTR($dtr,$day) {
	
	$noDTR = false;
	
	foreach ($dtr as $d) {
		
		if ($d['date'] == $day) {
		
			$morning_in = (($d['morning_in'] == "0000-00-00 00:00:00")||($d['morning_in'] == null))?true:false;
			$morning_out = (($d['morning_out'] == "0000-00-00 00:00:00")||($d['morning_out'] == null))?true:false;
			$afternoon_in = (($d['afternoon_in'] == "0000-00-00 00:00:00")||($d['afternoon_in'] == null))?true:false;
			$afternoon_out = (($d['afternoon_out'] == "0000-00-00 00:00:00")||($d['afternoon_out'] == null))?true:false;
			
			$noDTR = $morning_in && $morning_out && $afternoon_in && $afternoon_out;
			// file_put_contents("debug.txt",$noDTR,FILE_APPEND);
			
		}
		
	};
	
	return $noDTR;
	
};

?>