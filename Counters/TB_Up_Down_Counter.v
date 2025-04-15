`timescale 1ns/1ps

module tb_up_down_counter;

reg clk,rst,up_down;
reg [3:0] data_in;
wire [3:0] q;

Up_Down_Counter uut(.clk(clk),.rst(rst),.q(q),.data_in(data_in),.up_down(up_down));

always #10 clk = ~clk;

initial begin
    clk=0;
    rst = 1;
    #10
    rst=0;
    up_down = 1;
    //#200 rst = 1;
    #10 rst = 0;
    data_in = 4'b1010;
    up_down = 0;
    #300 $finish;
    end


initial begin
$monitor ($time,"Q = %b",q);
end
endmodule