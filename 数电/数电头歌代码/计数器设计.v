module counter(en,clk,clr,cout,outy);
input en,clk,clr;
output [3:0]outy;
output cout;
reg [3:0]outy = 0;
reg cout;
/*Begin*/
always @ (posedge clk or posedge clr)
begin
   cout = 0;
   if(clr == 1)
      outy = 0;
   else if(en == 1)
   begin
      outy = outy + 1;
      if(outy[3:0] == 4'b1111)
         cout = 1;
   end
end
/*end*/
endmodule