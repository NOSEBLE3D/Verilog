`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2025 20:28:17
// Design Name: 
// Module Name: FIFO
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


module FIFO(
    input clk, rst, wr_en, rd_en,
    input [7:0] buf_in,
    output reg [7:0] buf_out,
    output reg buf_empty, buf_full,
    output reg [3:0] fifo_counter,
    output reg overflow, underflow  // Added Overflow & Underflow Flags
);

    reg [2:0] rd_ptr, wr_ptr;
    reg [7:0] buf_mem[7:0];

    // Update status flags (buf_empty, buf_full, overflow, underflow)
    always @(fifo_counter or wr_en or rd_en) begin
        buf_empty = (fifo_counter == 0);
        buf_full = (fifo_counter == 8);
        overflow = (buf_full && wr_en);  // Overflow occurs when writing while full
        underflow = (buf_empty && rd_en); // Underflow occurs when reading while empty
    end

    always @(posedge clk or posedge rst) begin
        if (rst) 
            fifo_counter <= 0;
        else if (wr_en && !buf_full) 
            fifo_counter <= fifo_counter + 1;
        else if (rd_en && !buf_empty) 
            fifo_counter <= fifo_counter - 1;
    end

    always @(posedge clk or posedge rst) begin
        if (rst)
            begin
                buf_out <= 0;
                rd_ptr <= 0;
            end
        else if (rd_en && !buf_empty) begin
            buf_out <= buf_mem[rd_ptr];
            rd_ptr <= rd_ptr + 1;  // Increment read pointer
        end
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            wr_ptr <= 0;
          //  rd_ptr <= 0;
        end
        else if (wr_en && !buf_full) begin
            buf_mem[wr_ptr] <= buf_in;
            wr_ptr <= wr_ptr + 1;  // Increment write pointer
        end
    end

endmodule

