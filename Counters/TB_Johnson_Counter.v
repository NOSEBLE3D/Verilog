`timescale 1ns / 1ps

module tb_johnson_counter;
parameter WIDTH =8;
    reg clk, rst;
    wire [WIDTH-1:0] q;

    // Instantiate the Johnson Counter module
    johnson_counter uut (
        .clk(clk),
        .rst(rst),
        .q(q)
    );

   
    always #5 clk = ~clk;

    initial begin
        
        clk = 0;
        rst = 1;

        
        #10 rst = 0;

        #200 $stop;
    end
endmodule