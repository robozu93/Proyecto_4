`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name:    
// Module Name:    
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
module div_frec2(
	input wire clk, rst,    
	output reg nclk      
    );
	  
reg [11:0] cuenta; 
 
always @(posedge clk)
		if(rst)
			begin
				nclk <= 12'b0;
				cuenta <= 1'b0;
			end 
		else 	
			if(cuenta == 12'd4095)
				begin                    
					cuenta <= 12'h0;  
					nclk <= ~nclk;  
				end 
			else 
				cuenta <= cuenta + 1'b1; 
 
endmodule

