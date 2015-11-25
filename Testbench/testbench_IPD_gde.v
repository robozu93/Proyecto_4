`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:22:40 11/10/2015
// Design Name:   IPD_gde
// Module Name:   C:/Xilinx/Proyecto4/testbench_IPD_gde.v
// Project Name:  Proyecto4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: IPD_gde
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench_IPD_gde;

	// Inputs
	reg clk;
	reg rst;
	reg en;
	reg listo;
	reg [10:0] r;
	reg [10:0] y;
	
	reg [24:0] datos [0:99];

	// Outputs
	wire [21:0] suma;

	// Instantiate the Unit Under Test (UUT)
	IPD_gde uut (
		.clk(clk), 
		.rst(rst), 
		.en(en), 
		.listo(listo), 
		.r(r), 
		.y(y), 
		.suma(suma)
	);

	integer j, arch_text, num_datos = 100;
	
	initial 
		begin
			// Initialize Inputs
			clk = 0;
			rst = 1;
			en = 1;
			listo = 0;
			j = 0;
			r = 11'd100;
			y = 0;
			#1 rst = 0;
		end

		 initial 
		 begin 
			$readmemb("estimulac_bin.txt",datos);
			arch_text = $fopen("resp_bin.txt","w"); 
			for(j=0; j<num_datos; j=j+1) 
				begin
					listo = 1; y = datos[j];
					repeat(1) @(posedge clk); listo = 0;
					repeat(15) @(posedge clk); $fwrite(arch_text,"%b\n",suma); 
				end
		 $fclose(arch_text);
		 $stop;
	 end

	initial forever #5 clk = ~clk; 
      
endmodule

