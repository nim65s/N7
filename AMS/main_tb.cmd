* /home/saurel/telemetre/main_tb.cmd input netlist
* Creation Date : Wed Nov 06 14:32:50% CET 2013 
*


.tran 1.0ns 100ns
.op
* User minimum step definition
.option hmin=1e-12
.option hmax=1e-9
* User integration method selection
.option trap
* User ELDO accuracy specification
.option eps=5e-3
* User ELDO accuracy specification
.option tuning=standard
.end
