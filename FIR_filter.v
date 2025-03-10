module FIR_filter(clk, reset, data_in, data_out);

    parameter N = 16;
    input clk, reset;
    input [N-1:0] data_in;
    output reg [N-1:0] data_out; 

    wire [5:0] b0 =  6'b100000; 
    wire [5:0] b1 =  6'b100000; 
    wire [5:0] b2 =  6'b100000; 
    wire [5:0] b3 =  6'b100000;
    wire [N-1:0] x1, x2, x3; 

    DFF DFF0(clk, 0, data_in, x1);
    DFF DFF1(clk, 0, x1, x2);
    DFF DFF2(clk, 0, x2, x3);

    wire [N-1:0] Mul0, Mul1, Mul2, Mul3;  
    assign Mul0 = data_in * b0; 
    assign Mul1 = x1 * b1;  
    assign Mul2 = x2 * b2;  
    assign Mul3 = x3 * b3;  
    
    wire [N-1:0] Add_final; 
    assign Add_final = Mul0 + Mul1 + Mul2 + Mul3; 

    always@(posedge clk)
    data_out <= Add_final; 

endmodule


module DFF(clk, reset, data_in, data_delayed);
    parameter N = 16;
    input clk, reset;
    input [N-1:0] data_in;
    output reg [N-1:0] data_delayed; 

    always@(posedge clk, posedge reset)
    begin
        if (reset)
        data_delayed <= 0;
        else
        data_delayed <= data_in; 
        
    end

endmodule