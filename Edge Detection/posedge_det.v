`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.02.2025 20:26:27
// Design Name: 
// Module Name: posedge_det
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


module posedge_det(pos_det,din,clk);

input clk,din;
output pos_det;
reg q;

always@(posedge clk)begin
    q <= din;
end

assign pos_det = din & ~q;
endmodule
