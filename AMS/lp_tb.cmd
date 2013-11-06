* /home/saurel/telemetre/lp_tb.cmd input netlist
* Creation Date : Fri Oct 25 12:12:47% CEST 2013 
*


.ac dec 10 1 1e6
.op
* User minimum step definition
.option hmin=1e-12
* User maximum step definition
.option hmax=1e-6
* User integration method selection
.option trap
* User ELDO accuracy specification
.option eps=5e-3
* User ELDO accuracy specification
.option tuning=standard
.end
