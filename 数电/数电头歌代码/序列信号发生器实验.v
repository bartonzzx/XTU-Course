module sequencer_module(clk,clrn,din,ds);   
input [7:0] din;  
input clk,clrn;  
output ds;       
wire [2:0]count;

counter cnt(clk,clrn,count);
mux81 mux81_1(count,din,ds);

endmodule

module register(clk,clrn,din,dout);
input clk,clrn;
input [7:0]din;
output [7:0]dout;

reg [7:0]dout;

always @(posedge clk or negedge clrn)//为什么一个是上升沿一个是下降沿？
if(clrn==0)
begin
dout<=8'd0;//为啥是十进制?
end
else begin
dout<=din;
end

endmodule

module sequencer(clk,clrn,din,ds);
input [7:0]din;
input clk,clrn;
output ds;
wire [2:0]count;

counter cnt(clk,clrn,count);
mux81 mux81_1(count,din,ds);

endmodule
module counter(clk,clrn,count);
input clk,clrn;
output [2:0]count;

reg [2:0]count;
always @(posedge clk or negedge clrn)
begin
if(!clrn)
begin
count<=3'd0;
end
else begin
count =count+1;
end
end

endmodule
module mux81(count,din,ds);
input [7:0]din;
input [2:0]count;
output ds;

reg ds;
always @(*)
case(count)
3'd0:ds<=din[0];
3'd1:ds<=din[1];
3'd2:ds<=din[2];
3'd3:ds<=din[3];
3'd4:ds<=din[4];
3'd5:ds<=din[5];
3'd6:ds<=din[6];
3'd7:ds<=din[7];

default:ds<=1'b0;
endcase

endmodule