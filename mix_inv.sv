module mix_inv(in64,out64);
input [63:0]in64;
output [63:0]out64;

mix_inv32 mix1(in64[63:32],out[63:32]);
mix_inv32 mix2(in64[31:0],out[31:0]);
endmodule


module mix_inv32(in32,inv_out32);
input [31:0]in32;
output [31:0]inv_out32;
wire [7:0]in[3:0];
wire [7:0]mix_out[3:0];
wire [7:0]inv_out[3:0];
wire [7:0]x[3:0];
wire [7:0]x2[1:0];
wire [7:0]x_out[3:0];
wire [7:0]x2_out[1:0];

assign in[3] = in32[7:0];
assign in[2] = in32[15:8];
assign in[1] = in32[23:16];
assign in[0] = in32[31:24];

assign inv_out32[7:0] = inv_out[3];
assign inv_out32[15:8] = inv_out[2];
assign inv_out32[23:16] = inv_out[1];
assign inv_out32[31:24] = inv_out[0];


assign x[3] = in[3]^in[2];
assign x[2] = in[1]^in[2];
assign x[1] = in[1]^in[0];
assign x[0] = in[3]^in[0];

xtime xtime3 (.in(x[3]),.out(x_out[3]));
xtime xtime2 (.in(x[2]),.out(x_out[2]));
xtime xtime1 (.in(x[1]),.out(x_out[1]));
xtime xtime0 (.in(x[0]),.out(x_out[0]));

assign mix_out[3] = x_out[3]^in[2]^x[1];
assign mix_out[2] = x_out[2]^in[3]^x[1];
assign mix_out[1] = x_out[1]^in[0]^x[3];
assign mix_out[0] = x_out[0]^in[1]^x[3];

assign x2[1] = mix_out[2]^mix_out[0];
assign x2[0] = mix_out[3]^mix_out[1];

x2time x2time1 (.in(x2[1]),.out(x2_out[1]));
x2time x2time0 (.in(x2[0]),.out(x2_out[0]));

assign inv_out[3] = x2_out[0]^mix_out[3];
assign inv_out[2] = x2_out[1]^mix_out[2];
assign inv_out[1] = x2_out[0]^mix_out[1];
assign inv_out[0] = x2_out[1]^mix_out[0];

endmodule







