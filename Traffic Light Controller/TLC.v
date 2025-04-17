module traffic_light_controller(
    input clk,
    input rst,
    output reg [1:0] ns_light, // North-South light
    output reg [1:0] ew_light  // East-West light
);
    
    parameter GREEN  = 2'b10; //2
    parameter YELLOW = 2'b01; //1
    parameter RED    = 2'b00; //0

    
    parameter S0 = 3'd0, S1 = 3'd1, S2 = 3'd2, S3 = 3'd3, S4 = 3'd4, S5 = 3'd5;

    reg [2:0] pr_state, next_state;
    reg [3:0] counter; 

    
    parameter DELAY_5SEC = 4'd5; 
    parameter DELAY_1SEC = 4'd1; 
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            pr_state <= S0;
            counter <= 0;
        end else begin
            if (counter == 0) begin
                pr_state <= next_state; 
                counter <= (next_state == S0 || next_state == S3) ? DELAY_5SEC : DELAY_1SEC; // Set delay
            end else begin
                counter <= counter - 1; 
            end
        end
    end

    
    always @(*) begin
        case (pr_state)
                                 //   N-S    E-W
            S0: next_state = S1; //    G      R
            S1: next_state = S2; //    Y      R
            S2: next_state = S3; //    R      R
            S3: next_state = S4; //    R      G
            S4: next_state = S5; //    R      Y
            S5: next_state = S0; //    R      R
            default: next_state = S0;
        endcase
    end

    // Output logic
    always @(*) begin

ns_light = RED;
ew_light = RED;
        case (pr_state)
            S0: begin ns_light = GREEN; ew_light = RED; end
            S1: begin ns_light = YELLOW; ew_light = RED; end
            S2: ;
            S3: begin ns_light = RED; ew_light = GREEN; end
            S4: begin ns_light = RED; ew_light = YELLOW; end
            S5: ;
            default:  ;
        endcase
    end
endmodule

