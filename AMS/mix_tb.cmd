* /home/saurel/telemetre/mix_tb.cmd input netlist
* Creation Date : Fri Oct 25 11:22:36% CEST 2013 
*


.tran 0.1ms 10ms
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
