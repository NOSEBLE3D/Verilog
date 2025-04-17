module Up_count #(parameter Max_Val=15, count_size=4)

                (input clk, rst, en,
                output reg [count_size-1:0]Count);
                
      always@(negedge clk)
      begin
        if(!rst)
          Count<=4'b0;
        else if(en)
             begin 
              if(Count==Max_Val)
                   Count<=4'b0000;
               else
                   Count<=Count+1;
             end
        else 
          Count<=Count;
      end
  endmodule
