module SRQC_FPGA();
	task warning;
		input [80*8:1] msg;
		begin
			$ write("WARNING at %t: %s",$time,msg);
		end
	endtask
	
	task error;
		input [80*8:1] msg;
		begin
			$ write("-ERROR- at %t: %s",$time,msg);
		end
	endtask
	
	task fatal;
		input [80*8:1] msg;
		begin
			$ write("*FATAL* at %t: %s",$time,msg);
		end
	endtask
	
	task terminate;
		begin
			$ write("Simulation compeleted");
		end
	endtask
endmodule
