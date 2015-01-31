`timescale 1ns / 1ps
module write_fifo(
	input clk_in,
	input rst,
	input [3071:0] result,
	input input_read,
	input fifo_write,
	output [31:0] out_data,
	output fifo_en,
	output fifo_empty
	);
	reg [3071:0] result_cache;
	reg [31:0] read_data; 
	reg write_en;
	wire fifo_full;
	small_fifo smallfifo(
	.clock(clk_in),
	.data(read_data),
	.rdreq(input_read),
	.wrreq(write_en),
	.empty(fifo_empty),
	.full(fifo_full),
	.q(out_data)
	);
	reg fifo_en_out;
	assign fifo_en = fifo_en_out;
	reg [6:0] counter;
	wire flag;
	assign flag = counter[6]&counter[5];
	reg [2:0] state;
	parameter IDLE = 3'b000;
	parameter GET = 3'b001;
	parameter WRI = 3'b010;
	parameter WAIT = 3'b011;
	
	initial
		begin
			read_data = 32'b0;
			result_cache = 3072'b0;
			write_en = 0;
			fifo_en_out = 0;
			counter = 7'b0;
			state = IDLE;
		end
	
	always@(posedge clk_in or posedge rst)
		begin
			if(rst)
				begin
					read_data <= 32'b0;
					result_cache <= 3072'b0;
					write_en <= 0;
					fifo_en_out <= 0;
					counter <= 7'b0;
					state <= IDLE;
				end
			else
				begin
					case(state)
						IDLE:
							begin
								read_data <= 32'b0;
								result_cache <= 3072'b0;
								write_en <= 0;
								fifo_en_out <= 0;
								counter <= 7'b0;
								if(fifo_write)
									state <= GET;
								else
									state <= IDLE;
							end
						GET:
							begin
								result_cache <= result;
								counter <= counter + 7'b1;
								state <= WRI;
							end
						WRI:
							begin
								read_data <= result_cache[31:0];
								result_cache <= (result_cache>>32);
								write_en <= 1;
								counter <= counter + 7'b1;
								if(flag)
									state <= WAIT;
								else
									state <= WRI;
							end
						WAIT:
							begin
								counter <= 7'b0;
								write_en <= 0;
								if(fifo_write)
									state <= GET;
								else
									state <= WAIT;
							end
					endcase
				end
		end
		
endmodule

	