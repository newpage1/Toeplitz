`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/01/23 20:49:17
// Design Name: 
// Module Name: tb_shift
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


module tb_shift;
	reg clk,rst;
	wire [31:0] rom_data;
	wire shift_ack;
	wire [7167:0] seed;
	wire rom_en;
	wire shift_en;
	wire [7:0] rom_addr;
	wire sum_en;
	wire [3071:0] shift_row;
	
	read_rom read(
		.clk_in(clk),	//input clk
		.read_data(rom_data),	//read data from rom
		.rst(rst), //reset
		.shift_ack(shift_ack), //shift module ack
		.seed(seed),	//7K seed 
		.rom_en(rom_en),	//rom enable
		.shift_en(shift_en),	//shift enable
		.rom_addr(rom_addr)	//rom address
		);
	blk_memory ROM (
		.clka(clk),    // input wire clka
		.ena(rom_en),      // input wire ena
		.addra(rom_addr),  // input wire [7 : 0] addra
		.douta(rom_data)  // output wire [31 : 0] douta
	);
	shift_seed_single shift(
		.clk_in(clk),
		.rst(rst),
		.seed(seed),
		.shift_en(shift_en),
		.seed_ack(shift_ack),
		.sum_en(sum_en),
		.shift_row(shift_row)
	);
	
	
	initial
		begin
			clk = 0;
			rst = 0;
		end
		
	always #1 clk = ~clk;

endmodule
