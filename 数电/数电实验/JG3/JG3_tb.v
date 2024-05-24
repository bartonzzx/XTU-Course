`include"JG3.v"
module JG3_tb;
reg [2:0]ABC;
wire X;
wire Y;
integer i;
initial begin
i=7;ABC=3'b000;
#0 $display("time\tABC\tX\tY");
while(i>0) begin
#1 ABC=ABC+3'b001;
 i=i-1;
  end
end
JG3 m(.ABC(ABC),.X(X),.Y(Y));
initial begin
    $dumpfile("test.vcd");
    $dumpvars;
    $monitor("%g\t %b %b %b",$time,ABC,X,Y);
    #60 $finish;
end
endmodule
