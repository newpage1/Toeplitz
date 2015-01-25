`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/01/23 17:17:06
// Design Name: 
// Module Name: shift_seed_single
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module shift_seed_single(
	input clk_in,
	input rst,
	input [7167:0] seed,
	input shift_en,
	output seed_ack,
	output sum_en,
	output [3071:0] shift_row
    );
	
	reg seed_ack_out;
	assign seed_ack = seed_ack_out;
	reg sum_en_out;
	assign sum_en = sum_en_out;
	reg [7167:0] seed_cache;
	wire [3071:0] cache;
	assign cache = seed_cache[7167:4095];
	reg [3071:0] result;
	assign shift_row = result;
	reg [7:0] cycle_counter;
	wire cycle_flag;
	assign cycle_flag = cycle_counter[7];
	reg [5:0] counter;
	wire flag;
	assign flag = counter[5];
	reg [2:0] state;
	parameter IDLE = 3'b000;
	parameter GET = 3'b001;
	parameter ONE = 3'b010;
	parameter TWO = 3'b011;
	parameter COM = 3'b100;
	
	initial 
		begin
			seed_ack_out = 0;
			sum_en_out = 0;
			seed_cache = 7168'b0;
			result = 3072'b0;
			cycle_counter = 8'b0;
			counter = 6'b0;
			state = IDLE;
		end
	
	always@(posedge clk_in or posedge rst)
		begin
			if(rst)
				begin
					seed_ack_out <= 0;
					sum_en_out <= 0;
					seed_cache <= 7168'b0;
					result <= 3072'b0;
					cycle_counter <= 8'b0;
					counter <= 6'b0;
					state <= IDLE;
				end
			else
				begin
					case(state)
						IDLE:
							begin
								sum_en_out <= 0;
								result <= 3072'b0;
								cycle_counter <= 8'b0;
								counter <= 6'b0;
								if(shift_en)
									begin
										state <= GET;
										seed_ack_out <= 1;
										seed_cache <= seed;
									end
								else
									begin
										state <= IDLE;
										seed_ack_out <= 0;
										seed_cache <= 7168'b0;
									end
							end
						GET:						
							begin
								seed_ack_out <= 0;
								sum_en_out <= 1;
								state <= ONE;
							end
						ONE:
							begin
								cycle_counter <= cycle_counter + 1;
								if(!cycle_flag)
									begin
										state <= TWO;
									end
								else
									begin
										state <= IDLE;
									end
							end
						TWO:
							begin
								state <= COM;
							end
						COM:
							begin
								if(!cycle_flag&!flag)
									begin
										state <= COM;
										counter <= counter + 1;
										result <= cache;
										seed_cache <= seed_cache << 1;
									end
								if(!cycle_flag&flag)
									begin
										state <= ONE;
										counter <= 6'b0;
									end
							end
						default:
							begin
								state <= IDLE;
							end
					endcase
				end
		end
	
	
endmodule
