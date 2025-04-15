//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.01.2025 11:15:04
// Design Name: 
// Module Name: Up_Counter_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns/1ps

module up_counter_4_bit_tb;

    reg clk, rst;
    wire [3:0] q;

    // Instantiate the 4-bit Up Counter
    up_counter_4_bit uut (
        .q(q),
        .clk(clk),
        .rst(rst)
    );

    // Clock Generation (50MHz => 20ns period)
    always #10 clk = ~clk;

    // Test Sequence
    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        #25;  // Hold reset for 25ns

        rst = 0;  // Release reset

        #200;  // Run simulation for 200ns

        $finish;  // End simulation
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | clk=%b | rst=%b | q=%b", $time, clk, rst, q);
    end

endmodule
