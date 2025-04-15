`timescale 1ns/1ps

module tb_pipo;
parameter WIDTH = 4;
reg clk,rst;
reg [WIDTH-1:0]din;

wire [WIDTH-1:0]q;

pipo utt(.q(q),.clk(clk),.rst(rst),.din(din));

always #10 clk = ~clk;

initial begin

clk = 0; rst = 1; din = 4'b0000;

#20 rst = 0;

din = 4'b1101;

#20 rst = 1;
#10 rst = 0;

din = 4'b0101;

#20 rst = 1;
#10 rst = 0;

din = 4'b1111;

#40 rst = 1;

#50 $finish;

end

endmodule