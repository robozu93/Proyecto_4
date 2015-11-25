`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:00:06 11/10/2015 
// Design Name: 
// Module Name:    IPD_gde 
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
module IPD_gde#(parameter cant_bits = 20)(
					input wire clk, rst, listo,
					input wire signed [cant_bits-1:0] r, y,
					output reg signed [2*cant_bits-1:0] suma
    );

wire signed [cant_bits-1:0] cte_p, cte_d, cte_i;
wire signed [2*cant_bits-1:0] i, p, d, suma_casi;
reg signed [2*cant_bits-1:0] i_ant, y_ant;

initial begin i_ant = 0; y_ant = 0; end

assign cte_p = 20'sd18;
assign cte_d = 20'sd150;
assign cte_i = 20'sd7;

assign p = cte_p*y;
assign d = cte_d*(y-y_ant);
assign i = cte_i*(r-y)+i_ant;
assign suma_casi = i - p - d;

always @ (posedge clk, posedge rst) 
	if(rst)
		begin
			i_ant <= 0;
			y_ant <= 0;
			suma <= 0;
		end
	else if(listo)
		begin
			y_ant <= y;
			i_ant <= i;
			suma <= suma_casi;
		end
	else
		begin
			y_ant <= y_ant;
			i_ant <= i_ant;
			suma <= suma;
		end

endmodule
