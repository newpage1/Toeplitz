`timescale 1ns / 1ps
module create_bit(
	input clk_in,
	input rst,
	input rd_en,
	output bit_data
	);
	wire doutb;
	reg wren;
	reg [7:0] wraddress;
	reg [15:0] data;
	wire [11:0] read_addr;
	wire read_en;
	module_ram standard(
	.clk_in(clk_in),
	.rst(rst),
	.q(doutb),
	.ram_rd_en(rd_en),
	.read_addr(read_addr),
	.data(bit_data),
	.read_en(read_en)
	);
	
	bit_ram ram(
	.clock(clk_in),
	.data(data),
	.rdaddress(read_addr),
	.rden(read_en),
	.wraddress(wraddress),
	.wren(wren),
	.q(doutb)
	);

	initial
		begin
			wren = 0;
			wraddress = 8'b0;
			data = 16'b0;
		end
	
endmodule