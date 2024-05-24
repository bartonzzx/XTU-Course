module decl7s_test(a,led7s);
      input [3:0] a;
      output [6:0] led7s;
      reg [6:0] led7s;
  always @(a)
// 请在下面添加代码，完成7段数码显示译码器显示
/* Begin */
case(a)
4'b0000:led7s<=7'b0111111;
4'b0001:led7s<=7'b0000110;
4'b0010:led7s<=7'b1011011;
4'b0011:led7s<=7'b1001111;
4'b0100:led7s<=7'b1100110;
4'b0101:led7s<=7'b1101101;
4'b0110:led7s<=7'b1111101;
4'b0111:led7s<=7'b0000111;
4'b1000:led7s<=7'b1111111;
4'b1001:led7s<=7'b1101111;
4'b1010:led7s<=7'b1110111; 
4'b1011:led7s<=7'b1111100; 
4'b1100:led7s<=7'b0111001; 
4'b1101:led7s<=7'b1011110; 
4'b1110:led7s<=7'b1111001; 
4'b1111:led7s<=7'b1110001; 
default:led7s<=7'b1111110; 
endcase
/* End */
endmodule    
       