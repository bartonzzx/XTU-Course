module count_test(en,clk,clr,cout,outy);
input en,clk,clr;
output [3:0]outy;
output cout;
reg [3:0]outy;
reg cout = 0;
always @ (posedge clk or posedge clr)
// 请在下面添加代码，完成16 进制计数器功能
/* Begin */
begin
cout = 0;
if(clr == 1)
outy = 0;
else if(en == 1)
begin
if(outy[3:0] == 4'b1110)
begin
outy = outy + 1;
cout = 1;
end
else
outy = outy + 1;
end
end





/* End */
endmodule


