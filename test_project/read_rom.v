`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/01/19 15:53:18
// Design Name: 
// Module Name: read_rom
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


module read_rom(
	input clk_in,	//input clk
	input [31:0] read_data,	//read data from rom
	input rst, //reset
	input shift_ack, //shift module ack
	output [7167:0] seed,	//7K seed 
	output rom_en,	//rom enable
	output shift_en,	//shift enable
	output [7:0] rom_addr	//rom address
    );
	reg rom_en_out;
	assign rom_en = rom_en_out;
	reg shift_en_out;
	assign shift_en = shift_en_out;
	reg [7167:0] seed_out;
	assign seed = seed_out;
	reg [7:0] addr_out;
	assign rom_addr = addr_out;
	reg [7:0] count;	//the address counter
	reg [2:0] current_state;
	reg [2:0] next_state;
	wire flage_full;
	assign flage_full = count[7]&count[6]&count[5];	//the flage
	parameter final_compute = 3'b011;
	parameter wait_stay = 3'b100;
	parameter read_bit = 3'b010;
	parameter prepare = 3'b001;
	parameter start = 3'b000;
	
	initial
		begin
			current_state = start;
			next_state = start;
			seed_out = 7168'b0;
			rom_en_out = 0;
			shift_en_out = 0;
			addr_out = 8'b00000000;
			count = 8'b00000000;
		end
	
	always@(posedge clk_in or posedge rst)
		begin
			if(rst)
				current_state <= start;
			else
				current_state <= next_state;
				//$display("dsasdsasdasdasdasd");
				//$stop(current_state == 2'b10);
		end
	
	always@(current_state or shift_ack or count or flage_full)
		begin
			next_state = current_state;
			case(current_state)
			start:
				begin
					//$display("dsasdsasdasdasdasd");
					next_state = prepare;
				end
			wait_stay:
				begin
					if(shift_ack&!(|count)) //shift_ack = 1 and count = 0
						next_state = prepare;
					if(!shift_ack&!(|count))//shift_ack = 0 and count = 0
						next_state = wait_stay;
				end
			read_bit:
				begin
					next_state = prepare;
					//if(!flage_full)	//get the enough seed or not 
						//next_state = prepare;
					//else
						//next_state = wait_stay;
				end
			prepare:
				begin
					if(!flage_full)
						next_state = read_bit;
					else
						next_state = final_compute;
				end
			final_compute:
				begin
					next_state = wait_stay;
				end
			default:
				;
			endcase
		end
		
	always@(posedge clk_in or posedge rst)
		begin
			if(rst)
				begin
					seed_out <= 7168'b0;
					rom_en_out <= 0;
					shift_en_out <= 0;
					addr_out <= 8'b00000000;
					count <= 8'b00000000;
				end
			else
				begin
					case(current_state)
					start:
						begin
							seed_out <= 7168'b0;
							count <= 8'b00000000;
							rom_en_out <= 0;
							shift_en_out <= 0;
						end
					wait_stay:
						begin
							if(next_state == wait_stay)
								begin
									//seed_out <= 7168'b0;
									count <= 8'b00000000;
									rom_en_out <= 0;
									shift_en_out <= 1;
								end
							if(next_state == prepare)
								begin
									seed_out <= 7168'b0;
									//count <= 8'b00000000;	  //start the counter
									shift_en_out <= 0;  
								end
						end
					prepare:
						begin
							if(next_state==read_bit)
								begin
									rom_en_out <= 1;
									addr_out <= count;
									count <= count + 1;  
								end
							else
								begin
									//shift_en_out <= 1;   //output the seed 
									//count <= 8'b00000000;  //clear
									rom_en_out <= 1;  
								end
						end
					read_bit:
						begin
							seed_out <= (seed_out<<32) + read_data;
						end
					final_compute:
						begin
							seed_out <= (seed_out<<32) + read_data;
						end
					endcase
				end
		end
	
endmodule

