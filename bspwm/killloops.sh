#!/bin/bash
#get pid number to kill
pid_number_externalscreenauto=$(ps fjx | grep "[s]leep 2" | awk '{print $1}')
pid_number_change_background=$(ps fjx | grep "[s]leep 301" | awk '{print $1}')

kill $pid_number_externalscreenauto 
kill $pid_number_change_background
