module mixcol(in64,out64);
input [63:0]in64;
output [63:0]out64;

mixcol32 mix1(in64[63:32],out[63:32]);
mixcol32 mix2(in64[31:0],out[31:0]);
endmodule



module mixcol32(in32,out32);
input [31:0]in32;
output [31:0]out32;
wire [7:0]in[3:0];
wire [7:0]mix_out[3:0];
wire [7:0]x[3:0];
wire [7:0]x_out[3:0];

assign in[3] = in32[7:0];
assign in[2] = in32[15:8];
assign in[1] = in32[23:16];
assign in[0] = in32[31:24];

assign out32[7:0] = mix_out[3];
assign out32[15:8] = mix_out[2];
assign out32[23:16] = mix_out[1];
assign out32[31:24] = mix_out[0];

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

endmodule
