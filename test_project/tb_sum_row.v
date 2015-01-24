`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/01/21 15:50:35
// Design Name: 
// Module Name: tb_sum_row
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


module tb_sum_row;
	reg clk,rst,sum_en;
	reg [3071:0] shift_row;
	wire [31:0] coeff;
	wire [3071:0] final_result;
	wire [6:0] adress;
	wire read_en;
	wire write_en;
	sum_row sum(
		.clk_in(clk),
		.rst(rst),
		.shift_row(shift_row),
		.sum_en(sum_en),
		.coeff(coeff),
		.final_result(final_result),
		.adress(adress),
		.read_en(read_en),
		.write_en(write_en)
		);
	blk_mem blk_coeff(
	  .clka(clk),    // input wire clka
	  .ena(read_en),      // input wire ena
	  .addra(adress),  // input wire [6 : 0] addra
	  .douta(coeff)  // output wire [31 : 0] douta
	);

	initial
		begin
			clk = 0;
			rst = 0;
			shift_row = 3072'b1010101010;
			sum_en = 1;
		end
		
	always@(posedge clk or rst)
		begin
			shift_row <= shift_row<<1;
		end
		
	always #1 clk = ~clk;

endmodule
