module counter(en,clk,clr,cout,outy);
input en,clk,clr;
output [3:0]outy;
output cout;
reg [3:0]outy;
always @(posedge clk or posedge clr)
    begin
        if(clr)  outy<=4'b0000;
        else if(en)
            begin
            if(outy==4'b1111)    outy<=4'b0000;
            else  outy<=outy+1'b1;
            end
    end
    assign cout=((outy==4'b1111)&en)?1:0;
endmodule
     