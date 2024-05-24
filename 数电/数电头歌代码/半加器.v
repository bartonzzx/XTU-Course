//hadder_test.v
module hadder_test(a,b,cout,sum);
// 请在下面添加代码，完成一位半加器功能
/* Begin */
input a,b;
output cout,sum;
reg cout,sum;
always @ (*)
begin
sum = a ^ b;
cout = a * b;
end
/* End */
endmodule