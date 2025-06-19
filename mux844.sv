module mux844(in0,in1,sel,out);
input sel;
input [7:0]in0[3:0][3:0];
input [7:0]in1[3:0][3:0];
output [7:0] out[3:0][3:0];

assign out[0] = sel?(in1[0]):(in0[0]);
assign out[1] = sel?(in1[1]):(in0[1]);
assign out[2] = sel?(in1[2]):(in0[2]);
assign out[3] = sel?(in1[3]):(in0[3]);
endmodule
