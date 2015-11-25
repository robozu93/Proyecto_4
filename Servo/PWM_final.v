`timescale 1ns / 1ps

module PWM_final#(parameter sd=39)( 
	input [7:0] in,
	input wire clk, rst,
	output reg out
    );
	 
	 
reg[13:0] counter=0;

//------------suma de 128 para poner offset

wire signed [7:0] PWM_sum;
assign PWM_sum = in + 8'd128; //CAMBIO!!!!!! 
//------------

always@(posedge clk)
	if(rst == 1) 
		out = 0;
	else 
		begin 
			counter = counter + 1'b1;
				if(counter <= PWM_sum*sd)
					out = 1;
				else 
					out = 0;
				if(counter >= 10_000) 
					counter = 0; 
		end

endmodule
