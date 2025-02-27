`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:52:56 02/26/2025 
// Design Name: 
// Module Name:    PC_flipflop 
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
module PC_flipflop(
    input [8:0] PC,
    input CLK,
    input RST,
    output reg [8:0] next_PC
    );
	 
	 always @ (posedge CLK, posedge RST)
	 begin
		if (RST) begin
			next_PC <= 9'b0;
		end
		else begin
			next_PC <= PC;
		end
	 end


endmodule
