`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/01/24 16:38:49
// Design Name: 
// Module Name: tb_write_fifo
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


module tb_write_fifo;
	reg clk_in,rst,write_en,rd_en;
	reg [3071:0] result;
	wire full,empty;
	wire [31:0] read_data;
	write_fifo des_fifo(
	.write_en(write_en),
	.rd_en(rd_en),
	.rst(rst),
	.final_result(result),
	.clk_in(clk_in),
	.fifo_full(full),
	.fifo_empty(empty),
	.read_data(read_data)
	);
	
	initial
		begin
			clk_in = 0;
			rst = 0;
			write_en = 1;
			rd_en = 0;
			result = 3072'b101010101010101010101010101010;
		end
	
	always #1 clk_in = ~clk_in;
	
endmodule
