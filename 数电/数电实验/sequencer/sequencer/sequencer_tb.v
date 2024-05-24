`include "counter.v"
`include"mux81.v"
`include "sequencer_module.v"
`include "register.v"
module sequencer_tb;
parameter DATA_WIDTH=8;
//--------------Input Ports-----//
reg [DATA_WIDTH-1:0] din;
reg  clk,clrn;
//--------------output Ports---------//
wire  ds;
wire [DATA_WIDTH-1:0] dout;
initial begin
clk=1;
clrn=0;
din=8'b00001110;
#0 $display("time\tclk\tclrn\tdin\tds\tdout");
#4 clrn=1;
end
always #5 clk=~clk;
always #80 din=din+1;
sequencer m(clk,clrn,din,ds,dout);
endmodule
