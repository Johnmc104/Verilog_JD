module SRQC_FPGA(clk,rst_n,mcu_cs_n,mcu_wr_n,mcu_addr,mcu_db);
	input clk;
	input rst_n;
	
	input mcu_cs_n;
	input mcu_wr_n;
	input [3:0] mcu_addr;
	input [7:0] mcu_db;
	
	reg [3:0] mcu_addr_r;
	reg [7:0] mcu_db_r;
	
	wire wr_state=mcu_cs_n||mcu_wr_n;
	
	always @ (posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					mcu_addr_r<=4'h0;
					mcu_db_r<=8'h00;
				end
			else if (!wr_state)
				begin
					mcu_addr_r<=mcu_addr;
					mcu_db_r<=mcu_db;
				end
		end
	
	wire pos_wr;
	reg wr1,wr2;
	
	always @ (posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					wr1<=1'b1;
					wr2<=1'b1;
				end
			else
				begin
					wr1<=wr_state;
					wr2<=wr1;
				end
		end

	assign pos_wr = ~wr2&&wr1;
endmodule
