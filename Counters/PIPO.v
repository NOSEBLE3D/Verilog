`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2025 21:48:57
// Design Name: 
// Module Name: PIPO
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


module pipo#(parameter WIDTH = 4)(q,clk,rst,din);

input clk,rst;
input [WIDTH-1:0] din;
output reg [WIDTH-1:0]q;

always@(posedge clk or posedge rst)begin
    if(rst)
        q <= 4'b0000;
    else
        q <= din;
    end

endmodule