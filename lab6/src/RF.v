`timescale 1ns/1ps

module RF #(
    parameter DATAWIDTH = 64,
    parameter RFDEPTH = 4
)
(
    input clk, rst,

    input [$clog2(RFDEPTH)-1:0] raddr1, raddr2,
    output wire [DATAWIDTH-1:0] rdata1, rdata2,

    input wen,
    input wire [$clog2(RFDEPTH)-1:0] waddr,
    input wire [DATAWIDTH-1:0] wdata
);

    reg [DATAWIDTH-1:0] registers [RFDEPTH-1:0];

    assign rdata1 = registers[raddr1];
    assign rdata2 = registers[raddr2];


    integer i;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < RFDEPTH; i = i + 1) begin
                registers[i] <= {DATAWIDTH{1'b0}};  
            end
        end else if (wen) begin
            registers[waddr] <= wdata;
        end
    end

endmodule
