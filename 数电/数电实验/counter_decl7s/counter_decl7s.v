module counter_decl7s(ena,clock,rst,co,num1_scan_select,num1_seg7);
input ena,clock,rst;
output [7:0]num1_seg7;
output co;
output [1:0]num1_scan_select;
wire [3:0]outy;
counter counter(ena,clock,rst,co,outy);
decl7s decl7s(outy,num1_scan_select,num1_seg7);
endmodule