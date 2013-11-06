* /home/saurel/telemetre/pd_tb.cmd input netlist
* Creation Date : Wed Nov 06 15:05:22% CET 2013 
*


.tran 0.1ns 10ns
.op
* User minimum step definition
.option hmin=1e-12
* User integration method selection
.option trap
* User ELDO accuracy specification
.option eps=5e-3
* User ELDO accuracy specification
.option tuning=standard
.end
