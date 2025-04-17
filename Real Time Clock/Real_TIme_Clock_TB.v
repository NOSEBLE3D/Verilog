module up_downcount_tb();
reg clk, rst,en;

wire [3:0] Counts9, Counts5, Countm9, Countm5, Counth9, Counth2;
wire [6:0]hour2,hour1,minute2,minute1,second2,second1;
initial begin
$monitor("time=%t | counth2=%b | counth9 =%b | countm5=%b | countm9=%b | counts5=%b | counts9=%b /t hour2%b | hour1=%b | minute2=%b | miunte1=%b | second2=%b | second1=%b "
,$time,Counth2,Counth9,Countm5,Countm9,Counts5,Counts9,hour2,hour1,minute2,minute1,second2,second1);
end
// Instantiating the seconds counters
Up_count #(9,4) SecL(.clk(clk), .rst(rst), .en(en), .Count(Counts9)); // Second lower
wire SM_en, ML_en, MM_en, HL_en;
assign SM_en = (Counts9 == 4'b1001);

Up_count #(5,4) SecM(.clk(clk), .rst(rst), .en(SM_en), .Count(Counts5)); // Second upper
assign ML_en = (Counts5 == 4'b0101 && Counts9 == 4'b1001);

// Instantiating the minutes counters
Up_count #(9,4) MinL(.clk(clk), .rst(rst), .en(ML_en), .Count(Countm9)); // Minute lower
assign MM_en = (Countm9 == 4'b1001 && Counts5 == 4'b0101 && Counts9 == 4'b1001);

Up_count #(5,4) MinM(.clk(clk), .rst(rst), .en(MM_en), .Count(Countm5)); // Minute upper
assign HL_en = (Countm5 == 4'b0101 && Countm9 == 4'b1001 && Counts5 == 4'b0101 && Counts9 == 4'b1001);

// Instantiating the hours counters
Up_count #(9,4) HourL(.clk(clk), .rst(rst), .en(HL_en), .Count(Counth9)); // Hour lower
wire HM_en;
assign HM_en = (Counth9 == 4'b1001 && Countm5 == 4'b0101 && Countm9 == 4'b1001 && Counts5 == 4'b0101 && Counts9 == 4'b1001);

Up_count #(3,4) HourM(.clk(clk), .rst(rst), .en(HM_en), .Count(Counth2)); // Hour upper




BCD_to_7seg s1(.bcd(Counts9),.seg(second1));
BCD_to_7seg s2(.bcd(Counts5),.seg(second2));
BCD_to_7seg s3(.bcd(Countm9),.seg(minute1));
BCD_to_7seg s4(.bcd(Countm5),.seg(minute2));
BCD_to_7seg s5(.bcd(Counth9),.seg(hour1));
BCD_to_7seg s6(.bcd(Counth2),.seg(hour2));

initial
begin
  clk=0;
  forever #5 clk=~clk;
  
end

initial
begin
  rst=1'b0;
  #10
  rst=1'b1;
  en=1'b1;
 
end
endmodule

