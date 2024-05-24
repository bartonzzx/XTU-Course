module sequencer(clk,clrn,din,ds,dout);
input clk,clrn;
input [7:0]din;
output [7:0]dout;
output ds;

register rgs(clk,clrn,din,dout);
sequencer_module seq_1(clk,clrn,din,ds);

endmodule