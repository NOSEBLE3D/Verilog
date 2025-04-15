module tb_sifo;
parameter WIDTH = 4;
reg clk,rst,din;
wire [WIDTH-1:0]q;

sifo uut(.q(q),.clk(clk),.rst(rst),.din(din));

always #10 clk = ~clk;

initial begin 

clk = 0; rst = 1; din = 0;

#10 rst = 0;
#20 din = 1;
#20 din = 0;
#20 din = 1;
#20 din = 1;
#20 din = 0;
#20 din = 0;
#20 din = 1;
#20 din = 0;


#1000 $finish;
end

initial begin
        $monitor("Time = %0t | Din = %b | Q = %b", $time, din, q);
    end
    
endmodule