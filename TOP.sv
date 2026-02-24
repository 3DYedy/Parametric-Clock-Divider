`timescale 1ns / 1ps

module TOP(
    input logic clk,
    input logic reset,
    output logic out 
);
    
    logic [29:0] count;
    logic out_comp;
    logic internal_reset;
    
    assign internal_reset = reset | out_comp;
    
    numarator num 
    (
        .clock(clk),
        .reset(internal_reset), 
        .out(count)
    );
    
    comparator #(.Limit(9)) comp 
    (
        .in1(count),
        .out(out_comp)
    );
    
    toggle_ff tff (
        .clk(clk),    
        .reset(reset),
        .en(out_comp),  
        .out(out)
    );
    
endmodule

module comparator 
#(parameter Limit = 30)
(
    input logic [29:0] in1,
    output logic out
);

    assign out = (in1 >= Limit) ? 1'b1 : 1'b0;

endmodule


module numarator
(
    input logic clock,
    input logic reset,
    output logic [29:0] out  
);

    always_ff @(posedge clock) begin
        if(reset == 1)
            out <= 0;
        else
            out <= out + 1;  
    end

endmodule


module toggle_ff (
    input logic clk,   
    input logic reset,
    input logic en,     
    output logic out
);
    always_ff @(posedge clk) begin
        if (reset == 1)
            out <= 1'b0;
        else if (en)   
            out <= ~out; 
    end
endmodule
