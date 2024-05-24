 module dffe32(d,clk,clrn,e,q);
    input [31:0] d;
    input clk,clrn,e;
    output [31:0] q;
   //begin
    reg q = 0;
    always @ (posedge clk)
    begin
     if(clrn == 0)
     q = 0;
     else if(e == 1)
     q = d;
     end
    //end
endmodule