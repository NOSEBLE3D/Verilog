module tb_siso;
parameter WIDTH = 4;
reg clk,rst,data_in;
wire q;

siso uut(.q(q),.clk(clk),.rst(rst),.data_in(data_in));

always #5 clk = ~clk;

initial begin

clk = 0; rst = 1; data_in = 0;

#10 rst = 0;

#10 data_in = 1;
#10 data_in = 1;
#10 data_in = 0;
#10 data_in = 0;
#10 data_in = 1;
#10 data_in = 0;

#70 $finish;
end

initial begin
        $monitor("Time = %0t | Data_in = %b | Q = %b", $time, data_in, q);
    end
    
endmodule 