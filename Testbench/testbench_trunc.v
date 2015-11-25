`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:22:13 11/12/2015
// Design Name:   trunc
// Module Name:   C:/Xilinx/Proyecto4/testbench_trunc.v
// Project Name:  Proyecto4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: trunc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench_trunc;

	// Inputs
	reg [21:0] in;
	
	reg [24:0] datos [0:99];

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	trunc uut (
		.in(in), 
		.out(out)
	);

	integer j, arch_text, num_datos = 100;

	initial 
		begin
			// Initialize Inputs
			in = 0;
			j = 0;
		end
		
	initial 
		begin 
			$readmemb("resp_bin.txt",datos);
			arch_text = $fopen("resp_bin_trunc.txt","w"); 
			for(j=0; j<num_datos; j=j+1) 
				begin
					in = datos[j];
					#10 $fwrite(arch_text,"%b\n",out); 
				end
		 $fclose(arch_text);
		 $stop;
		end

endmodule

