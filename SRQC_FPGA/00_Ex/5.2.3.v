//三段式状态机
//RD_S1依然消失
module SRQC_FPGA(clk,rst,wr_req,rd_req,cmd);
	input clk,rst;
	input wr_req,rd_req;
	output cmd;
	
	reg [3:0] cstate,nstate,cmd;
	
	parameter
		IDLE=3'b111,
		WR_S1=3'b011,
		WR_S2=3'b101,
		RD_S1=3'b011,
		RD_S2=3'b110;
	
	always @ (posedge clk or negedge rst)
		begin
			if(!rst)
				cstate<=IDLE;
			else
				cstate<=nstate;
		end

	always @ (cstate or wr_req or rd_req)
		begin
			case(cstate)
				IDLE:
					if(wr_req)
						nstate<=WR_S1;

					else if(rd_req)
						nstate<=RD_S1;
						
					else
						nstate<=IDLE;
							
				WR_S1:
						nstate<=WR_S2;

				WR_S2:
						nstate<=IDLE;
							
				RD_S1:
					if(wr_req)
						nstate<=WR_S2;
						
					else
						nstate<=RD_S2;
						
				RD_S2:
					if(wr_req)
						nstate<=WR_S1;

					else
						nstate<=IDLE;

					default:
						nstate<=IDLE;
			endcase
		end
		
	always @ (posedge clk or negedge rst)
		begin
			if(!rst)
				cmd<=3'b111;
			
			else
				begin
					case(nstate)
						IDLE:
							if(wr_req)
								cmd<=3'b011;
							else if(rd_req)
								cmd<=3'b011;
							else
								cmd<=3'b111;

						WR_S1:
							cmd<=3'b101;
						
						WR_S2:
							cmd<=3'b111;
							
						RD_S1:
							if(wr_req)
								cmd<=3'b101;
							else
								cmd<=3'b110;
						
						RD_S2:
							if(wr_req)
								cmd<=3'b011;
							else
								cmd<=3'b111;
						
						default: ;
					endcase
				end
		end
endmodule
