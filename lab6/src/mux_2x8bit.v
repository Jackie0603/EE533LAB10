////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : mux_2x8bit.vf
// /___/   /\     Timestamp : 02/26/2025 20:54:36
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family virtex2p -w "C:/Documents and Settings/student/Lab6_4/mux_2x8bit.sch" mux_2x8bit.vf
//Design Name: mux_2x8bit
//Device: virtex2p
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module M2_1_MXILINX_mux_2x8bit(D0, 
                               D1, 
                               S0, 
                               O);

    input D0;
    input D1;
    input S0;
   output O;
   
   wire M0;
   wire M1;
   
   AND2B1 I_36_7 (.I0(S0), 
                  .I1(D0), 
                  .O(M0));
   OR2 I_36_8 (.I0(M1), 
               .I1(M0), 
               .O(O));
   AND2 I_36_9 (.I0(D1), 
                .I1(S0), 
                .O(M1));
endmodule
`timescale 1ns / 1ps

module mux_2x8bit(D0, 
                  D1, 
                  S, 
                  O);

    input [7:0] D0;
    input [7:0] D1;
    input S;
   output [7:0] O;
   
   
   M2_1_MXILINX_mux_2x8bit XLXI_14 (.D0(D0[0]), 
                                    .D1(D1[0]), 
                                    .S0(S), 
                                    .O(O[0]));
   // synthesis attribute HU_SET of XLXI_14 is "XLXI_14_0"
   M2_1_MXILINX_mux_2x8bit XLXI_18 (.D0(D0[1]), 
                                    .D1(D1[1]), 
                                    .S0(S), 
                                    .O(O[1]));
   // synthesis attribute HU_SET of XLXI_18 is "XLXI_18_1"
   M2_1_MXILINX_mux_2x8bit XLXI_19 (.D0(D0[2]), 
                                    .D1(D1[2]), 
                                    .S0(S), 
                                    .O(O[2]));
   // synthesis attribute HU_SET of XLXI_19 is "XLXI_19_2"
   M2_1_MXILINX_mux_2x8bit XLXI_20 (.D0(D0[4]), 
                                    .D1(D1[4]), 
                                    .S0(S), 
                                    .O(O[4]));
   // synthesis attribute HU_SET of XLXI_20 is "XLXI_20_3"
   M2_1_MXILINX_mux_2x8bit XLXI_21 (.D0(D0[5]), 
                                    .D1(D1[5]), 
                                    .S0(S), 
                                    .O(O[5]));
   // synthesis attribute HU_SET of XLXI_21 is "XLXI_21_4"
   M2_1_MXILINX_mux_2x8bit XLXI_22 (.D0(D0[6]), 
                                    .D1(D1[6]), 
                                    .S0(S), 
                                    .O(O[6]));
   // synthesis attribute HU_SET of XLXI_22 is "XLXI_22_5"
   M2_1_MXILINX_mux_2x8bit XLXI_23 (.D0(D0[3]), 
                                    .D1(D1[3]), 
                                    .S0(S), 
                                    .O(O[3]));
   // synthesis attribute HU_SET of XLXI_23 is "XLXI_23_6"
   M2_1_MXILINX_mux_2x8bit XLXI_24 (.D0(D0[7]), 
                                    .D1(D1[7]), 
                                    .S0(S), 
                                    .O(O[7]));
   // synthesis attribute HU_SET of XLXI_24 is "XLXI_24_7"
endmodule
