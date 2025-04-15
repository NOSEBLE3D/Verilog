This module implements a basic synchronous FIFO (First-In-First-Out) buffer using Verilog. Designed to work with 8-bit data and an 8-entry buffer depth, the FIFO handles simple data queuing operations in a clocked environment.

**Features:**
Synchronous Operation: All operations are triggered on the positive edge of the clock.

Read/Write Control: Supports independent read (rd_en) and write (wr_en) enable signals.

8x8 Buffer Storage: 8-bit wide, 8-depth memory (buf_mem) to store incoming data.

**Status Indicators:**

buf_empty, buf_full: Indicate FIFO state.

fifo_counter: Tracks current number of stored elements.

overflow, underflow: Asserted when attempting invalid write/read operations.

**Design Notes:**
Overflow occurs when a write is attempted while the FIFO is full.

Underflow occurs when a read is attempted while the FIFO is empty.

Uses simple pointer-based indexing (wr_ptr, rd_ptr) for circular queue behavior.

This FIFO design is ideal for basic buffering needs and is a great reference for learning how to implement flow control in digital systems.
