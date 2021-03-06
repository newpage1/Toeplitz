`timescale 1ns / 1ps
module module_fifo(
	input clk_in,
	input rst,
	input fifo_read,
	output [2:0] ecoffs
	);
	
	wire [11:0] rom_data;
	reg wr_en;
	wire fifo_empty;
	wire fifo_full;
	reg [8:0] rom_addr;
	reg [9:0] counter;
	wire flag;
	assign flag = counter[9];
	reg [2:0] state;
	parameter IDLE = 3'b000;
	parameter ADR = 3'b001;
	parameter PLUS = 3'b010;
	parameter WRI = 3'b011;
	parameter WAIT = 3'b100;
	parameter EM = 3'b101;
	parameter END = 3'b110;
	input_fifo inputfifo(
	.data(rom_data),
	.rdclk(clk_in),
	.rdreq(fifo_read),
	.wrclk(clk_in),
	.wrreq(wr_en),
	.q(ecoffs),
	.rdempty(fifo_empty),
	.wrfull(fifo_full)
	);
	
	init_fifo initrom(
	.address(rom_addr),
	.clock(clk_in),
	.q(rom_data)
	);
	
	initial
		begin
			wr_en = 0;
			rom_addr = 9'b0;
			counter = 10'b0;
			state = IDLE;
		end
	
	always@(posedge clk_in or posedge rst)
		begin
			if(rst)
				begin
					wr_en <= 0;
					rom_addr <= 9'b0;
					counter <= 10'b0;
					state <= IDLE;
				end
			else
				begin
					case(state)
						IDLE:
							begin
								wr_en <= 0;
								rom_addr <= 9'b0;
								counter <= 10'b0;
								state <= ADR;
							end
						ADR:
							begin
								rom_addr <= counter[8:0];
								state <= PLUS;
							end
						PLUS:
							begin
								counter <= counter + 10'b1;
								if(flag)
									state <= END;
								else
									state <= EM;
							end
						END:
							begin
								counter <= 10'b0;
							end
						EM:
							begin
								state <= WRI;
							end 
						WRI:
							begin
								wr_en <= 1;
								state <= WAIT;
							end
						WAIT:
							begin
								wr_en <= 0;
								if(fifo_full)
									state <= WAIT;
								else
									state <= ADR;
							end
					endcase
				end
		end
endmodule
