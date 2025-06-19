module mux8(in0,in1,sel,out);
input sel;
input [7:0]in0,in1;
output [7:0]out;

assign out = sel?in1:in0;
endmodule
