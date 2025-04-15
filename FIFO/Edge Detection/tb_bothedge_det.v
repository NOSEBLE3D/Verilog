module tb_bothedge_det();
reg clk,din;
wire pos_det;

bothedge_det uut(.clk(clk),.din(din),.pos_det(pos_det));

always #5 clk = ~clk;

initial begin
clk <= 0;
din <= 0;

#10 din <= 1;
#20 din <= 0;
#20 din <= 1;
#20 din <= 0;
#20 din <= 1;
#20 din <= 0;
#50 $finish;
end

endmodule