<?php

class log_order {

	function logsWBreak($date,$log,$cutoffs) {

		$order = "";
		
		$morning_cutoff = strtotime("$date ".$cutoffs['morning']);
		$lunch_cutoff = strtotime("$date ".$cutoffs['lunch_break']);
		$afternoon_cutoff = strtotime("$date ".$cutoffs['afternoon']);

		$tlog = strtotime($log);
		
		if ($tlog < $morning_cutoff) $order = "morning_in";		
		if ( ($tlog >= $morning_cutoff) && ($tlog < $lunch_cutoff) ) $order = "morning_out";

		if ( ($tlog < $afternoon_cutoff) && ($tlog >= $lunch_cutoff) ) $order = "afternoon_in";
		if ($tlog >= $afternoon_cutoff) $order = "afternoon_out";
		
		return $order;

	}

}

?>