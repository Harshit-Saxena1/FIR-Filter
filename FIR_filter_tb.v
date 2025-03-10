`timescale 1ns / 1ps
`include "FIR_filter.v"

module FIR_filter_tb; 

parameter N = 16;
reg clk, reset;
reg [N-1:0] data_in;
wire [N-1:0] data_out; 

FIR_filter uut(clk, reset, data_in, data_out);

reg [N-1:0] mem[31:0]; // Declare memory array

initial begin
    $dumpfile("FIR_filter_tb.vcd");
    $dumpvars(0, FIR_filter_tb);
    $readmemb("signalinfo.data", mem); // Read memory data from file
end

initial begin
    clk = 0;
    reset = 0;  // Initialize reset signal to 0 (no reset)
    forever #10 clk = ~clk; // Clock generation with a period of 20ns
end

reg [4:0] Address;

initial begin
    Address = 1; 
end

always @(posedge clk) begin
    data_in <= mem[Address]; // Assign data from memory to input
    if (Address == 31)
        Address = 0; 
    else
        Address = Address + 1; 
end 

endmodule