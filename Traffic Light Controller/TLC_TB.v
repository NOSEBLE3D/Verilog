`timescale 1ns / 1ps

module tb_traffic_light_controller;

    // Inputs
    reg clk;
    reg rst;

    // Outputs
    wire [1:0] ns_light; // North-South traffic light
    wire [1:0] ew_light; // East-West traffic light

    // Instantiate the DUT
    traffic_light_controller uut (
        .clk(clk),
        .rst(rst),
        .ns_light(ns_light),
        .ew_light(ew_light)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk; // 10 ns clock period

    // Testbench sequence
    initial begin
        $display("Starting simulation...");
        $monitor("Time: %0t | pr_State: %0d | NS: %b | EW: %b", 
                 $time, uut.pr_state, ns_light, ew_light);

        rst = 1;
        #10;
        rst = 0;

        #500; // Let the simulation run for 200 ns
        $stop;
    end

endmodule

