module register(clk,clrn,din,dout);
input clk,clrn;
input [7:0]din;
output [7:0]dout;

reg [7:0]dout;

always @(posedge clk or negedge clrn)//为什么一个是上升沿一个是下降沿？
if(clrn==0)
begin
dout<=8'd0;//为啥是十进制?
end
else begin
dout<=din;
end

endmodule