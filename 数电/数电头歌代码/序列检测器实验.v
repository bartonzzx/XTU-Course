module sqdetector(ds,setd,clk,clrn,dc,c);
input ds,clk,clrn;
input[7:0] setd;
output[3:0] c;
output dc;

		/*begin*/
    reg [3:0] c; 
    reg dc;
    reg  [3:0] n;

    always @(c,setd,ds,n)
      case (c)
        4'b0000 : if(ds==setd[7]) begin n<=4'b0001; dc<=1'b0; end  else begin n<=4'b0000; dc<=1'b0; end
        4'b0001 : if(ds==setd[6]) begin n<=4'b0010; dc<=1'b0; end  else begin n<=4'b0000; dc<=1'b0; end
        4'b0010 : if(ds==setd[5]) begin n<=4'b0011; dc<=1'b0; end  else begin n<=4'b0000; dc<=1'b0; end
        4'b0011 : if(ds==setd[4]) begin n<=4'b0100; dc<=1'b0; end  else begin n<=4'b0000; dc<=1'b0; end
        4'b0100 : if(ds==setd[3]) begin n<=4'b0101; dc<=1'b0; end  else begin n<=4'b0000; dc<=1'b0; end
        4'b0101 : if(ds==setd[2]) begin n<=4'b0110; dc<=1'b0; end  else begin n<=4'b0000; dc<=1'b0; end
        4'b0110 : if(ds==setd[1]) begin n<=4'b0111; dc<=1'b0; end  else begin n<=4'b0000; dc<=1'b0; end
        4'b0111 : if(ds==setd[0]) begin n<=4'b0000; dc<=1'b1; end  else begin n<=4'b0000; dc<=1'b0; end
      default : begin n<=4'b0000; dc<=1'b0; end
      endcase

    always @(negedge clrn or posedge clk) 
        if (clrn==0)  c<=0;
         else  c<=n;
		
		/*end*/
		
endmodule