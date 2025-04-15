
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2025 19:34:00
// Design Name: 
// Module Name: loaded_counter
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


`timescale 1ns / 1ps

module loaded_up_counter (
    input clk,
    input rst,
    input en,
    input load,         // Load signal
    input [3:0] load_value, // Value to load
    output reg [3:0] count
);

always @(posedge clk or posedge rst) begin
    if (rst)
        count <= 4'b0000;  // Reset counter to 0
    else if (load)
        count <= load_value;  // Load specific value
    else if (en)
        count <= count + 1;  // Increment when enabled
    else
        count <= count;
end

endmodule
