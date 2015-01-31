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
	input shift_en,
	input [3071:0] seed,
	input shift_bit,
	output rd_en,
	output shift_ack,
	output sum_en,
	output [3071:0] shift_result
	);
	reg shift_ack_out;
	assign shift_ack = shift_ack_out;
	reg sum_en_out;
	assign sum_en = sum_en_out;
	reg [3071:0] shift_result_out;
	assign shift_result = shift_result_out;
	reg rd_en_out;
	assign rd_en = rd_en_out;
	reg [12:0] counter;
	wire flag;
	assign flag = counter[12];
	reg [3071:0] seed_cache;
	reg [3:0] state;
	parameter IDLE = 4'b0000;
	parameter GET = 4'b0001;
	parameter COM = 4'b0010;
	parameter WAIT = 4'b0011;
	parameter EM1 = 4'b0100;
	parameter EM2 = 4'b0101;
	parameter EM3 = 4'b0110;
	parameter EM4 = 4'b0111;
	parameter EM = 4'b1000;
	initial
		begin
			shift_ack_out = 0;
			sum_en_out = 0;
			shift_result_out = 3072'b0;
			counter = 13'b0;
			seed_cache = 3072'b0;
			state = IDLE;
			rd_en_out = 0;
		end
	always@(posedge clk_in or posedge rst)
		begin
			if(rst)
				begin
					shift_ack_out <= 0;
					sum_en_out <= 0;
					shift_result_out <= 3072'b0;
					counter <= 13'b0;
					seed_cache <= 3072'b0;
					state <= IDLE;
					rd_en_out = 0;
				end
			else
				begin
					case(state)
						IDLE:
							begin
								shift_ack_out <= 0;
								sum_en_out <= 0;
								shift_result_out <= 3072'b0;
								counter <= 13'b0;
								seed_cache <= 3072'b0;
								rd_en_out = 0;
								if(shift_en)
									state <= GET;
								else
									state <= IDLE;
							end
						GET:
							begin
								rd_en_out <= 1;
								seed_cache <= seed;
								shift_ack_out <= 1;
								state <= EM1;
							end
						EM1:
							begin
								state <= EM2;
								shift_ack_out <= 0;
							end
						EM2:
							begin
								state <= EM3;
							end
						EM3:
							begin
								state <= EM4;
								sum_en_out <= 1;
							end
						EM4:
							begin
								state <= EM;
								counter <= counter + 13'b1;
							end
						EM:
							begin
								state <= COM; 
							end
						COM:
							begin
								shift_result_out <= seed_cache;
								seed_cache <= (seed_cache<<1) + shift_bit;
								counter <= counter + 13'b1;
								if(flag)
									state <= WAIT;
								else
									state <= COM;
							end
						WAIT:
							begin
								sum_en_out <= 0;
								if(shift_en)
									begin
										state <= GET;
										counter <= 13'b0;
									end
								else
									state <= WAIT;
							end
					endcase
				end
		end
endmodule