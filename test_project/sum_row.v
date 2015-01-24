`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/01/20 10:05:00
// Design Name: 
// Module Name: sum_row
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


module sum_row(
	input clk_in,
	input rst,
	input [3071:0] shift_row,
	input sum_en,
	input [31:0] coeff,
	output [3071:0] final_result,
	output read_en,
	output write_en
    );
	
	reg [31:0] coeff_in;
	reg [3071:0] result_out;
	assign final_result = result_out;
	reg write_en_out;
	assign write_en = write_en_out; 
	reg read_en_out;
	assign read_en = read_en_out;
	reg [7:0] counter;
	wire flag;
	assign flag = counter[7];
	reg [5:0] read_counter;
	wire read_flag;
	assign read_flag = read_counter[5];
	reg [2:0] state;
	parameter IDLE = 3'b000;
	parameter PRE = 3'b001;
	parameter PLUS = 3'b010;
	parameter GET = 3'b011;
	parameter COM = 3'b100;
	parameter OUT = 3'b101;
	
	initial
		begin
			coeff_in = 32'b0;
			state = IDLE;
			result_out = 3072'b0;
			write_en_out = 0;
			read_en_out = 0;
			counter = 8'b0;
			read_counter = 6'b000000;
		end
	
	always@(posedge clk_in or posedge rst )
		begin
			if(rst)
				begin
					coeff_in <= 32'b0;
					state <= IDLE;
					result_out <= 3072'b0;
					write_en_out <= 0;
					read_en_out <= 0;
					counter <= 8'b0;
					read_counter <= 6'b000000;
				end
			else
				begin
					case(state)
					IDLE:
						begin
							coeff_in <= 32'b0; 
							state <= PRE;
							write_en_out <= 0;
							read_en_out <= 0;
							counter <= 8'b0;
							addr_out <= 7'b0000000;
							read_counter <= 6'b000000;
							result_out <= 3072'b0;
							$display("dsdssssssssssssssssssssssssssssssssssssssss");
						end
					PRE:
						begin
							if(!flag&sum_en)
								begin
									state <= PLUS;
									read_en_out <= 1;
									$display("dsdssssssssssssssssssssssssssssssssssssssss");
								end
							if(flag&sum_en)
								begin
									state <= OUT;
									write_en_out <= 1;
								end
						end
					PLUS:
						begin
							state <= GET;
							counter <= counter + 1;
							read_en_out <= 0;
						end
					GET:
						begin
							state <= COM;
							coeff_in <= coeff;
							read_counter <= read_counter + 1;
						end
					COM:
						begin
							if(!read_flag&sum_en)
								begin
									read_counter <= read_counter + 1;
									if(coeff_in[31])
										result_out <= result_out^shift_row;
									coeff_in <= coeff_in << 1;
								end
							if(read_flag&sum_en)
								begin
									state <= PRE;
									read_counter <= 6'b000000;
								end
						end
					OUT:
						begin
							state <= IDLE;
						end
					default:
						begin
							state <= IDLE;
						end
					endcase
				end
		end
endmodule
