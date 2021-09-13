<?php

require 'vendor/autoload.php';

use Carbon\Carbon;

function computeWorkHour($date,$morning_in,$morning_out,$afternoon_in,$afternoon_out)
{
  $work_hour = "";

  $has_morning_in = $morning_in != "00:00:00";
  $has_morning_out = $morning_out != "00:00:00";
  $has_afternoon_in = $afternoon_in != "00:00:00";
  $has_afternoon_out = $afternoon_out != "00:00:00";

  $has_wholeday = $has_morning_in && $has_morning_out && $has_afternoon_in && $has_afternoon_out;
  
  $has_morning_only = $has_morning_in && $has_morning_out && !$has_afternoon_in && !$has_afternoon_out;
  $has_morning_in_out_in = $has_morning_in && $has_morning_out && $has_afternoon_in && !$has_afternoon_out;
  $has_morning_in_out_out = $has_morning_in && $has_morning_out && !$has_afternoon_in && $has_afternoon_out;
  
  $has_afternoon_only = !$has_morning_in && !$has_morning_out && $has_afternoon_in && $has_afternoon_out;
  $has_afternoon_out_in_out = !$has_morning_in && $has_morning_out && $has_afternoon_in && $has_afternoon_out;
  $has_afternoon_in_in_out = $has_morning_in && !$has_morning_out && $has_afternoon_in && $has_afternoon_out;

  $has_morning_in_afternoon_out = $has_morning_in && !$has_morning_out && !$has_afternoon_in && $has_afternoon_out;

  $has_morning_in_only = $has_morning_in && !$has_morning_out && !$has_afternoon_in && !$has_afternoon_out;
  $has_morning_out_only = !$has_morning_in && $has_morning_out && !$has_afternoon_in && !$has_afternoon_out;
  $has_afternoon_in_only = !$has_morning_in && !$has_morning_out && $has_afternoon_in && !$has_afternoon_out;
  $has_afternoon_out_only = !$has_morning_in && !$has_morning_out && !$has_afternoon_in && $has_afternoon_out;

  if ($has_wholeday) {
    $morning_start = new Carbon("$date $morning_in");
    $morning_end = new Carbon("$date $morning_out");
    $morning_wh = $morning_start->diff($morning_end)->format('%H:%I:%S');
    $afternoon_start = new Carbon("$date $afternoon_in");
    $afternoon_end = new Carbon("$date $afternoon_out");
    $afternoon_wh = $afternoon_start->diff($afternoon_end);
    $work_hour = Carbon::createFromFormat('H:i:s',$morning_wh)->
                addHours(intval($afternoon_wh->format("%H")))->
                addMinutes(intval($afternoon_wh->format("%I")))->
                addSeconds(intval($afternoon_wh->format("%S")))->
                format('H:i:s');
  }

  if ($has_morning_only || $has_morning_in_out_in || $has_morning_in_out_out) {
    $start = new Carbon("$date $morning_in");
    $end = new Carbon("$date $morning_out");
    $work_hour = $start->diff($end)->format('%H:%I:%S');
  }

  if ($has_afternoon_only || $has_afternoon_out_in_out || $has_afternoon_in_in_out) {
    $start = new Carbon("$date $afternoon_in");
    $end = new Carbon("$date $afternoon_out");
    $work_hour = $start->diff($end)->format('%H:%I:%S');
  }

  if ($has_morning_in_afternoon_out) {
    $start = new Carbon("$date $morning_in");
    $end = new Carbon("$date $afternoon_out");
    $work_hour = $start->diff($end)->format('%H:%I:%S');
  }

  if ($has_morning_in_only) {
    $start = new Carbon("$date $morning_in");
    $end = new Carbon("$date 00:00:00");
    $end = $end->addDay();
    $work_hour = $start->diff($end)->format('%H:%I:%S');
  }

  if ($has_morning_out_only) {
    $start = new Carbon("$date 00:00:00");
    $end = new Carbon("$date $morning_out");
    $work_hour = $start->diff($end)->format('%H:%I:%S');
  }

  if ($has_afternoon_in_only) {
    $start = new Carbon("$date $afternoon_in");
    $end = new Carbon("$date 00:00:00");
    $end = $end->addDay();
    $work_hour = $start->diff($end)->format('%H:%I:%S');
  }

  if ($has_afternoon_out_only) {
    $start = new Carbon("$date 00:00:00");
    $end = new Carbon("$date $afternoon_out");
    $work_hour = $start->diff($end)->format('%H:%I:%S');
  }

  return $work_hour;

}

function addWorkHours($hours,$addHours)
{
  $his = explode(":",$addHours);
  $workHours = Carbon::parse($hours)->
                addHours(intval($his[0]))->
                addMinutes(intval($his[1]))->
                addSeconds(intval($his[2]))->
                format('Y-m-d H:i:s');
  return $workHours;
}

function totalWorkHours($start,$end)
{
  $startTime = Carbon::parse($start);
  $finishTime = Carbon::parse($end);
  $totalDuration = $finishTime->floatDiffInHours($startTime);
  $totalWorkHours = round($totalDuration,2);
  return $totalWorkHours;
}

?>