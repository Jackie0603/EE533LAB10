// 64Width 256Deep

// D_Mem u_DMem (.addra(rdata1_Stg3),.addrb(rdata2_Stg3),.clka(clk),.clkb(clk),
              //.dinb(rdata2_Stg3),.douta(Mem_out_Stg3),.web(WMemEn_Stg3));

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

integer i;
always@(posedge clkb or posedge rst)begin
if(rst) begin
    for (i = 1; i < 256; i = i + 1) begin
        D_bram[i] <= 64'd0;  
    end    
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