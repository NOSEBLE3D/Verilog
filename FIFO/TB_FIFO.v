`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2025 20:28:33
// Design Name: 
// Module Name: TB_FIFO
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////




module TB_FIFO;

    reg clk, rst, wr_en, rd_en;
    reg [7:0] buf_in;
    wire [7:0] buf_out;
    wire buf_empty, buf_full, overflow, underflow;  // Added new flags
    wire [3:0] fifo_counter;

    // Instantiate FIFO module
    FIFO uut (
        .clk(clk),
        .rst(rst),
        .buf_in(buf_in),
        .buf_out(buf_out),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .buf_empty(buf_empty),
        .buf_full(buf_full),
        .fifo_counter(fifo_counter),
        .overflow(overflow),   // Connect new overflow flag
        .underflow(underflow)  // Connect new underflow flag
    );

    // Clock Generation
    always #5 clk = ~clk; // 10ns clock period

    initial begin
        $dumpfile("TB_FIFO.vcd"); 
        $dumpvars(0, TB_FIFO);
        
        // Initialize
        clk = 0; rst = 1; wr_en = 0; rd_en = 0; buf_in = 8'h00;
        #20 rst = 0;  // Deassert reset

        // **WRITE PHASE**: Fill FIFO completely
        repeat (8) begin
            @(posedge clk);
            wr_en = 1;
            buf_in = buf_in + 8'h11;  // Writing sequential values (0x00, 0x11, 0x22, ...)
        end
        @(posedge clk);
        wr_en = 0;  // Stop writing
        
        // **OVERFLOW TEST**: Try to write when FIFO is full
        @(posedge clk);
        wr_en = 1;
        buf_in = 8'hFF;  // Write a dummy value
        @(posedge clk);
        wr_en = 0;

        // **READ PHASE**: Read all elements from FIFO
        repeat (2) @(posedge clk); // Small delay
        rd_en = 1;
        repeat (8) @(posedge clk); // Read all elements
        @(posedge clk);
        rd_en = 0;  // Stop reading

        // **UNDERFLOW TEST**: Try to read when FIFO is empty
        @(posedge clk);
        rd_en = 1;
        @(posedge clk);
        rd_en = 0;

        // **RESET IN MIDDLE OF OPERATION**
        #20 rst = 1; // Assert reset
        #10 rst = 0; // Deassert reset

        // Final write-read cycle to verify correct reset
        repeat (4) begin
            @(posedge clk);
            wr_en = 1;
            buf_in = buf_in + 8'h22;
        end
        @(posedge clk);
        wr_en = 0;

        repeat (4) @(posedge clk);
        rd_en = 1;
        repeat (4) @(posedge clk);
        rd_en = 0;

        #50 $finish;
    end

    // Monitor all important signals
    initial begin
        $monitor("Time=%0t | wr_en=%b rd_en=%b buf_in=%h buf_out=%h buf_empty=%b buf_full=%b overflow=%b underflow=%b fifo_counter=%d",
                 $time, wr_en, rd_en, buf_in, buf_out, buf_empty, buf_full, overflow, underflow, fifo_counter);
    end

endmodule
