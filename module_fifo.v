`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/01/22 21:27:29
// Design Name: 
// Module Name: module_fifo
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


module module_fifo(
	input clk_in,
	input rst,
	input rd_en,
	output [31:0] fifo_out,
	output fifo_empty
	//output fifo_full
	);
	reg wr_en;
	reg rom_en;
	reg [6:0] addra;
	reg [7:0] counter;
	wire [31:0] data;
	wire fifo_full;
	reg [2:0] state;
	parameter IDLE = 3'b000;
	parameter ADR = 3'b001;
	parameter PLUS = 3'b010;
	parameter END = 3'b011;
	parameter WEN = 3'b100;
	parameter WAIT = 3'b101;
	blk_mem rom_source (
	  .clka(clk_in),    // input wire clka
	  .ena(rom_en),      // input wire ena
	  .addra(addra),  // input wire [6 : 0] addra
	  .douta(data)  // output wire [31 : 0] douta
	);
	fifo_generator fifo_receive (
	  .clk(clk_in),      // input wire clk
	  .rst(rst),      // input wire rst
	  .din(data),      // input wire [31 : 0] din
	  .wr_en(wr_en),  // input wire wr_en
	  .rd_en(rd_en),  // input wire rd_en
	  .dout(fifo_out),    // output wire [31 : 0] dout
	  .full(fifo_full),    // output wire full
	  .empty(fifo_empty)  // output wire empty
	);

	initial 
		begin
			wr_en = 0;
			rom_en = 0;
			counter = 8'b0;
			addra = 7'b0;
			state = IDLE;
		end

	always@(posedge clk_in or posedge rst)
		if(rst)
			begin
				wr_en <= 0;
				rom_en <= 0;
				counter <= 8'b0;
				addra <= 7'b0;
				state <= IDLE;
			end
		else
			begin
				case(state)
				IDLE:
					begin
						rom_en <= 1;
						wr_en <= 0;
						counter <= 8'b0;
						addra <= 7'b0;
						state <= ADR;
					end
				ADR:
					begin
						addra <= counter[6:0];
						state <= PLUS;
					end
				PLUS:
					begin
						counter <= counter + 1;
						if (counter[7])
							state <= END;
						else
							state <= WEN;
					end
				END:
					begin
						counter <= 8'b0;
					end
				WEN:
					begin
						wr_en <= 1;
						if(fifo_full)
							state <= WAIT;
						else
							state <= ADR;
					end
				WAIT:
					begin
						if(fifo_full)
							state <= WAIT;
						else
							state <= ADR;
					end
				endcase
			end

endmodule
