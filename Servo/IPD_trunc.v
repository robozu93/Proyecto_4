`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:22:44 11/11/2015 
// Design Name: 
// Module Name:    IPD_trunc 
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
module IPD_trunc#(parameter cant_bits = 20)(
					input wire clk, rst, listo,
					input wire [cant_bits-1:0] r, y,
					output wire [cant_bits-13:0] trunc
    );

reg band;
wire [cant_bits-1:0] yy;
wire [2*cant_bits-1:0] suma;

IPD_gde IPD (
    .clk(clk), //--------
    .rst(rst), //------
    .listo(band), //--------
    .r(r), //---------
    .y(yy), //---------
    .suma(suma)	//---------
    );
	 
trunc TRUNC (
    .in(suma), //--------
    .out(trunc)	//------------
    );
	 
reg_y REG_Y (
    .in(y), 
    .clk(clk), //--------
    .leer(listo), 
    .rst(rst), 
    .out(yy)
    );

always @ *
	if(y != yy)
		band = 1;
	else
		band = 0;

endmodule
