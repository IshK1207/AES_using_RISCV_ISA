`timescale 1ns / 1ps
module aes_unit(in1,in2,out,aes_func);
input [63:0]in1,in2;
input [3:0]aes_func;
output [63:0]out;


wire [63:0] inv_shift_out,inv_sub_out,inv_mix_in,inv_mix_out,shift_out,sub_out,mix_out,keyround_out,key_xor_out;
wire inv_sel;

inv_shiftrow inv_srow (in1,in2,inv_shift_out);
inv_sub_b inv_sub_bytes(inv_shift_out,inv_sub_out);
mix_inv inv_mix(inv_mix_in,inv_mix_out);

multiplexer2 #(
        .WIDTH(`XLEN)
    ) mux_inv_sel (
        .in0 (in1),
        .in1 (inv_sub_out),
        .sel (inv_sel),
        .out (inv_mix_in)
    );
    
shiftrow shiftrow (in1,in2,shift_out);
sub_b sub_bytes(shift_out,sub_out);
mixcol mix(sub_out,mix_out);

keyround keyround(in1, keyround_out,rnum);
key_xor key_xor(in1,in2,key_xor_out);

    multiplexer8 #(
        .WIDTH(`XLEN)
    ) mux_out (
        .in0 (inv_mix_out),
        .in1 (inv_sub_out),
        .in2 (sub_out),
        .in3 (mix_out),
        .in4 (keyround_out),
        .in5 (key_xor_out),
        .in6 (`XLEN'b0),
        .in7 (`XLEN'b0),
        .sel (out_sel),
        .out (out)
    );

endmodule

