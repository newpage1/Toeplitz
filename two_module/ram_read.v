`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/01/25 19:11:13
// Design Name: 
// Module Name: ram_read
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


module ram_read(
	input clk_in,
	input rst,
	input shift_ack,
	input [31:0] ram_data,
	output [6:0] ram_addr,
	output ram_read,
	output [3071:0] seed,
	output shift_en
    );
	
	reg [6:0] counter;
	reg [6:0] ram_addr_out;
	assign ram_addr = ram_addr_out;
	reg ram_read_out;
	assign ram_read = ram_read_out;
	reg shift_en_out;
	assign shift_en = shift_en_out;
	reg [3071:0] seed_out;
	assign seed = seed_out;
	reg [2:0] state;
	wire flag;
	assign flag = counter[6]&counter[5];
	parameter IDLE = 3'b000;
	parameter PRE = 3'b001;
	parameter PLUS = 3'b010;
	parameter GET = 3'b011;
	parameter WAIT = 3'b100;
	
	initial
		begin	
			counter = 7'b0;
			ram_read_out = 0;
			shift_en_out = 0;
			seed_out = 3072'b0;
			ram_addr_out = 7'b0;
			state = IDLE;
		end 
	
	always@(posedge clk_in or posedge rst)
		begin
			if(rst)
				begin
					counter <= 7'b0;
					ram_read_out <= 0;
					shift_en_out <= 0;
					seed_out <= 3072'b0;
					ram_addr_out <= 7'b0;
					state <= IDLE;
				end
			else
				begin
					case(state)
						IDLE:
							begin
								counter <= 7'b0;
								ram_read_out <= 0;
								seed_out <= 3072'b0;
								shift_en_out <= 0;
								state <= PRE;
							end
						PRE:
							begin
								ram_addr_out <= counter;
								ram_read_out <= 1;
								state <= PLUS;
							end
						PLUS:
							begin
								counter <= counter + 1;
								state <= GET;
							end
						GET:
							begin
								seed_out <= (seed_out<<32) + ram_data;
								if(flag)
									begin
										state <= WAIT;
									end
								else
									begin
										state <= PRE;
									end
							end
						WAIT:
							begin
								shift_en_out <= 1;
								ram_read_out <= 0;
								if(shift_ack)
									state <= PRE;
								else 
									state <= WAIT;
							end
					endcase
				end
		end
	
endmodule
