`timescale 1ns/1ns
`include"shifter.v"
module shifter_tb;
    parameter bit_width=8;
    reg srsi,slsi,clk,clrn;
    reg [1:0]s;
    reg [bit_width-1:0]din;
    wire [bit_width-1:0]dout;
    initial begin
        clk<=0; clrn<=1; din=8'b00001111; srsi=1; slsi=0; s<=3;
        #0 $display("time\tdin\ts\tsrsi\tslsi\tclk\tclrn\tdout");
        #1 clrn<=0; din=8'b00001101;
        #20 clrn<=1; s<=3;
        #20 s<=0;
        #20 s<=1;din=8'b10001101;
        #20 s<=2;din=8'b10011101;
        #20 s<=3;din=8'b11001101;
    end
    always #1 clk=~clk;
    shifter sft(din,s,srsi,slsi,clk,clrn,dout);
endmodule