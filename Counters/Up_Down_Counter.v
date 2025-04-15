`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.02.2025 17:29:31
// Design Name: 
// Module Name: Up_Counter
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


module Up_Down_Counter(
input clk,
input rst,
input [3:0] data_in,
input up_down,
output reg [3:0] q
    );
    
//initial q = data_in;
always@(posedge clk or posedge rst) begin
    if(rst)
        q <= 0;
    else if(up_down)  // if up_down is 1 up_count else down_count
        q <= q+1;
    else
        //q = data_in;
        q <= q-1;
end
endmodule
