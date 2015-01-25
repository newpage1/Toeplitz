`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/01/24 21:44:13
// Design Name: 
// Module Name: total_module
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


module total_module(
	input clk_in,
	input rst,
	output fifo_full,
	output fifo_empty,
	output [31:0] read_data
    );
	
	wire [31:0] rom_data;
	wire shift_ack;
	wire [7167:0] seed;
	wire rom_en;
	wire shift_en;
	wire [7:0] rom_addr;
	wire sum_en;
	wire [3071:0] shift_row;
	wire empty;
	wire read_en;
	wire [31:0] coeff;
	wire [3071:0] final_result;
	wire write_en;
	reg fifo_rd_en;
	blk_memory seed_rom (
	.clka(clk_in),    // input wire clka
	.ena(rom_en),      // input wire ena
	.addra(rom_addr),  // input wire [7 : 0] addra
	.douta(rom_data)  // output wire [31 : 0] douta
	);
	
	read_rom re_rom(
	.clk_in(clk_in),	//input clk
	.read_data(rom_data),	//read data from rom
	.rst(rst), //reset
	.shift_ack(shift_ack), //shift module ack
	.seed(seed),	//7K seed 
	.rom_en(rom_en),	//rom enable
	.shift_en(shift_en),	//shift enable
	.rom_addr(rom_addr)	//rom address
    );
	
	shift_seed_single single_shift(
	.clk_in(clk_in),
	.rst(rst),
	.seed(seed),
	.shift_en(shift_en),
	.seed_ack(shift_ack),
	.sum_en(sum_en),
	.shift_row(shift_row)
    );
	
	
	module_fifo coeff_fifo(
	.clk_in(clk_in),
	.rst(rst),
	.rd_en(read_en),
	.fifo_out(coeff),
	.fifo_empty(empty)
	);
	
	sum_row row_result(
	.clk_in(clk_in),
	.rst(rst),
	.shift_row(shift_row),
	.sum_en(sum_en),
	.coeff(coeff),
	.final_result(final_result),
	.read_en(read_en),
	.write_en(write_en)
    );
	
	write_fifo result_fifo(
	.write_en(write_en),
	.rd_en(fifo_rd_en),
	.rst(rst),
	.final_result(final_result),
	.clk_in(clk_in),
	.fifo_full(fifo_full),
	.fifo_empty(fifo_empty),
	.read_data(re)
    );
	
	initial
		begin
			fifo_rd_en = 0;
		end 
	
endmodule
