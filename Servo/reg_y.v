`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:42:05 11/18/2015 
// Design Name: 
// Module Name:    reg_y 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module reg_y#(parameter cant_bits = 20)(
				input wire [cant_bits-1:0] in,
				input wire clk, leer, rst,
				output reg [cant_bits-1:0] out
    );

initial out = 20'b0;

always @ (posedge clk, posedge rst)
	if(rst)
		out <= 0;
	else
		if(leer)
			out <= in;
		else
			out <= out;
			
endmodule
