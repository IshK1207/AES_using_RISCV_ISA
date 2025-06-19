module sub_b(addr0,data0);
output reg [63:0] data0;
input [63:0] addr0;

//reg [31:0] data0,data1,data2,data3,addr0,addr1,addr2,addr3
reg [7:0] mem [0:255];
initial begin
    $readmemh("sbox.mem", mem);
end


always @(*) begin
    data0[63:56] <= mem[addr0[63:56]];
	data0[55:48] <= mem[addr0[55:48]];
	data0[47:40] <= mem[addr0[47:40]];
	data0[39:32] <= mem[addr0[39:32]];
	data0[31:24] <= mem[addr0[31:24]];
	data0[23:16] <= mem[addr0[23:16]];
	data0[15:8] <= mem[addr0[15:8]];
	data0[7:0] <= mem[addr0[7:0]];
end
endmodule

