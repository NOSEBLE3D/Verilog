`timescale 1ns / 1ps

module tb_ring_counter;

    reg clk, rst;
    wire [15:0] q;

    // Instantiate the Ring Counter
    ring_counter uut (
        .clk(clk),
        .rst(rst),
        .q(q)
    );

    // Generate Clock (10ns period)
    always #5 clk = ~clk;

    initial begin
        // Initialize
        clk = 0;
        rst = 1;

        // Apply reset
        #10 rst = 0;

        // Run for 300ns to observe all 16 states
        #300 $stop;
    end

    // Monitor outputs
    initial begin
        $monitor("Time = %0t | q = %b", $time, q);
    end

endmodule
