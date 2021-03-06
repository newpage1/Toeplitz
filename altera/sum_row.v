`timescale 1ns / 1ps
module sum_row(
	input clk_in,
	input rst,
	input sum_en,
	input [3071:0] row,
	input coeff,
	output fifo_read,
	output fifo_write,
	output [3071:0] result
	);
	reg fifo_read_out;
	assign fifo_read = fifo_read_out;
	reg fifo_write_out;
	assign fifo_write = fifo_write_out;
	reg [3071:0] result_out;
	assign result = result_out;
	reg [12:0] counter;
	wire flag;
	assign flag = counter[12];
	reg [2:0] state;
	parameter IDLE = 3'b000;
	parameter PRE = 3'b001;
	parameter EM = 3'b010;
	parameter XOR = 3'b011;
	parameter OUT = 3'b100;
	parameter WAIT = 3'b101;
	
	initial
		begin
			fifo_read_out = 0;
			fifo_write_out = 0;
			result_out = 3072'b0;
			counter = 13'b0;
			state = IDLE;
		end
	
	always@(posedge clk_in or posedge rst)
		begin
			if(rst)
				begin
					fifo_read_out <= 0;
					fifo_write_out <= 0;
					result_out <= 3072'b0;
					counter <= 13'b0;
					state <= IDLE;
				end
			else
				begin
					case(state)
						IDLE:
							begin
								fifo_read_out <= 0;
								fifo_write_out <= 0;
								result_out <= 3072'b0;
								counter <= 13'b0;
								if(sum_en)
									state <= PRE;
								else
									state <= IDLE;
							end
						PRE:
							begin
								fifo_read_out <= 1;
								state <= EM;
							end
						EM:
							begin
								state <= XOR;
								counter <= counter + 13'b1;
							end
						XOR:
							begin
								if(coeff)
									result_out <= result_out^row;
								counter <= counter + 13'b1;
								if(flag)
									begin
										state <= OUT;
										fifo_read_out <= 0;
									end
								else
									state <= XOR;
							end
						OUT:
							begin
								fifo_write_out <= 1;
								state <= WAIT;
							end
						WAIT:
							begin
								fifo_write_out <= 0;
								if(sum_en)
									begin
										state <= PRE;
										counter <= 13'b0;
									end
								else
									state <= WAIT;
							end
					endcase
				end
		end
endmodule