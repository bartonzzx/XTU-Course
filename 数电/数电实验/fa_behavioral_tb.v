`include "fa_behavioral.v"
module fa_behavioral_tb;
  
  reg  a,b;
  wire  s;
  wire co;
  reg ci;
// 请修改代码，对所有输入情况进行仿真，要求在命令窗口中显示的仿真结果顺序为：a b ci co s
  integer i;
  initial  begin
  i=7;a=1'b0;b=1'b0;ci=1'b0;
  #0 $display("time\ta\tb\tci\ts\tco");
  while(i>0) begin      
     #1 a=~a;      
     #2 b=~b;   
     #4 ci=~ci;
      i=i-1;
    end
  end  
  fa_behavioral m(.a(a),.b(b),.ci(ci),.s(s),.co(co)); 
  initial begin
         $dumpfile("test.vcd");
         $dumpvars;
         $monitor("%g\t %b %b %b %b %b",$time,a,b,ci,s,co);//display
         #60 $finish;
  end    
endmodule
