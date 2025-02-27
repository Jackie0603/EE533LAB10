////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : mux_4x64bit.vf
// /___/   /\     Timestamp : 02/26/2025 20:54:37
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family virtex2p -w "C:/Documents and Settings/student/Lab6_4/mux_4x64bit.sch" mux_4x64bit.vf
//Design Name: mux_4x64bit
//Device: virtex2p
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module mux_4x64bit(D0, 
                   D1, 
                   D2, 
                   D3, 
                   E, 
                   S, 
                   O);

    input [63:0] D0;
    input [63:0] D1;
    input [63:0] D2;
    input [63:0] D3;
    input E;
    input [1:0] S;
   output [63:0] O;
   
   
   mux_4x8bit XLXI_1 (.D0(D0[7:0]), 
                      .D1(D1[7:0]), 
                      .D2(D2[7:0]), 
                      .D3(D3[7:0]), 
                      .E(E), 
                      .S(S[1:0]), 
                      .O(O[7:0]));
   mux_4x8bit XLXI_2 (.D0(D0[15:8]), 
                      .D1(D1[15:8]), 
                      .D2(D2[15:8]), 
                      .D3(D3[15:8]), 
                      .E(E), 
                      .S(S[1:0]), 
                      .O(O[15:8]));
   mux_4x8bit XLXI_3 (.D0(D0[23:16]), 
                      .D1(D1[23:16]), 
                      .D2(D2[23:16]), 
                      .D3(D3[23:16]), 
                      .E(E), 
                      .S(S[1:0]), 
                      .O(O[23:16]));
   mux_4x8bit XLXI_4 (.D0(D0[31:24]), 
                      .D1(D1[31:24]), 
                      .D2(D2[31:24]), 
                      .D3(D3[31:24]), 
                      .E(E), 
                      .S(S[1:0]), 
                      .O(O[31:24]));
   mux_4x8bit XLXI_9 (.D0(D0[39:32]), 
                      .D1(D1[39:32]), 
                      .D2(D2[39:32]), 
                      .D3(D3[39:32]), 
                      .E(E), 
                      .S(S[1:0]), 
                      .O(O[39:32]));
   mux_4x8bit XLXI_10 (.D0(D0[47:40]), 
                       .D1(D1[47:40]), 
                       .D2(D2[47:40]), 
                       .D3(D3[47:40]), 
                       .E(E), 
                       .S(S[1:0]), 
                       .O(O[47:40]));
   mux_4x8bit XLXI_11 (.D0(D0[55:48]), 
                       .D1(D1[55:48]), 
                       .D2(D2[55:48]), 
                       .D3(D3[55:48]), 
                       .E(E), 
                       .S(S[1:0]), 
                       .O(O[55:48]));
   mux_4x8bit XLXI_12 (.D0(D0[63:56]), 
                       .D1(D1[63:56]), 
                       .D2(D2[63:56]), 
                       .D3(D3[63:56]), 
                       .E(E), 
                       .S(S[1:0]), 
                       .O(O[63:56]));
endmodule
