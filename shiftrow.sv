module shiftrow(in1,in2,out);
	input [63:0]in1,in2;
	output [63:0]out;

        assign  out[7:0] = in2[39:32];
        assign  out[15:8] = in1[15:8];
        assign  out[23:16] = in1[55:48];
        assign  out[31:24] = in2[31:24];
        assign  out[39:32] = in1[7:0];
        assign  out[47:40] = in1[47:40];
        assign  out[55:48] = in2[23:16];
        assign  out[63:56] = in2[63:56];
endmodule


