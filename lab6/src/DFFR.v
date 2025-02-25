
module DFFR
#(  parameter  DW = 1 )
(    
    input               clk,
    input               rst,
    input      [DW-1:0] D,
    output reg [DW-1:0] Q
);


always@(posedge clk or posedge rst) begin

    if (rst) 
        Q <= 'b0;
    
    else 
        Q <= D;
    
end

endmodule