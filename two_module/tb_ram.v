`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/01/28 14:22:09
// Design Name: 
// Module Name: tb_ram
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


module tb_ram;
	reg clk_in,rst,ena,wea;
	reg [6:0] addra;
	reg [31:0] dina;
	wire doutb;
	wire [11:0] read_addr;
	wire data;
	wire read_en;
	wire rd_en;
	reg shift_en;
	reg [3071:0] seed;
	wire shift_ack;
	wire sum_en;
	wire [3071:0] shift_result;
	module_ram standard(
	.clk_in(clk_in),
	.rst(rst),
	.q(doutb),
	.rd_en(rd_en),
	.read_addr(read_addr),
	.data(data),
	.read_en(read_en)
	);
	dual_port_ram read_ram (
	.clka(clk_in),    // input wire clka
	.ena(ena),      // input wire ena
	.wea(wea),      // input wire [0 : 0] wea
	.addra(addra),  // input wire [6 : 0] addra
	.dina(dina),    // input wire [31 : 0] dina
	.clkb(clk_in),    // input wire clkb
	.enb(read_en),      // input wire enb
	.addrb(read_addr),  // input wire [11 : 0] addrb
	.doutb(doutb)  // output wire [0 : 0] doutb
	);
	shift_seed seed_row(
	.clk_in(clk_in),
	.rst(rst),
	.shift_en(shift_en),
	.seed(seed),
	.shift_bit(data),
	.rd_en(rd_en),
	.shift_ack(shift_ack),
	.sum_en(sum_en),
	.shift_result(shift_result)
	);
	
	initial
		begin
			clk_in = 0;
			rst = 0;
			ena = 0;
			wea = 0;
			addra = 7'b0;
			dina = 32'b0;
			shift_en = 0;
			seed = 3072'b101;
			#22 shift_en = 1;
		end
	
	always #2 clk_in = ~clk_in;
endmodule
