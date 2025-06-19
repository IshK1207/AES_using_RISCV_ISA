module key_sub_b(clk, addr, data);
input clk;
input [7:0] addr [0:3];
output reg [7:0] data[0:3];

reg [7:0] mem [0:255];

initial begin
    $readmemh("src_v/sbox.mem", mem);
end

always @(*) begin
    data[3] <= mem[addr[3]];
    data[2] <= mem[addr[2]];
    data[1] <= mem[addr[1]];
    data[0] <= mem[addr[0]];

end
endmodule

