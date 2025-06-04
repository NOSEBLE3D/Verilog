`timescale 1ns / 1ps

module Example_IP(E,F,A,B,C,D);

output E,F;
input A,B,C,D;

UDP udp(E,A,B,C);
and gate(F,E,D);

endmodule