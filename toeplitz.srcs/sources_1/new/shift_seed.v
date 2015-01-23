`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/01/19 16:33:52
// Design Name: 
// Module Name: shift_seed
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


module shift_seed(
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
	reg [12:0] counter;
	wire flag;
	assign flag = counter[12];
	reg [1:0] cur_state;
	reg [1:0] next_state;
	parameter IDLE = 2'b00;
	parameter GET = 2'b01;
	parameter WORK = 2'b10;
	
	initial
		begin
			seed_ack_out = 0; //modified
			sum_en_out = 0;
			seed_cache = 7168'b0;
			result = 3072'b0;
			counter = 13'b0000000000000;
			cur_state = IDLE;
			next_state = IDLE;
		end 
		
	always@(posedge clk_in or rst)
		begin
			if(rst)
				cur_state <= IDLE;
			else
				cur_state <= next_state;
		end
	
	always@(shift_en or counter or flag or cur_state)
		begin
			next_state = cur_state;
			case(cur_state)
			IDLE:
				begin
					if(shift_en&!(|counter))
						next_state = GET;
					if(!shift_en&!(|counter))
						next_state = IDLE;
				end
			GET:
				begin
					next_state = WORK;
				end
			WORK:
				begin
					if(!flag)
						next_state = WORK;
					else
						next_state = IDLE;
				end
			endcase
		end
		
	always@(posedge clk_in or rst)
		begin
			if(rst)
				begin
					seed_ack_out <= 0;
					sum_en_out <= 0;
					seed_cache <= 7168'b0;
					result <= 3072'b0;
					counter <= 13'b0000000000000;
				end
			else
				begin
					case(cur_state)
					IDLE:
						begin
							if(next_state == IDLE)
								begin
									sum_en_out <= 0; 
									seed_ack_out <= 0;	//modified
									seed_cache <= 7168'b0;
									result <= 3072'b0;
									counter <= 13'b0000000000000;
								end
							if(next_state == GET)
								begin
									seed_cache <= seed;
									seed_ack_out <= 1;
								end
						end
					GET:
						begin
							counter <= counter + 1;
							seed_ack_out <= 0;
							result <= cache;
							seed_cache <= seed_cache<<1;
							sum_en_out <= 1;
						end
					WORK:
						begin
							if(next_state == WORK)
								begin
									counter <= counter + 1;
									result <= cache;
									seed_cache <= seed_cache<<1;
									sum_en_out <= 1;
								end
							else
								begin
									sum_en_out <= 0;
									counter <= 13'b0000000000000;
								end
						end
					endcase
				end
		end
endmodule
