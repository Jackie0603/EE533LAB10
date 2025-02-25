// 32Width 512Deep
// I_Mem u_IMem (.addr(PC),.clk(clk),.dout(Instr_Stg0));
module I_Mem(
    input [8:0] addr,
    input clk,
    input rst,
    output reg [31:0] dout
);

reg [31:0] I_bram [511:0];

always@(posedge clk or posedge rst)begin
if(rst) begin
    I_bram <= '{default: 32'h0}; // Initialize entire memory to zero
    I_bram[0] <= 32'h00000202;
    I_bram[1] <= 32'h00000203;
    I_bram[5] <= 32'h00000498;
end
end

always@(posedge clk or posedge rst)begin
if(rst) 
    dout <= 32'h0;
else
    dout <= I_bram[addr];
end

endmodule
