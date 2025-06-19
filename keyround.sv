module keyround(in,out,count);
input [63:0]in;
input clk;
output [63:0]out;
wire [7:0]shifted[0:3];
wire [7:0]subs[0:3];
input [7:0]count;

assign shifted[3] = in[7:0];
assign shifted[2] = in[31:24];
assign shifted[1] = in[23:16];
assign shifted[0] = in[15:8];

key_sub_b sub(.addr(shifted),.data(subs));

assign out[31:24] = subs[3];
assign out[23:16] = subs[2];
assign out[15:8] = subs[1];
assign out[7:0] = subs[0]^count;
endmodule
