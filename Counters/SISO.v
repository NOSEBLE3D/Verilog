module siso#(parameter WIDTH = 4)(q,clk,rst,data_in);

input clk, rst, data_in;
output reg q;

reg [WIDTH-1:0] siso_reg;

always@(posedge clk or posedge rst)begin
    if(rst)
        siso_reg <= 4'b0000;
    else begin 
        q <= siso_reg[3];
        siso_reg <= {siso_reg[2:0],data_in};
        end
        
end
endmodule