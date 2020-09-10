version 14.1
clear all
set maxvar 32000
set more off
capture log close

* log using "y97_import_all.log", replace

* This file will execute all do files in the `secretdir'
* See other Master files to execute other files
* Must be executed in `secretdir' (no subfolder/other dir)
* Should `ln -s' this file and run the sym link
* Q1: Will all the sub-log files be appropriately created?
* Q2: Should we add code that only runs the do file if it
*     is significantly (>1 day) newer than the log file?
* Q3: Should we apply programmer's option below?
*     15.6 Creating multiple log files for simultaneous use
*     Programmers or advanced users may want to create more than one log file for simultaneous use.
*     For example, you may want a log file of your whole session but want a separate log file for part of
*     your session.
*     You can create multiple logs by using log’s name() option; see [R] log.

cd y79/Geocode
do y79_import_all.do
do y79_create_geocode.do
do y79_create_trim2.do

cd ../../y97/Geocode
do y97_import_all.do
do y97_create_geocode.do
do y97_create_trim2.do

cd ../..
do data_append_t0_16.do
do create_vlad_scaled_t0_16.do

* log close