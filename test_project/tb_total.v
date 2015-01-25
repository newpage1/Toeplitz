`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/01/25 11:05:35
// Design Name: 
// Module Name: tb_total
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


module tb_total;
	reg clk_in,rst;
	wire fifo_empty;
	wire fifo_full;
	wire [31:0] read_data;
	total_module total(
	.clk_in(clk_in),
	.rst(rst),
	.fifo_full(fifo_full),
	.fifo_empty(fifo_empty),
	.read_data(read_data)
    );
	initial
		begin
			clk_in = 0;
			rst = 0;
		end 
	
	always #1 clk_in = ~clk_in;
endmodule
