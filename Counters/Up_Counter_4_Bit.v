`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.01.2025 11:12:05
// Design Name: 
// Module Name: Up_Counter_4_Bit
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


module up_counter_4_bit (
    output reg [3:0] q,
    input clk,
    input rst
);
    
always @(posedge clk or posedge rst) begin
    if (rst) 
        q <= 4'b0000;  // Asynchronous reset
    else 
        q <= q + 1;
end

endmodule
                 