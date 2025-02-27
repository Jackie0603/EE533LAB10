////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : mux_2x64bit.vf
// /___/   /\     Timestamp : 02/26/2025 20:54:37
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family virtex2p -w "C:/Documents and Settings/student/Lab6_4/mux_2x64bit.sch" mux_2x64bit.vf
//Design Name: mux_2x64bit
//Device: virtex2p
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module mux_2x64bit(D0, 
                   D1, 
                   S, 
                   O);

    input [63:0] D0;
    input [63:0] D1;
    input S;
   output [63:0] O;
   
   
   mux_2x8bit XLXI_13 (.D0(D0[7:0]), 
                       .D1(D1[7:0]), 
                       .S(S), 
                       .O(O[7:0]));
   mux_2x8bit XLXI_14 (.D0(D0[39:32]), 
                       .D1(D1[39:32]), 
                       .S(S), 
                       .O(O[39:32]));
   mux_2x8bit XLXI_15 (.D0(D0[15:8]), 
                       .D1(D1[15:8]), 
                       .S(S), 
                       .O(O[15:8]));
   mux_2x8bit XLXI_16 (.D0(D0[47:40]), 
                       .D1(D1[47:40]), 
                       .S(S), 
                       .O(O[47:40]));
   mux_2x8bit XLXI_17 (.D0(D0[23:16]), 
                       .D1(D1[23:16]), 
                       .S(S), 
                       .O(O[23:16]));
   mux_2x8bit XLXI_18 (.D0(D0[55:48]), 
                       .D1(D1[55:48]), 
                       .S(S), 
                       .O(O[55:48]));
   mux_2x8bit XLXI_19 (.D0(D0[31:24]), 
                       .D1(D1[31:24]), 
                       .S(S), 
                       .O(O[31:24]));
   mux_2x8bit XLXI_20 (.D0(D0[63:56]), 
                       .D1(D1[63:56]), 
                       .S(S), 
                       .O(O[63:56]));
endmodule
