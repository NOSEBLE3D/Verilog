`timescale 1ns / 1ps

module TB_Example_IP;

reg A,B,C,D;
wire E,F;

Example_IP dut(.E(E),.F(F),.A(A),.B(B),.C(C),.D(D));

initial begin
    A = 0; B = 0; C = 0; D = 0;
    #10;
    A = 0; B = 0; C = 0; D = 1;
    #10;
    A = 0; B = 0; C = 1; D = 0;
    #10;
    A = 0; B = 0; C = 1; D = 1;
    #10;
    A = 0; B = 1; C = 0; D = 0;
    #10;
    A = 0; B = 1; C = 0; D = 1;
    #10;
    A = 0; B = 1; C = 1; D = 0;
    #10;
    A = 0; B = 1; C = 1; D = 1;
    #10;
    A = 1; B = 0; C = 0; D = 0;
    #10;
    A = 1; B = 0; C = 0; D = 1;
    #10;
    A = 1; B = 0; C = 1; D = 0;
    #10;
    A = 1; B = 0; C = 1; D = 1;
    #10;
    A = 1; B = 1; C = 0; D = 0;
    #10;
    A = 1; B = 1; C = 0; D = 1;
    #10;
    A = 1; B = 1; C = 1; D = 0;
    #10;
    A = 1; B = 1; C = 1; D = 1;
    #10;
    $stop;
end

endmodule