* /home/saurel/telemetre/tests.cmd input netlist
* Creation Date : Wed Nov 06 14:40:36% CET 2013 
*


.tran 300ns 3.0ms
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
