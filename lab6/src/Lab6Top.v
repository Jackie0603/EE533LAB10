module Lab6Top #(
    parameter IM_DEPTH = 9,
    parameter I_WIDTH = 32,
    parameter D_WIDTH = 64
)
(
    input clk, rst,
    input [7:0] addr_in,
    input flag,
    output [31:0] data_hi, data_low
);

//--------------
//   Stage 0  ( Fetch )
//--------------
wire [IM_DEPTH-1:0] PC;
wire [IM_DEPTH-1:0] PC_plus1; assign PC_plus1 = PC + 1;
DFFR #(.DW(IM_DEPTH)) dff_PC (.clk(clk), .rst(rst), .D(PC_plus1), .Q(PC) );

wire [I_WIDTH-1:0] Instr_Stg0;
I_Mem u_IMem (.addr(PC),.clk(clk),.dout(Instr_Stg0)
            ,.rst(rst));

// Stage0 / Stage1 Pipeline Register
wire [I_WIDTH-1:0] Instr_Stg1;
DFFR #(.DW(I_WIDTH)) dff_S01 (.clk(clk), .rst(rst), .D(Instr_Stg0), .Q(Instr_Stg1) );




//--------------
//   Stage 1 ( Decode )
//--------------
wire WMemEn_Stg1, WRegEn_Stg1;
wire [2:0] Reg1,Reg2, WReg_Stg1;

assign WReg_Stg1   =  Instr_Stg1[2:0];
assign Reg2        =  Instr_Stg1[5:3];
assign Reg1        =  Instr_Stg1[8:6];
assign WRegEn_Stg1 =  Instr_Stg1[9];
assign WMemEn_Stg1 =  Instr_Stg1[10];


wire [D_WIDTH-1:0] rdata1_Stg1,rdata2_Stg1;

wire WRegEn_Stg4;
wire [D_WIDTH-1:0] Mem_out_Stg4;
wire [2:0] WReg_Stg4;

RF u_RF 
( 
.clk(clk), .rst(rst),

.raddr1(Reg1), .raddr2(Reg2),
.rdata1(rdata1_Stg1), .rdata2(rdata2_Stg1),

.wen(WRegEn_Stg4), .waddr(WReg_Stg4), .wdata(Mem_out_Stg4)
);


// Stage1 / Stage2 Pipeline Register
wire WRegEn_Stg2, WMemEn_Stg2;
DFFR #(.DW(1)) dff_S12_0 (.clk(clk), .rst(rst), .D(WRegEn_Stg1), .Q(WRegEn_Stg2) );
DFFR #(.DW(1)) dff_S12_1 (.clk(clk), .rst(rst), .D(WMemEn_Stg1), .Q(WMemEn_Stg2) );

wire [D_WIDTH-1:0] rdata1_Stg2,rdata2_Stg2;
DFFR #(.DW(D_WIDTH)) dff_S12_2 (.clk(clk), .rst(rst), .D(rdata1_Stg1), .Q(rdata1_Stg2) );
DFFR #(.DW(D_WIDTH)) dff_S12_3 (.clk(clk), .rst(rst), .D(rdata2_Stg1), .Q(rdata2_Stg2) );

wire [2:0] WReg_Stg2;
DFFR #(.DW(3)) dff_S12_4 (.clk(clk), .rst(rst), .D(WReg_Stg1), .Q(WReg_Stg2) );



//--------------
//   Stage 2 ( Dummy Stage )
//--------------

// Stage2 / Stage3 Pipeline Register
wire WRegEn_Stg3, WMemEn_Stg3;
DFFR #(.DW(1)) dff_S23_0 (.clk(clk), .rst(rst), .D(WRegEn_Stg2), .Q(WRegEn_Stg3) );
DFFR #(.DW(1)) dff_S23_1 (.clk(clk), .rst(rst), .D(WMemEn_Stg2), .Q(WMemEn_Stg3) );

wire [D_WIDTH-1:0] rdata1_Stg3,rdata2_Stg3;
DFFR #(.DW(D_WIDTH)) dff_S23_2 (.clk(clk), .rst(rst), .D(rdata1_Stg2), .Q(rdata1_Stg3) );
DFFR #(.DW(D_WIDTH)) dff_S23_3 (.clk(clk), .rst(rst), .D(rdata2_Stg2), .Q(rdata2_Stg3) );

wire [2:0] WReg_Stg3;
DFFR #(.DW(3)) dff_S23_4 (.clk(clk), .rst(rst), .D(WReg_Stg2), .Q(WReg_Stg3) );



//--------------
//   Stage 3 (D Mem)
//--------------
// a = read port     b = write port
wire [D_WIDTH-1:0] Mem_out_Stg3;
wire [7:0] dmem_addra;
wire [7:0] dmem_douta;

assign dmem_addra = flag ? addr_in : rdata1_Stg3[7:0];
assign {data_hi, data_low} = flag ? Mem_out_Stg3 : 64'hDEADDEAD;

D_Mem u_DMem (.addra(dmem_addra),.addrb(rdata2_Stg3[7:0]),.clka(clk),.clkb(clk),
              .dinb(rdata2_Stg3),.douta(Mem_out_Stg3),.web(WMemEn_Stg3)
              ,.rst(rst));


// Stage3 / Stage4 Pipeline Register
//wire WRegEn_Stg4;
DFFR #(.DW(1)) dff_S34_0 (.clk(clk), .rst(rst), .D(WRegEn_Stg3), .Q(WRegEn_Stg4) );

//wire [D_WIDTH-1:0] Mem_out_Stg4;
DFFR #(.DW(D_WIDTH)) dff_S34_1 (.clk(clk), .rst(rst), .D(Mem_out_Stg3), .Q(Mem_out_Stg4) );

//wire [2:0] WReg_Stg4;
DFFR #(.DW(3)) dff_S34_2 (.clk(clk), .rst(rst), .D(WReg_Stg3), .Q(WReg_Stg4) );


//--------------
//   Stage 4 ( WB )
//--------------


endmodule