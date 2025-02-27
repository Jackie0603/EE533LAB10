////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : Program_Counter.vf
// /___/   /\     Timestamp : 02/26/2025 20:54:38
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family virtex2p -w "C:/Documents and Settings/student/Lab6_4/Program_Counter.sch" Program_Counter.vf
//Design Name: Program_Counter
//Device: virtex2p
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module Program_Counter(CLK, 
                       RST, 
                       imemaddr);

    input CLK;
    input RST;
   output [8:0] imemaddr;
   
   wire [8:0] XLXN_4;
   wire [8:0] imemaddr_DUMMY;
   
   assign imemaddr[8:0] = imemaddr_DUMMY[8:0];
   PC_adder XLXI_1 (.PC(imemaddr_DUMMY[8:0]), 
                    .PC_out(XLXN_4[8:0]));
   PC_flipflop XLXI_2 (.CLK(CLK), 
                       .PC(XLXN_4[8:0]), 
                       .RST(RST), 
                       .next_PC(imemaddr_DUMMY[8:0]));
endmodule
