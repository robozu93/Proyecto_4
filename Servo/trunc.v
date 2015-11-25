`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:26:06 09/26/2015 
// Design Name: 
// Module Name:    redondeo 
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
module trunc#(parameter cant_bits = 40)(
					input wire signed [cant_bits-1:0] in,
					output reg [cant_bits-33:0] out
    );

initial out = 0;

localparam [cant_bits-34:0]	ceros = 0,
										unos = ~ceros;

//--------------------	division entre 256	
						
wire signed [cant_bits-1:0] aux_in;
assign aux_in = in;

wire [cant_bits-1:0] aux;
assign aux = aux_in >>> 8;

//--------------------

always @ *
	begin
		if(aux[cant_bits-1]==0 & aux[cant_bits-3:cant_bits-33]>0)			//overflow
			out = {1'b0,unos};
		else if(aux[cant_bits-1]==1 & (&aux[cant_bits-3:cant_bits-33])==0)		//overflow negativo	
			out = {1'b1,ceros};			
		else
			out = {aux[cant_bits-1],aux[cant_bits-34:0]};
	end
endmodule
