`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2025 19:38:55
// Design Name: 
// Module Name: tb_loaded_counter
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




module tb_loaded_up_counter();

    reg clk, rst, en, load;
    reg [3:0] load_value;
    wire [3:0] count;

    // Instantiate the counter
    loaded_up_counter uut (
        .clk(clk),
        .rst(rst),
        .en(en),
        .load(load),
        .load_value(load_value),
        .count(count)
    );

    // Clock generation (100MHz -> 10ns period)
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0; rst = 1; en = 0; load = 0; load_value = 4'b0000;
        #10 rst = 0; // Deassert reset

        // Load value 5 into counter
        #10 load_value = 4'b0101; load = 1;
        #10 load = 0;

        // Enable counting upwards
        #10 en = 1;
        #50 en = 0; // Stop counting

        // Load value 10 into counter
        #10 load_value = 4'b1010; load = 1;
        #10 load = 0;

        // Enable counting
        #10 en = 1;
        #50 en = 0; // Stop counting

        // Load value 3 into counter
        #10 load_value = 4'b0011; load = 1;
        #10 load = 0;

        // Enable counting
        #10 en = 1;
        #100 en = 0; // Run longer

        // Reset counter
        #10 rst = 1;
        #10 rst = 0;

        #100 $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | Count=%0d | Load=%b | Enable=%b", $time, count, load, en);
    end

endmodule


