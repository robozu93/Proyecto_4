`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:56:38 10/28/2015 
// Design Name: 
// Module Name:    referencia 
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
module referencia(
	input wire enviar, rst, clk,
	input wire [7:0] ref_in,
	output reg [7:0] ref_out
    );

always @ (posedge clk)
	if(rst)
		ref_out = 0;
	else
		if(enviar)
			ref_out = ref_in;
		else
			ref_out = ref_out;

endmodule
