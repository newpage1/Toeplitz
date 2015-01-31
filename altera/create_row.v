`timescale 1ns / 1ps
module create_row(
	input clk_in,
	input rst,
	output sum_en,
	output [3071:0] row
	);
	wire rd_en;
	wire bit_data;
	wire shift_ack;
	wire [3071:0] seed;
	wire shift_en;
	create_bit createbit(
	.clk_in(clk_in),
	.rst(rst),
	.rd_en(rd_en),
	.bit_data(bit_data)
	);
	create_seed createseed(
	.clk_in(clk_in),
	.rst(rst),
	.shift_ack(shift_ack),
	.seed(seed),
	.shift_en(shift_en)
	);
	shift_seed shift(
	.clk_in(clk_in),
	.rst(rst),
	.shift_en(shift_en),
	.seed(seed),
	.shift_bit(bit_data),
	.rd_en(rd_en),
	.shift_ack(shift_ack),
	.sum_en(sum_en),
	.shift_result(row)
	);
	
endmodule
