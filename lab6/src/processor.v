////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : processor.vf
// /___/   /\     Timestamp : 02/26/2025 20:54:37
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family virtex2p -w "C:/Documents and Settings/student/Lab6_4/processor.sch" processor.vf
//Design Name: processor
//Device: virtex2p
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module FD16RE_MXILINX_processor(C, 
                                CE, 
                                D, 
                                R, 
                                Q);

    input C;
    input CE;
    input [15:0] D;
    input R;
   output [15:0] Q;
   
   
   FDRE I_Q0 (.C(C), 
              .CE(CE), 
              .D(D[0]), 
              .R(R), 
              .Q(Q[0]));
   defparam I_Q0.INIT = 1'b0;
   FDRE I_Q1 (.C(C), 
              .CE(CE), 
              .D(D[1]), 
              .R(R), 
              .Q(Q[1]));
   defparam I_Q1.INIT = 1'b0;
   FDRE I_Q2 (.C(C), 
              .CE(CE), 
              .D(D[2]), 
              .R(R), 
              .Q(Q[2]));
   defparam I_Q2.INIT = 1'b0;
   FDRE I_Q3 (.C(C), 
              .CE(CE), 
              .D(D[3]), 
              .R(R), 
              .Q(Q[3]));
   defparam I_Q3.INIT = 1'b0;
   FDRE I_Q4 (.C(C), 
              .CE(CE), 
              .D(D[4]), 
              .R(R), 
              .Q(Q[4]));
   defparam I_Q4.INIT = 1'b0;
   FDRE I_Q5 (.C(C), 
              .CE(CE), 
              .D(D[5]), 
              .R(R), 
              .Q(Q[5]));
   defparam I_Q5.INIT = 1'b0;
   FDRE I_Q6 (.C(C), 
              .CE(CE), 
              .D(D[6]), 
              .R(R), 
              .Q(Q[6]));
   defparam I_Q6.INIT = 1'b0;
   FDRE I_Q7 (.C(C), 
              .CE(CE), 
              .D(D[7]), 
              .R(R), 
              .Q(Q[7]));
   defparam I_Q7.INIT = 1'b0;
   FDRE I_Q8 (.C(C), 
              .CE(CE), 
              .D(D[8]), 
              .R(R), 
              .Q(Q[8]));
   defparam I_Q8.INIT = 1'b0;
   FDRE I_Q9 (.C(C), 
              .CE(CE), 
              .D(D[9]), 
              .R(R), 
              .Q(Q[9]));
   defparam I_Q9.INIT = 1'b0;
   FDRE I_Q10 (.C(C), 
               .CE(CE), 
               .D(D[10]), 
               .R(R), 
               .Q(Q[10]));
   defparam I_Q10.INIT = 1'b0;
   FDRE I_Q11 (.C(C), 
               .CE(CE), 
               .D(D[11]), 
               .R(R), 
               .Q(Q[11]));
   defparam I_Q11.INIT = 1'b0;
   FDRE I_Q12 (.C(C), 
               .CE(CE), 
               .D(D[12]), 
               .R(R), 
               .Q(Q[12]));
   defparam I_Q12.INIT = 1'b0;
   FDRE I_Q13 (.C(C), 
               .CE(CE), 
               .D(D[13]), 
               .R(R), 
               .Q(Q[13]));
   defparam I_Q13.INIT = 1'b0;
   FDRE I_Q14 (.C(C), 
               .CE(CE), 
               .D(D[14]), 
               .R(R), 
               .Q(Q[14]));
   defparam I_Q14.INIT = 1'b0;
   FDRE I_Q15 (.C(C), 
               .CE(CE), 
               .D(D[15]), 
               .R(R), 
               .Q(Q[15]));
   defparam I_Q15.INIT = 1'b0;
endmodule
`timescale 1ns / 1ps

module processor(CLK, 
                 RST,
                 addr_in,
                 flag,
                 data_hi,
                 data_low);

    input CLK;
    input RST;
    input [7:0] addr_in;
    input flag;
    output [31:0] data_hi, data_low;
   
   wire [8:0] imemaddr;
   wire [31:0] instr;
   wire [31:0] instr_stage1;
   wire one;
   wire [63:0] R1_out_stg3;
   wire [63:0] R2_out_stg3;
   wire [63:0] WData;
   wire WMemEn;
   wire [63:0] XLXN_54;
   wire [63:0] XLXN_55;
   wire [63:0] XLXN_88;
   wire [63:0] XLXN_89;
   wire [63:0] XLXN_96;
   wire XLXN_111;
   
   Program_Counter XLXI_2 (.CLK(CLK), 
                           .RST(RST), 
                           .imemaddr(imemaddr[8:0]));
   FD16RE_MXILINX_processor XLXI_4 (.C(CLK), 
                                    .CE(one), 
                                    .D(instr[15:0]), 
                                    .R(RST), 
                                    .Q(instr_stage1[15:0]));
   // synthesis attribute HU_SET of XLXI_4 is "XLXI_4_0"
   FD16RE_MXILINX_processor XLXI_5 (.C(CLK), 
                                    .CE(one), 
                                    .D(instr[31:16]), 
                                    .R(RST), 
                                    .Q(instr_stage1[31:16]));
   // synthesis attribute HU_SET of XLXI_5 is "XLXI_5_1"
   RegisterFile XLXI_14 (.CLK(CLK), 
                         .Reg1(instr_stage1[6:5]), 
                         .Reg2(instr_stage1[4:3]), 
                         .RST(RST), 
                         .WData(WData[63:0]), 
                         .WEn(instr_stage1[7]), 
                         .WReg(instr_stage1[2:1]), 
                         .R1out(XLXN_54[63:0]), 
                         .R2out(XLXN_55[63:0]));
   VCC XLXI_15 (.P(one));
   reg_64bit XLXI_17 (.CE(one), 
                      .CLK(CLK), 
                      .D(XLXN_54[63:0]), 
                      .RST(RST), 
                      .Q(XLXN_89[63:0]));
   reg_64bit XLXI_18 (.CE(one), 
                      .CLK(CLK), 
                      .D(XLXN_55[63:0]), 
                      .RST(RST), 
                      .Q(XLXN_88[63:0]));
   reg_64bit XLXI_19 (.CE(one), 
                      .CLK(CLK), 
                      .D(XLXN_89[63:0]), 
                      .RST(RST), 
                      .Q(R1_out_stg3[63:0]));
   reg_64bit XLXI_20 (.CE(one), 
                      .CLK(CLK), 
                      .D(XLXN_88[63:0]), 
                      .RST(RST), 
                      .Q(R2_out_stg3[63:0]));


   wire [7:0] dmemaddr;

   assign dmemaddr = (flag) ? addr_in[7:0] : R1_out_stg3[7:0];
   assign {data_hi, data_low} = flag ? XLXN_96[63:0] : 64'hDEADBEEF;

   dmem XLXI_21 (.addr(dmemaddr), 
                 .clk(CLK), 
                 .din(R2_out_stg3[63:0]), 
                 .we(WMemEn), 
                 .dout(XLXN_96[63:0]));

   // dmem XLXI_21 (.addr(R1_out_stg3[7:0]), 
   //               .clk(CLK), 
   //               .din(R2_out_stg3[63:0]), 
   //               .we(WMemEn), 
   //               .dout(XLXN_96[63:0]));
   reg_64bit XLXI_22 (.CE(one), 
                      .CLK(CLK), 
                      .D(XLXN_96[63:0]), 
                      .RST(RST), 
                      .Q(WData[63:0]));
   FDR XLXI_23 (.C(CLK), 
                .D(instr_stage1[8]), 
                .R(RST), 
                .Q(XLXN_111));
   defparam XLXI_23.INIT = 1'b0;
   FDR XLXI_24 (.C(CLK), 
                .D(XLXN_111), 
                .R(RST), 
                .Q(WMemEn));
   defparam XLXI_24.INIT = 1'b0;
   imem XLXI_29 (.addr(imemaddr[8:0]), 
                 .clk(CLK), 
                 .dout(instr[31:0]));
endmodule
