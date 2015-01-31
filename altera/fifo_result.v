`timescale 1ns / 1ps
module fifo_result(
	input clk_in,
	input rst,
	output [3071:0] result,
	output fifo_write
	);
	wire fifo_read;
	wire [2:0] ecoffs;
	//reg coeff;
	//assign coeff = ecoffs[0];
	module_fifo modulefifo(
	.clk_in(clk_in),
	.rst(rst),
	.fifo_read(fifo_read),
	.ecoffs(ecoffs)
	);
	create_result createresult(
	.clk_in(clk_in),
	.rst(rst),
	.coeff(ecoffs[0]),
	.fifo_read(fifo_read),
	.fifo_write(fifo_write),
	.result(result)
	);
	
endmodule