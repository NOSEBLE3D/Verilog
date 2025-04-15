`timescale 1ns / 1ps

module ring_counter (
    input clk,
    input rst,
    output reg [15:0] q
);
    
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 16'b0000_0000_0000_0001; // Initialize with only one '1'
        else
            q <= {q[14:0], q[15]}; // Shift left, wrapping around MSB to LSB
    end

endmodule