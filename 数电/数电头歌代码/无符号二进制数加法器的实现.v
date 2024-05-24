module adder(a,b,cin,cout,sum);
  parameter bit_width=8;
  output[bit_width-1:0] sum;
  output cout;
  input [bit_width-1:0] a,b;
  input cin;
// 请在下面添加代码，完成n=8位的无符号二进制数加法器功能
/* Begin */
assign {cout,sum} = a + b + cin;
/* End */
endmodule
