`include "sqdetector.v"
  module sqdetector_tb;
   reg clk,clrn,ds;
  reg [7:0] setd;
  wire [3:0] c;  
  wire  dc;
 
  sqdetector U(.ds(ds),.setd(setd),.clk(clk),.clrn(clrn),.dc(dc),.c(c));
 
 initial 
 begin
   ds=1;
   clrn=0;clk=0; setd=8'b10101010;
 #0 $display("time\tds\tsetd\tclk\tclrn\tdc\tc");
 #4 clrn=1;
 #40 setd=8'b01010101;
 #40 setd=8'b00110011;
 #40 setd=8'b11001100;
 #40 setd=8'b11001101;
 #40 setd=8'b10100101;
 end
 always #2 clk=~clk;
 always #4 ds=~ds;
 endmodule    
   