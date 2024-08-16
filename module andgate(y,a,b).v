//and gate and itz testbench
module andgate(y,a,b)
input a,b;
output y;
assign y = a & b;
endmodule
module AND_GATE_TB;
wire t_y;
reg t_a,t_b;
andgate MY_GATE(.y(t_y),.a(t_a),.b(t_b));
initial
begin
$monitor (t_y,t_a,t_b);
t_a = 1'b0;
t_b = 1'b0;

#5
t_a = 1'b1;
t_b = 1'b0;

#5
t_a = 1'b0;
t_b = 1'b1;

#5
t_a = 1'b1;
t_b = 1'b1;

end
endmodule