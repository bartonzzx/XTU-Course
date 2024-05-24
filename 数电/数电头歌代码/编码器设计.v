//设计一个输入输出均为高电平有效的3位二进制优先编码器
//I[7]的优先权最高，I[0]的优先权最低
module encoder8_3_test(I,Y);
input [7:0] I;
output reg [2:0] Y;

// 请在下面添加代码,完成设计任务
/* Begin */
always @ (*)
begin
if(I[7] == 1)
Y = 3'b111;
else if(I[6] == 1)
Y = 3'b110;
else if(I[5] == 1)
Y = 3'b101;
else if(I[4] == 1)
Y = 3'b100;
else if(I[3] == 1)
Y = 3'b011;
else if(I[2] == 1)
Y = 3'b010;
else if(I[1] == 1)
Y = 3'b001;
else Y = 3'b000;
end
/* End */
endmodule

