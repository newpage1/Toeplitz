`timescale 1ns / 1ps
module module_ram(
	input clk_in,
	input rst,
	input q,
	input ram_rd_en,
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
	reg [4:0] state;
	parameter IDLE = 4'b0000;
	parameter GET1 = 4'b0001;
	parameter GET2 = 4'b0010;
	parameter GET3 = 4'b1000;
	parameter COM = 4'b0011;
	parameter COM1 = 4'b0100;
	parameter COM2 = 4'b1001;
	parameter FIN = 4'b0101;
	parameter WAIT = 4'b0110;
	
	initial
		begin
			read_addr_out = 12'b0;
			read_en_out = 0;
			counter = 13'b0;
			state = IDLE;
			//data_out = 0;
		end
	always@(posedge clk_in or posedge rst)
		begin
			if(rst)
				begin
					read_addr_out <= 12'b0;
					read_en_out <= 0;
					counter <= 13'b0;
					state <= IDLE;
					//data_out <= 0;
				end
			else
				begin
					case(state)
						IDLE:
							begin
								read_addr_out <= 12'b0;
								read_en_out <= 0;
								counter <= 13'b0;
								//data_out <= 0;
								if(ram_rd_en)
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
								counter <= counter + 13'b1;
							end
						GET2:	
							begin
								read_addr_out <= counter[11:0];
								counter <= counter + 13'b1;
								state <= GET3;
							end
						GET3:
							begin
								read_addr_out <= counter[11:0];
								counter <= counter + 13'b1;
								state <= COM;
							end
						COM:
							begin
								read_addr_out <= counter[11:0];
								counter <= counter + 13'b1;
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
								state <= COM2;
							end
						COM2:
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
								if(ram_rd_en)
									state <= GET1;
								else
									state <= WAIT;
							end
					endcase
				end
		end

endmodule