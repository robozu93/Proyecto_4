`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date:    
// Design Name: 
// Module Name:    control_7seg 
// Project Name: 
//////////////////////////////////////////////////////////////////////////////////
module siete_seg(
    input wire [3:0] uni, dec, cent, unir, decr, centr,
    input wire EN, clk,
    output reg [6:0] seg,
	 output reg [7:0] an
    );
							
	 localparam [2:0] estado_0 = 3'b000, 
							estado_1 = 3'b001,
							estado_2 = 3'b010,
							estado_3 = 3'b011,
							estado_4 = 3'b100,
							estado_5 = 3'b101,
							estado_6 = 3'b110,
							estado_7 = 3'b111;
	 
	 reg [2:0] est, est_sig;
	 
	 //----------------------------
	 always @(posedge clk)
		if (EN)
			est <= est_sig;
		else 
			est <= estado_7;
	 //----------------------------		
	 	 
	 always @ * 
	 begin
		est_sig = estado_0;
		an = 8'b11111111;
		seg = 7'b1111111;
		case(est)
			estado_0:begin
							an = 8'b11111110;
							case(uni)						//unidades, en el primer 7segmentos
								4'h0:	seg = 7'b1000000;
								4'h1:	seg = 7'b1111001;
								4'h2:	seg = 7'b0100100;
								4'h3:	seg = 7'b0110000;
								4'h4:	seg = 7'b0011001;
								4'h5:	seg = 7'b0010010;
								4'h6:	seg = 7'b0000010;
								4'h7:	seg = 7'b1111000;
								4'h8:	seg = 7'b0000000;
								4'h9:	seg = 7'b0010000;
								default: seg = 7'b0001001;	//pinta una "X" si le llega codigo no deseado
							endcase
							est_sig = estado_1;
						end
			estado_1:begin
							an = 8'b11111101;
							case(dec)						//decenas, en el segundo 7segmentos
								4'h0:	seg = 7'b1000000;
								4'h1:	seg = 7'b1111001;
								4'h2:	seg = 7'b0100100;
								4'h3:	seg = 7'b0110000;
								4'h4:	seg = 7'b0011001;
								4'h5:	seg = 7'b0010010;
								4'h6:	seg = 7'b0000010;
								4'h7:	seg = 7'b1111000;
								4'h8:	seg = 7'b0000000;
								4'h9:	seg = 7'b0010000;
								default: seg = 7'b0001001;	//pinta una "X" si le llega codigo no deseado
							endcase
							est_sig = estado_2;
						end
			estado_2:begin
							an = 8'b11111011;
							case(cent)						//centenas, en el tercer 7segmentos
								4'h0:	seg = 7'b1000000;
								4'h1:	seg = 7'b1111001;
								4'h2:	seg = 7'b0100100;
								default: seg = 7'b0001001;	//pinta una "X" si le llega codigo no deseado
							endcase
							est_sig = estado_3;
						end
			estado_3:begin									//imprime '-'
							an = 8'b11110111;
							seg = 7'b0111111;
							est_sig = estado_4;
						end
			estado_4:begin
							an = 8'b11101111;
							case(unir)						//unidades, en el quinto 7segmentos
								4'h0:	seg = 7'b1000000;
								4'h1:	seg = 7'b1111001;
								4'h2:	seg = 7'b0100100;
								4'h3:	seg = 7'b0110000;
								4'h4:	seg = 7'b0011001;
								4'h5:	seg = 7'b0010010;
								4'h6:	seg = 7'b0000010;
								4'h7:	seg = 7'b1111000;
								4'h8:	seg = 7'b0000000;
								4'h9:	seg = 7'b0010000;
								default: seg = 7'b0001001;	//pinta una "X" si le llega codigo no deseado
							endcase
							est_sig = estado_5;
						end
			estado_5:begin
							an = 8'b11011111;
							case(decr)						//decenas, en el sexto 7segmentos
								4'h0:	seg = 7'b1000000;
								4'h1:	seg = 7'b1111001;
								4'h2:	seg = 7'b0100100;
								4'h3:	seg = 7'b0110000;
								4'h4:	seg = 7'b0011001;
								4'h5:	seg = 7'b0010010;
								4'h6:	seg = 7'b0000010;
								4'h7:	seg = 7'b1111000;
								4'h8:	seg = 7'b0000000;
								4'h9:	seg = 7'b0010000;
								default: seg = 7'b0001001;	//pinta una "X" si le llega codigo no deseado
							endcase
							est_sig = estado_6;
						end
			estado_6:begin
							an = 8'b10111111;
							case(centr)						//centenas, en el setimo 7segmentos
								4'h0:	seg = 7'b1000000;
								4'h1:	seg = 7'b1111001;
								4'h2:	seg = 7'b0100100;
								default: seg = 7'b0001001;	//pinta una "X" si le llega codigo no deseado
							endcase
							est_sig = estado_0;
						end
			estado_7:begin									//estado de apagado, para apagar los 7segmentos
							an = 8'b11111111;
							seg = 7'b1111111;
							if(EN)
									est_sig = estado_0;
						end
		endcase
	 end	 
endmodule
