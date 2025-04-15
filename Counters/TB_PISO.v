module tb_piso;

reg clk,rst,load;
reg [3:0]din;
wire q;

piso uut(.q(q),.clk(clk),.rst(rst),.load(load),.din(din));

always #5 clk = ~clk;

initial begin

clk = 0; rst = 1; load = 0; din = 4'b0000;

#10 rst = 0;
#5 load = 1;
 din = 4'b1001;
#10 load = 0;
#50 load = 1;
din = 4'b0101;
#10 load = 0;

#300 $finish;

end

 initial begin
        $monitor("Time = %0t | Load = %b | Din = %b | Q = %b", 
                 $time, load, din, q);
    end

endmodule