`timescale 1ns / 1ps
module module_ram(
	input clk_in,
	input rst,
	input q,
	input rd_en,
	output [11:0] read_addr,
	output data,
	output read_en
	);
	
	reg [11:0] read_addr_out;
	assign read_addr = read_addr_out;
	reg read_en_out;
	assign read_en = read_en_out;
	reg [12:0] counter;
	reg data_out;
	assign data = data_out;
	wire flag;
	assign flag = counter[12];
	reg [2:0] state;
	parameter IDLE = 3'b000;
	parameter GET1 = 3'b001;
	parameter GET2 = 3'b010;
	parameter COM = 3'b011;
	parameter COM1 = 3'b100;
	parameter FIN = 3'b101;
	parameter WAIT = 3'b110;
	
	initial
		begin
			read_addr_out = 12'b0;
			read_en_out = 0;
			counter = 13'b0;
			state = IDLE;
			data_out = 0;
		end
	always@(posedge clk_in or posedge rst)
		begin
			if(rst)
				begin
					read_addr_out <= 12'b0;
					read_en_out <= 0;
					counter <= 13'b0;
					state <= IDLE;
					data_out <= 0;
				end
			else
				begin
					case(state)
						IDLE:
							begin
								read_addr_out <= 12'b0;
								read_en_out <= 0;
								counter <= 13'b0;
								data_out <= 0;
								if(rd_en)
									begin
										state <= GET1;
									end
								else
									state <= IDLE;
							end
						GET1:
							begin
								read_en_out <= 1;
								read_addr_out <= counter[11:0];
								state <= GET2;
								counter <= counter + 1;
							end
						GET2:	
							begin
								read_addr_out <= counter[11:0];
								counter <= counter + 1;
								state <= COM;
							end
						COM:
							begin
								read_addr_out <= counter[11:0];
								counter <= counter + 1;
								if(q)
									data_out <= 1;
								else
									data_out <= 0;
								if(flag)
									state <= COM1;
								else	
									state <= COM;
							end
						COM1:
							begin
								read_en_out <= 0;
								if(q)
									data_out <= 1;
								else
									data_out <= 0;
								state <= FIN;
							end
						FIN:
							begin
								if(q)
									data_out <= 1;
								else
									data_out <= 0;
								counter <= 13'b0;
								state <= WAIT;
							end
						WAIT:
							begin
								if(rd_en)
									state <= GET1;
								else
									state <= WAIT;
							end
					endcase
				end
		end

endmodule
	
	