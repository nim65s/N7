* /home/saurel/telemetre/osc_tb.cmd input netlist
* Creation Date : Wed Oct 16 16:12:20% CEST 2013 
*


.tran 1e-09 100e-9
.op
* User minimum step definition
.option hmin=1e-12
* User maximum step definition
.option hmax=1e-9
* User integration method selection
.option trap
* User ELDO accuracy specification
.option eps=5e-3
* User ELDO accuracy specification
.option tuning=standard
.end
