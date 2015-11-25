`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:14:05 10/29/2015 
// Design Name: 
// Module Name:    REF 
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
module REF(
	input wire clk, rst, en, enviar,
	input wire [7:0] ref_in,
	output wire [19:0] ref_out,
	output wire [6:0] seg,
	output wire [7:0] an
    );

wire [3:0] uni, dec, cent, uni_r, dec_r, cent_r;
wire [7:0] ref;

BCD bcd_escog (
    .num(ref_in), //---------
    .cent(cent), //-----
    .dec(dec), //--
    .uni(uni)//------
    );
	 
BCD bcd_real (
    .num(ref), //---------
    .cent(cent_r), //-----
    .dec(dec_r), //--
    .uni(uni_r)//------
    );
	 
div_frec2 div_7seg (
    .clk(clk), //----
    .rst(1'b0), //--------
    .nclk(clk_7seg)//-----
    );
	 
referencia reg_ref (
    .enviar(enviar), //------
    .rst(rst), //------
    .clk(clk), //------
    .ref_in(ref_in), //--------
    .ref_out(ref)//------
    );
	 
siete_seg segs (
    .uni(uni), //----
    .dec(dec), //------
    .cent(cent), //-------
	 .unir(uni_r),//---------
	 .decr(dec_r),//------
	 .centr(cent_r),//---
    .EN(en), //---------
    .clk(clk_7seg), //-----
    .seg(seg), //---
    .an(an)//-------
    ); 

assign ref_out = {12'b000,ref};

endmodule
