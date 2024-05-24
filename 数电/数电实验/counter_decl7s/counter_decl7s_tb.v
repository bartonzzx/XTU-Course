`timescale 1ns/1ns
`include "counter.v"
`include "decl7s.v"
`include "counter_decl7s.v"
module conuter_decl7s_tb;
parameter bit_width=4;
reg clock,rst,ena;
wire [7:0]num1_seg7;
wire co;
wire [1:0]num1_scan_select;
initial begin
    clock<=0;rst<=1;ena<=0;
    #0 $display("time\tena\tclock\trst\tco\tnum1_scan_select\tnum1_seg7");
    #5 rst<=0;ena<=1;
    end
always #1 clock=~clock;
counter_decl7s cnt_decl7s(ena,clock,rst,co,num1_scan_select,num1_seg7);
endmodule