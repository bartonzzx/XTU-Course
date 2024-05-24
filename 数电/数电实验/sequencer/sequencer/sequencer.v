module sequencer(clk,clrn,din,ds,dout);
input clk,clrn;
input [7:0] din;
output [7:0] dout;
output ds;
//8位寄存器
register rgs(clk,clrn,din,dout);
//8位序列发生器
sequencer_module m(clk,clrn,din,ds);
endmodule
