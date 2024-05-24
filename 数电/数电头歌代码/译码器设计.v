//设计具有一位使能端的3线-8线译码器。当使能端为0时，8位输出信号全为0；
//如果一位使能信号为1,则输出高电平有效的译码信号。
module decoder3e_test(a,ena,y);
  input [3:1] a;
  input ena;
  output [7:0] y; 
  reg [7:0] y;
  // 请在下面添加代码,完成设计任务
/* Begin */
  always @ (ena or a) begin
       y=8'b0;
       y[a]=ena;
  end
/* End */
endmodule