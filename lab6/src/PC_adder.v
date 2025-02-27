`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:27 02/26/2025 
// Design Name: 
// Module Name:    PC_adder 
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
module PC_adder(
    input [8:0] PC,
    output [8:0] PC_out
    );

	assign PC_out = PC + 1'b1;

endmodule
