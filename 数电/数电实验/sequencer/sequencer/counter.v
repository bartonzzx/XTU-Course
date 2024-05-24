module counter(clk,clrn,count);
input clk,clrn;
output [2:0] count;
reg [2:0] count;
always@(posedge clk or negedge clrn)
begin
if(!clrn)
begin
count<=3'd0;
end
else
begin 
count<= count +1;
end
end

endmodule
