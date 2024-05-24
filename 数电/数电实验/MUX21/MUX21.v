module MUX(a,b,s,y);
input a,b,s;
output y;
reg y;
always@(a,b,s)
begin
if(s==1'b1) y<=b;
else  y<=a;
end
endmodule
