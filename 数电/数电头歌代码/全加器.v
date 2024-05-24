module fadder_test(a,b,ci,s,co);//考虑进位的加法器模块 
// 请在下面添加代码，完成一位全加器功能
/* Begin */
input a,b,ci;
output s,co;
reg s,co;
always @ (*)
begin
s = a ^ b ^ ci;
co = a * b + (a ^ b) * ci;
end
/* End */
endmodule