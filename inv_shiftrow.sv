module inv_shiftrow(in0,in1,in2,in3,out0,out1,out2,out3);
        input [31:0]in0,in1,in2,in3;
        output [31:0]out0,out1,out2,out3;

        assign  out0[7:0] = in0[7:0];
        assign  out1[7:0] = in1[7:0];
        assign  out2[7:0] = in2[7:0];
        assign  out3[7:0] = in3[7:0];
        assign  out0[15:8] = in3[15:8];
        assign  out1[15:8] = in0[15:8];
        assign  out2[15:8] = in1[15:8];
        assign  out3[15:8] = in2[15:8];
        assign  out0[23:16] = in2[23:16];
        assign  out1[23:16] = in3[23:16];
        assign  out2[23:16] = in0[23:16];
        assign  out3[23:16] = in1[23:16];
        assign  out0[31:24] = in1[31:24];
        assign   out1[31:24] = in2[31:24];
        assign  out2[31:24] = in3[31:24];
        assign  out3[31:24] = in0[31:24];

endmodule

