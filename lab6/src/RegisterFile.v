////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : RegisterFile.vf
// /___/   /\     Timestamp : 02/26/2025 20:54:35
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family virtex2p -w "C:/Documents and Settings/student/Lab6_4/RegisterFile.sch" RegisterFile.vf
//Design Name: RegisterFile
//Device: virtex2p
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module RegisterFile(CLK, 
                    Reg1, 
                    Reg2, 
                    RST, 
                    WData, 
                    WEn, 
                    WReg, 
                    R1out, 
                    R2out);

    input CLK;
    input [1:0] Reg1;
    input [1:0] Reg2;
    input RST;
    input [63:0] WData;
    input WEn;
    input [1:0] WReg;
   output [63:0] R1out;
   output [63:0] R2out;
   
   wire one;
   wire reg0_match;
   wire reg0_s;
   wire reg1_match;
   wire reg1_s;
   wire reg2_match;
   wire reg2_s;
   wire reg3_match;
   wire reg3_s;
   wire [63:0] R0;
   wire [63:0] R1;
   wire [63:0] R2;
   wire [63:0] R3;
   wire [63:0] XLXN_16;
   wire [63:0] XLXN_20;
   wire [63:0] XLXN_23;
   wire [63:0] XLXN_26;
   
   reg_64bit XLXI_1 (.CE(one), 
                     .CLK(CLK), 
                     .D(XLXN_16[63:0]), 
                     .RST(RST), 
                     .Q(R0[63:0]));
   reg_64bit XLXI_2 (.CE(one), 
                     .CLK(CLK), 
                     .D(XLXN_20[63:0]), 
                     .RST(RST), 
                     .Q(R1[63:0]));
   reg_64bit XLXI_3 (.CE(one), 
                     .CLK(CLK), 
                     .D(XLXN_23[63:0]), 
                     .RST(RST), 
                     .Q(R2[63:0]));
   reg_64bit XLXI_4 (.CE(one), 
                     .CLK(CLK), 
                     .D(XLXN_26[63:0]), 
                     .RST(RST), 
                     .Q(R3[63:0]));
   mux_4x64bit XLXI_5 (.D0(R0[63:0]), 
                       .D1(R1[63:0]), 
                       .D2(R2[63:0]), 
                       .D3(R3[63:0]), 
                       .E(one), 
                       .S(Reg1[1:0]), 
                       .O(R1out[63:0]));
   mux_4x64bit XLXI_6 (.D0(R0[63:0]), 
                       .D1(R1[63:0]), 
                       .D2(R2[63:0]), 
                       .D3(R3[63:0]), 
                       .E(one), 
                       .S(Reg2[1:0]), 
                       .O(R2out[63:0]));
   mux_2x64bit XLXI_15 (.D0(R0[63:0]), 
                        .D1(WData[63:0]), 
                        .S(reg0_s), 
                        .O(XLXN_16[63:0]));
   mux_2x64bit XLXI_16 (.D0(R1[63:0]), 
                        .D1(WData[63:0]), 
                        .S(reg1_s), 
                        .O(XLXN_20[63:0]));
   mux_2x64bit XLXI_17 (.D0(R2[63:0]), 
                        .D1(WData[63:0]), 
                        .S(reg2_s), 
                        .O(XLXN_23[63:0]));
   mux_2x64bit XLXI_18 (.D0(R3[63:0]), 
                        .D1(WData[63:0]), 
                        .S(reg3_s), 
                        .O(XLXN_26[63:0]));
   VCC XLXI_19 (.P(one));
   AND2 XLXI_20 (.I0(WEn), 
                 .I1(reg0_match), 
                 .O(reg0_s));
   AND2 XLXI_21 (.I0(WEn), 
                 .I1(reg1_match), 
                 .O(reg1_s));
   AND2 XLXI_22 (.I0(WEn), 
                 .I1(reg2_match), 
                 .O(reg2_s));
   AND2 XLXI_23 (.I0(WEn), 
                 .I1(reg3_match), 
                 .O(reg3_s));
   regaddr_comparator XLXI_25 (.regaddr(WReg[1:0]), 
                               .reg0_match(reg0_match), 
                               .reg1_match(reg1_match), 
                               .reg2_match(reg2_match), 
                               .reg3_match(reg3_match));
endmodule
