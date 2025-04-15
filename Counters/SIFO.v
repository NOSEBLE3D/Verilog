`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2025 19:28:02
// Design Name: 
// Module Name: SIFO
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


module sifo#(parameter WIDTH = 4)(q,clk,rst,din);

input clk,rst,din;
output reg [WIDTH-1:0] q;

always@(posedge clk or posedge rst)begin
    if(rst)
        q <= 4'b0000;
    else
        q <= {q[WIDTH-2:0],din};
    end
endmodule