`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/01/23 21:28:15
// Design Name: 
// Module Name: write_fifo
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


module write_fifo(
	input write_en,
	input rd_en,
	input rst,
	input [3071:0] final_result,
	input clk_in,
	output fifo_full,
	output fifo_empty,
	output [31:0] read_data
    );
	reg [3071:0] result_cache;
	reg [31:0] write_data;
	reg wr_en;
	reg [6:0] counter;
	wire flag;
	assign flag = counter[6]&counter[5];
	fifo_generator result_fifo (
    .clk(clk_in),      // input wire clk
    .rst(rst),      // input wire rst
    .din(write_data),      // input wire [31 : 0] din
    .wr_en(wr_en),  // input wire wr_en
    .rd_en(rd_en),  // input wire rd_en
    .dout(read_data),    // output wire [31 : 0] dout
    .full(fifo_full),    // output wire full
    .empty(fifo_empty)  // output wire empty
	);
	reg [2:0] state;
	parameter IDLE = 3'b000;
	parameter GET = 3'b001;
	parameter WRITE = 3'b010;
	parameter SHIFT = 3'b011;
	parameter WAIT = 3'b100;
	
	initial
		begin
			result_cache = 3072'b0;
			write_data = 32'b0;
			wr_en = 0;
			counter = 7'b0;
			state = IDLE;
		end
	
	always@(posedge clk_in or posedge rst)
		begin
			if(rst)
				begin
					result_cache <= 3072'b0;
					write_data <= 32'b0;
					wr_en <= 0;
					counter <= 7'b0;
					state <= IDLE;
				end
			else
				begin
					case(state)
						IDLE:
							begin
								result_cache <= 3072'b0;
								write_data <= 32'b0;
								wr_en <= 0;
								counter <= 7'b0;
								if(write_en)
									state <= GET;
								else
									state <= IDLE;
							end
						GET:
							begin
								result_cache <= final_result;
								state <= WRITE;
							end
						WRITE:
							begin
								wr_en <= 1;
								write_data <= result_cache[31:0];
								state <= SHIFT;
								counter <= counter + 1;
							end
						SHIFT:
							begin
								result_cache <= result_cache >>32;
								wr_en <= 0;
								if(flag)
									state <= WAIT;
								else
									state <= WRITE;
							end
						WAIT:
							begin
								if(write_en)
									state <= GET;
								else
									state <= WAIT;
							end
					endcase
				end
		end
endmodule
