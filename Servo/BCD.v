`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    bcd 
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
module BCD(
    // I/O Signal Definitions
   input wire [7:0] num,
   output reg [3:0] cent,
   output reg [3:0] dec,
   output reg [3:0] uni
   );
   // Internal variable for storing bits
   reg [19:0] shift;
   integer i;
   
   always @(num)
   begin
      // Clear previous number and store new number in shift register
      shift[19:8] = 0;
      shift[7:0] = num;
      
      // Loop eight times
      for (i=0; i<8; i=i+1) begin
         if (shift[11:8] >= 5)
            shift[11:8] = shift[11:8] + 2'd3;
            
         if (shift[15:12] >= 5)
            shift[15:12] = shift[15:12] + 2'd3;
            
         if (shift[19:16] >= 5)
            shift[19:16] = shift[19:16] + 2'd3;
         
         // Shift entire register left once
         shift = shift << 1;
      end
      
      // Push decimal numbers to output
      cent = shift[19:16];
      dec     = shift[15:12];
      uni     = shift[11:8];
   end
 
endmodule
