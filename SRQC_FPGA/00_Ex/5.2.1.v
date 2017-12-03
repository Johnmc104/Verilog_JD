//一段式状态机
//SMV中RD_S1神秘消失，黑人问号脸！
module SRQC_FPGA(clk,rst,wr_req,rd_req,cmd);
	input clk,rst;
	input wr_req,rd_req;
	output cmd;
	
	reg nstate;
	reg [3:0] cstate,cmd;
	
	parameter
		IDLE=3'b111,
		WR_S1=3'b011,
		WR_S2=3'b101,
		RD_S1=3'b011,
		RD_S2=3'b110;
	
	always @ (posedge clk or negedge rst)
		begin
			if(!rst)
				begin
					cstate<=IDLE;
					cmd<=3'b111;
				end
				
			else
				begin
					case(cstate)
						IDLE:
							begin
								if(wr_req)
									begin
										cstate<=WR_S1;
										cmd<=3'b011;
									end
								else if(rd_req)
									begin
										cstate<=RD_S1;
										cmd<=3'b011;
									end
									
								else
									begin
										cstate<=IDLE;
										cmd<=3'b111;
									end
							end
						
						WR_S1:
								begin
									cstate<=WR_S2;
									cmd<=3'b101;
								end
						
						WR_S2:
								begin
									cstate<=IDLE;
									cmd<=3'b111;
								end
						
						RD_S1:
							begin
								if(wr_req)
									begin
										cstate<=WR_S2;
										cmd<=3'b101;
									end
								else
									begin
										cstate<=RD_S2;
										cmd<=3'b110;
									end
							end
							
						RD_S2:
							begin
								if(wr_req)
									begin
										cstate<=WR_S1;
										cmd<=3'b011;
									end
								else
									begin
										cstate<=IDLE;
										cmd<=3'b111;
									end
							end
						
						default:
							cstate<=IDLE;
					endcase
				end
		end
endmodule
