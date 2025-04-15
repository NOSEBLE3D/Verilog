`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2025 21:26:46
// Design Name: 
// Module Name: PISO
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


module piso(q,clk,rst,din,load);

input clk,rst,load;
input [3:0] din;
output reg q;

reg [3:0] piso_reg;

always@(posedge clk or posedge rst or posedge load)begin
    if(rst)
        piso_reg <= 0;
    else if(load)
        piso_reg <= din;
    else begin
        q <= piso_reg[3];
        piso_reg <= {piso_reg[2:0],1'b0};
        end
end
 
endmodule
