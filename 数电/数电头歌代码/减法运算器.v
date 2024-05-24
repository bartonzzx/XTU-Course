module substractor(a,b,cin,cout,sum);
  parameter bit_width=8;
  output[bit_width-1:0] sum;
  output cout;
  input [bit_width-1:0] a,b;
  input cin;//carry
// 请在下面添加代码，完成n位的无符号二进制数减法器功能
/* Begin */
assign {cout,sum} = a-b-cin;
/* End */
endmodule
