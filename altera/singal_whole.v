`timescale 1ns / 1ps
module singal_whole(
	input clk_in,
	input rst,
	input input_read,
	output [31:0] out_data,
	output fifo_en,
	output fifo_empty
	);
	wire [3071:0] result;
	wire fifo_write;
	fifo_result fiforesult(
	.clk_in(clk_in),
	.rst(rst),
	.result(result),
	.fifo_write(fifo_write)
	);
	write_fifo writefifo(
	.clk_in(clk_in),
	.rst(rst),
	.result(result),
	.input_read(input_read),
	.fifo_write(fifo_write),
	.out_data(out_data),
	.fifo_en(fifo_en),
	.fifo_empty(fifo_empty)
	);
	
endmodule