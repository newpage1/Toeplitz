`timescale 1ns / 1ps
module create_result(
	input clk_in,
	input rst,
	input coeff,
	output fifo_read,
	output fifo_write,
	output [3071:0] result
	);
	wire sum_en;
	wire [3071:0] row;
	create_row createrow(
	.clk_in(clk_in),
	.rst(rst),
	.sum_en(sum_en),
	.row(row)
	);
	sum_row sumrow(
	.clk_in(clk_in),
	.rst(rst),
	.sum_en(sum_en),
	.row(row),
	.coeff(coeff),
	.fifo_read(fifo_read),
	.fifo_write(fifo_write),
	.result(result)
	);
	
endmodule