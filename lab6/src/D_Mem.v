// 64Width 256Deep

module D_Mem(
// a - Read    b - Write
input [7:0] addra, addrb,
input rst,
input clka, clkb,
input [63:0] dinb, // write data
output reg [63:0] douta,
input web
);

reg [63:0] D_bram [255:0];

always@(posedge clkb or posedge rst)begin
if(rst) begin
    D_bram <= '{default: 64'd0}; // Initialize entire memory to zero
    D_bram[0] <= 64'd4; 
    D_bram[4] <= 64'd100;
end
else if(web) begin
    D_bram[addrb] <= dinb;
end
end

always@(posedge clka or posedge rst)begin
if(rst) 
    douta <= 64'd0;
else
    douta <= D_bram[addra];
end

endmodule
