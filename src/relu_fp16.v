// ReLU Module for FP16 (IEEE 754 half-precision)
module relu_fp16 (
    input  [15:0] in,   // FP16 input
    output [15:0] out   // FP16 output
);
    // If sign bit is 1, output zero; else pass through
    assign out = in[15] ? 16'h0000 : in;
endmodule


// 4-Input MAC Module using FP16 arithmetic
module mac4_fp16 (
    input  [15:0] in0, in1, in2, in3,
    input  [15:0] w0,  w1,  w2,  w3,
    output [15:0] result
);
    wire [15:0] p0, p1, p2, p3;
    wire [15:0] sum0, sum1;

    fp16_mul mul0 (.a(in0), .b(w0), .out(p0));
    fp16_mul mul1 (.a(in1), .b(w1), .out(p1));
    fp16_mul mul2 (.a(in2), .b(w2), .out(p2));
    fp16_mul mul3 (.a(in3), .b(w3), .out(p3));

    fp16_add add0 (.a(p0), .b(p1), .out(sum0));
    fp16_add add1 (.a(p2), .b(p3), .out(sum1));
    fp16_add add2 (.a(sum0), .b(sum1), .out(result));
endmodule


// Behavioral or IP-based modules for simulation or synthesis
// Placeholder definitions below; replace with synthesizable versions if needed
module fp16_mul (
    input  [15:0] a,
    input  [15:0] b,
    output [15:0] out
);
    // Use synthesis tool's floating point IP for real implementation
    assign out = 16'h0000; // placeholder
endmodule

module fp16_add (
    input  [15:0] a,
    input  [15:0] b,
    output [15:0] out
);
    // Use synthesis tool's floating point IP for real implementation
    assign out = 16'h0000; // placeholder
endmodule
