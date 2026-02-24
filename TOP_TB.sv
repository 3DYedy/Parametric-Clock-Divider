`timescale 1ns / 1ps

module TB_TOP();
    logic clk;
    logic reset;
    logic out;

    TOP dut (
        .clk(clk),
        .reset(reset),
        .out(out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;  
        #10 reset = 0;
        #500;     
        $finish;
    end
endmodule
