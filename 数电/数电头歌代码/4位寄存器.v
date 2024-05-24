module dff4_test(d,clk,clrn,q);
       // 请在下面添加代码，完成4位寄存器逻辑功能
		/************ Begin *************/
input [4:1]d;
input clk,clrn;
output [4:1]q;
reg q;
always @(posedge clk or negedge clrn)
if(clrn == 0)
q <= clrn;
else
begin
q <= d;
end
		/************ End **************/
endmodule
