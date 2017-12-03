//二段式状态机
//RD_S1依然神秘消失！！！
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
					begin
						if(wr_req)
							begin
								nstate<=WR_S1;
								cmd<=3'b011;
							end
						else if(rd_req)
							begin
								nstate<=RD_S1;
								cmd<=3'b011;
							end
									
						else
							begin
								nstate<=IDLE;
								cmd<=3'b111;
							end
					end
						
				WR_S1:
						begin
							nstate<=WR_S2;
							cmd<=3'b101;
						end
						
				WR_S2:
						begin
							nstate<=IDLE;
							cmd<=3'b111;
						end
						
				RD_S1:
					begin
						if(wr_req)
							begin
								nstate<=WR_S2;
								cmd<=3'b101;
							end
						else
							begin
								nstate<=RD_S2;
								cmd<=3'b110;
							end
					end
					
				RD_S2:
					begin
						if(wr_req)
							begin
								nstate<=WR_S1;
								cmd<=3'b011;
							end
						else
							begin
								nstate<=IDLE;
								cmd<=3'b111;
							end
					end
				default:
					nstate<=IDLE;
			endcase
		end
endmodule
