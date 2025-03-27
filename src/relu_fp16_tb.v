`timescale 1ns / 1ps

module relu_fp16_tb;
    reg  [15:0] in;
    wire [15:0] out;

    // Instantiate the ReLU module
    relu_fp16 uut (
        .in(in),
        .out(out)
    );

    initial begin
        $dumpfile("relu.vcd");
        $dumpvars(0, relu_fp16_tb);

        $display("Time\tin\tout");
        $monitor("%0dns\t%h\t%h", $time, in, out);

        // Test values (in FP16):
        // 0.5  => 0x3800
        // -0.5 => 0xb800
        // 1.0  => 0x3C00
        // -1.0 => 0xBC00
        // 0.0  => 0x0000

        in = 16'h3800; // 0.5
        #10;
        in = 16'hb800; // -0.5
        #10;
        in = 16'h3C00; // 1.0
        #10;
        in = 16'hBC00; // -1.0
        #10;
        in = 16'h0000; // 0.0
        #10;

        $finish;
    end
endmodule
