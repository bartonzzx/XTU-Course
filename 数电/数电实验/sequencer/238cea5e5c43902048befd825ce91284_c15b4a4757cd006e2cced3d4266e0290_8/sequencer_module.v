module sequencer_module(clk,clrn,din,ds);
input [7:0]din;
input clk,clrn;
output ds;
wire [2:0]count;

counter cnt(clk,clrn,count);
mux81 mux81_1(count,din,ds);

endmodule