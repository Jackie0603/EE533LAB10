////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : mux_4x8bit.vf
// /___/   /\     Timestamp : 02/26/2025 20:54:37
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family virtex2p -w "C:/Documents and Settings/student/Lab6_4/mux_4x8bit.sch" mux_4x8bit.vf
//Design Name: mux_4x8bit
//Device: virtex2p
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module M2_1E_MXILINX_mux_4x8bit(D0, 
                                D1, 
                                E, 
                                S0, 
                                O);

    input D0;
    input D1;
    input E;
    input S0;
   output O;
   
   wire M0;
   wire M1;
   
   AND3 I_36_30 (.I0(D1), 
                 .I1(E), 
                 .I2(S0), 
                 .O(M1));
   AND3B1 I_36_31 (.I0(S0), 
                   .I1(E), 
                   .I2(D0), 
                   .O(M0));
   OR2 I_36_38 (.I0(M1), 
                .I1(M0), 
                .O(O));
endmodule
`timescale 1ns / 1ps

module M4_1E_MXILINX_mux_4x8bit(D0, 
                                D1, 
                                D2, 
                                D3, 
                                E, 
                                S0, 
                                S1, 
                                O);

    input D0;
    input D1;
    input D2;
    input D3;
    input E;
    input S0;
    input S1;
   output O;
   
   wire M01;
   wire M23;
   
   M2_1E_MXILINX_mux_4x8bit I_M01 (.D0(D0), 
                                   .D1(D1), 
                                   .E(E), 
                                   .S0(S0), 
                                   .O(M01));
   // synthesis attribute HU_SET of I_M01 is "I_M01_1"
   M2_1E_MXILINX_mux_4x8bit I_M23 (.D0(D2), 
                                   .D1(D3), 
                                   .E(E), 
                                   .S0(S0), 
                                   .O(M23));
   // synthesis attribute HU_SET of I_M23 is "I_M23_0"
   MUXF5 I_O (.I0(M01), 
              .I1(M23), 
              .S(S1), 
              .O(O));
endmodule
`timescale 1ns / 1ps

module mux_4x8bit(D0, 
                  D1, 
                  D2, 
                  D3, 
                  E, 
                  S, 
                  O);

    input [7:0] D0;
    input [7:0] D1;
    input [7:0] D2;
    input [7:0] D3;
    input E;
    input [1:0] S;
   output [7:0] O;
   
   
   M4_1E_MXILINX_mux_4x8bit XLXI_1 (.D0(D0[0]), 
                                    .D1(D1[0]), 
                                    .D2(D2[0]), 
                                    .D3(D3[0]), 
                                    .E(E), 
                                    .S0(S[0]), 
                                    .S1(S[1]), 
                                    .O(O[0]));
   // synthesis attribute HU_SET of XLXI_1 is "XLXI_1_2"
   M4_1E_MXILINX_mux_4x8bit XLXI_2 (.D0(D0[1]), 
                                    .D1(D1[1]), 
                                    .D2(D2[1]), 
                                    .D3(D3[1]), 
                                    .E(E), 
                                    .S0(S[0]), 
                                    .S1(S[1]), 
                                    .O(O[1]));
   // synthesis attribute HU_SET of XLXI_2 is "XLXI_2_3"
   M4_1E_MXILINX_mux_4x8bit XLXI_3 (.D0(D0[2]), 
                                    .D1(D1[2]), 
                                    .D2(D2[2]), 
                                    .D3(D3[2]), 
                                    .E(E), 
                                    .S0(S[0]), 
                                    .S1(S[1]), 
                                    .O(O[2]));
   // synthesis attribute HU_SET of XLXI_3 is "XLXI_3_4"
   M4_1E_MXILINX_mux_4x8bit XLXI_4 (.D0(D0[3]), 
                                    .D1(D1[3]), 
                                    .D2(D2[3]), 
                                    .D3(D3[3]), 
                                    .E(E), 
                                    .S0(S[0]), 
                                    .S1(S[1]), 
                                    .O(O[3]));
   // synthesis attribute HU_SET of XLXI_4 is "XLXI_4_5"
   M4_1E_MXILINX_mux_4x8bit XLXI_10 (.D0(D0[4]), 
                                     .D1(D1[4]), 
                                     .D2(D2[4]), 
                                     .D3(D3[4]), 
                                     .E(E), 
                                     .S0(S[0]), 
                                     .S1(S[1]), 
                                     .O(O[4]));
   // synthesis attribute HU_SET of XLXI_10 is "XLXI_10_6"
   M4_1E_MXILINX_mux_4x8bit XLXI_11 (.D0(D0[5]), 
                                     .D1(D1[5]), 
                                     .D2(D2[5]), 
                                     .D3(D3[5]), 
                                     .E(E), 
                                     .S0(S[0]), 
                                     .S1(S[1]), 
                                     .O(O[5]));
   // synthesis attribute HU_SET of XLXI_11 is "XLXI_11_7"
   M4_1E_MXILINX_mux_4x8bit XLXI_12 (.D0(D0[6]), 
                                     .D1(D1[6]), 
                                     .D2(D2[6]), 
                                     .D3(D3[6]), 
                                     .E(E), 
                                     .S0(S[0]), 
                                     .S1(S[1]), 
                                     .O(O[6]));
   // synthesis attribute HU_SET of XLXI_12 is "XLXI_12_8"
   M4_1E_MXILINX_mux_4x8bit XLXI_13 (.D0(D0[7]), 
                                     .D1(D1[7]), 
                                     .D2(D2[7]), 
                                     .D3(D3[7]), 
                                     .E(E), 
                                     .S0(S[0]), 
                                     .S1(S[1]), 
                                     .O(O[7]));
   // synthesis attribute HU_SET of XLXI_13 is "XLXI_13_9"
endmodule
