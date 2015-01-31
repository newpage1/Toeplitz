module create_seed(
	input clk_in,
	input rst,
	input shift_ack,
	output [3071:0] seed,
	output shift_en
);

	wire [31:0] ram_data;
	wire [6:0] ram_addr;
	wire ram_read;
	reg ena;
	reg [6:0] addra;
	reg [31:0] dina;

	ram_read read(
	.clk_in(clk_in),
	.rst(rst),
	.shift_ack(shift_ack),
	.ram_data(ram_data),
	.ram_addr(ram_addr),
	.ram_read(ram_read),
	.seed(seed),
	.shift_en(shift_en)
    );
	
	seed_ram s_ram(
	.clock(clk_in),
	.data(dina),
	.rdaddress(ram_addr),
	.rden(ram_read),
	.wraddress(addra),
	.wren(ena),
	.q(ram_data)
	);

	initial
		begin
			ena = 0;
			addra = 7'b0;
			dina = 32'b0;
		end 
endmodule