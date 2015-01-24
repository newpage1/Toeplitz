`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/01/23 10:43:51
// Design Name: 
// Module Name: tb_module
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


module tb_module;
	reg clk,rst,rd_en;
	wire [31:0] dout;
	wire empty;
	module_fifo read_fifo(
		.clk_in(clk),
		.rst(rst),
		.rd_en(rd_en),
		.fifo_out(dout),
		.fifo_empty(empty)
	);
	initial
		begin
			clk = 0;
			rst = 0;
			rd_en = 1;
		end 
	always #2.5 clk = ~clk;
endmodule
