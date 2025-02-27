`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:18:43 02/26/2025 
// Design Name: 
// Module Name:    regaddr_comparator 
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
module regaddr_comparator(
    input [1:0] regaddr,
    output reg0_match,
    output reg1_match,
    output reg2_match,
    output reg3_match
    );

	 assign reg0_match = (regaddr == 2'b00) ? 1'b1 : 1'b0;
	 assign reg1_match = (regaddr == 2'b01) ? 1'b1 : 1'b0;
	 assign reg2_match = (regaddr == 2'b10) ? 1'b1 : 1'b0;
	 assign reg3_match = (regaddr == 2'b11) ? 1'b1 : 1'b0;

endmodule
