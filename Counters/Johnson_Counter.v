`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.02.2025 16:40:09
// Design Name: 
// Module Name: Johnson_Counter
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


module johnson_counter #(parameter WIDTH = 8) (
    input clk,
    input rst,
    output reg [WIDTH-1:0] q
);
    
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 8'b00000000;  
        else begin
            q <= {~q[0], q[WIDTH-1:1]};  
        end
    end
    
endmodule