`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:25:08 11/12/2015 
// Design Name: 
// Module Name:    TOP 
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
module TOP(
	input wire clk, rst, enviar, /*subir, bajar,*/ sdata,
	input wire [7:0] ref_in,
	output wire [6:0] seg,
	output wire [7:0] an, 
	output wire [7:0] out,
	output wire PWM_out, cs, sclk
    );

wire [19:0] ref, y;

ADC ADC (
    .clk(clk), //---------
    .rst(rst), //----------
    .sdata(sdata), //--------
    .out(y), //---------
    .cs(cs), //------------
    .sclk(sclk), //--------
    .desp_enable(listo)	//---------
    );

REF REF (
    .clk(clk), 
    .rst(rst), 
    .en(1'b1), 
    .enviar(enviar), 
    .ref_in(ref_in), 
    .ref_out(ref), 
    .seg(seg), 
    .an(an)
    );
	 
IPD_trunc IPD (	
    .clk(clk), //-------------
    .rst(rst), //------------
    .listo(listo), //----------
    .r(ref), //----------
    .y(y), //------------
    .trunc(out)	//------
    );
	 
PWM_final PWM (
    .in(out), //-----
    .clk(clk), //-----
    .rst(rst), //-------
    .out(PWM_out)//-----
    );
	 
endmodule
