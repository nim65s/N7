* /home/saurel/telemetre/bench-ld_tb.cmd input netlist
* Creation Date : Wed Oct 16 17:08:19% CEST 2013 
*


.tran 0.001ns 100ns
.op
* User minimum step definition
.option hmin=1e-12
.option hmax=1e-6
* User integration method selection
.option trap
* User ELDO accuracy specification
.option eps=5e-3
* User ELDO accuracy specification
.option tuning=standard
.end
