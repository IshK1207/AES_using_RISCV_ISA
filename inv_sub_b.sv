module inv_sub_b(clk,addr0,addr1,addr2,addr3,data0,data1,data2,data3);
input clk;
//input [31:0] addr [0:3];
//output reg [31:0] data[0:3];
output reg [31:0] data0,data1,data2,data3;
input [31:0] addr0,addr1,addr2,addr3;

//reg [31:0] data0,data1,data2,data3,addr0,addr1,addr2,addr3
reg [7:0] mem [0:255];
initial begin
    $readmemh("src_v/inv_sbox.mem", mem);
end

always @(*) begin
        data0[31:24] <= mem[addr0[31:24]];
        data0[23:16] <= mem[addr0[23:16]];
        data0[15:8] <= mem[addr0[15:8]];
        data0[7:0] <= mem[addr0[7:0]];
        data1[31:24] <= mem[addr1[31:24]];
        data1[23:16] <= mem[addr1[23:16]];
        data1[15:8] <= mem[addr1[15:8]];
        data1[7:0] <= mem[addr1[7:0]];
        data2[31:24] <= mem[addr2[31:24]];
        data2[23:16] <= mem[addr2[23:16]];
        data2[15:8] <= mem[addr2[15:8]];
        data2[7:0] <= mem[addr2[7:0]];
        data3[31:24] <= mem[addr3[31:24]];
        data3[23:16] <= mem[addr3[23:16]];
        data3[15:8] <= mem[addr3[15:8]];
        data3[7:0] <= mem[addr3[7:0]];


end
endmodule


