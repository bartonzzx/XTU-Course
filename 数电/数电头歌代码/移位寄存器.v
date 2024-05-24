module shift_test(din,s,srsi,slsi,clk,clr,dout);
  input[7:0] din;
  input[1:0] s;
  input srsi,slsi,clk,clr;

  output [7:0] dout;
  reg [7:0] dout; 
  always@(posedge clk or negedge clr)  

// 请在下面添加代码，完成 8 位双向移位寄存器功能
/* Begin */
begin
		if(clr==1'b0)
		     dout<=8'b00000000;
	   else 
		case(s)
		2'b00:dout<=dout;
		2'b10:begin dout<=(dout<<1);dout[0]<=slsi;end
		2'b01:begin dout<=(dout>>1);dout[7]<=srsi;end
		2'b11:dout<=din;
		default:dout<=dout;
		endcase
end
/* End */
endmodule