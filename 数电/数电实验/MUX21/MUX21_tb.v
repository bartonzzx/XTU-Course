`include "MUX.v"
module MUX_tb;
reg s,a,b;
wire y;
initial 
begin
a=1'b0;b=1'b0;s=1'b0;
#0 $display("time\ta\tb\ts\ty");
end
always #20 s=~s;
always #1  a=~a;
always #4  b=~b;
MUX m(.a(a),.b(b),.s(s),.y(y));
initial begin
$dumpfile("test.vcd");  //这两行主要用来记录仿真结果，给gtkwave这个波形编辑工具使用。
        $dumpvars;        
        $monitor("%g\t%b\t%b\t%b\t%b",
                $time,a,b,s,y);//屏幕显示==printf(); 
    #100 $finish;      //结束时间 
end
endmodule
