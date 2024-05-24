`include"counter.v"
`include"mux81.v"
`include"sequencer_module.v"
`include"sequencer.v" //不知道是不是填这�?

`include"register.v"
`timescale 1ns/1ns

module sequencer_tb;
parameter DATA_WIDTH=8;
reg [DATA_WIDTH-1:0] din;

wire [DATA_WIDTH-1:0] dout;
wire ds;
reg clk,clrn;

initial begin
clk=1;
clrn = 0;
din = 8'b00001110;//很奇怪的数字
#0 $display("time\tclk\tclrn\tdin\tds\tdout");
#4 clrn = 1;
end
always #5 clk=~clk;
always #80 din=din+1;
sequencer seq_1(.clk(clk),.clrn(clrn),.din(din),.ds(ds),.dout(dout));//还�塸�句什么哇�?

endmodule