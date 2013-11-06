* /home/saurel/telemetre/3.cmd input netlist
* Creation Date : Wed Oct 16 16:06:20% CEST 2013 
*


.tran 0.1ns 10ns
.op
* User minimum step definition
.option hmin=1e-12
* User integration method selection
.option method=gear MAXORD=2
* User ELDO accuracy specification
.option eps=5e-3
* User ELDO accuracy specification
.option tuning=standard
.end
