module detected_test(ds,setd,clk,clrn,dc,c);
 input ds,clk,clrn; 
 input [7:0] setd;
 output [3:0] c;  
 output  dc;
 
// 请在下面添加代码，完成序列检测器
/********* Begin *********/
 reg [3:0] c; 
   
 parameter s0=4'b0000,s1=4'b0001,s2=4'b0010,s3=4'b0011,
            s4=4'b0100,s5=4'b0101,s6=4'b0110,s7=4'b0111,s8=4'b1000;
	
 always@(posedge clk or negedge clrn)

 begin
 if(!clrn)
   c<=s0;
 else
   case(c)
     s0:if(ds==setd[7])c<=s1;else c<=s0;       
     s1:if(ds==setd[6])c<=s2;else c<=s0;       
     s2:if(ds==setd[5])c<=s3;else c<=s0;      
     s3:if(ds==setd[4])c<=s4;else c<=s0;        
     s4:if(ds==setd[3])c<=s5;else c<=s0;    
     s5:if(ds==setd[2])c<=s6;else c<=s0;
     s6:if(ds==setd[1])c<=s7;else c<=s0;
     s7:if(ds==setd[0])c<=s8;else c<=s0;   
     default:c<=s0;
   endcase
   end

assign dc=(c==s8)?1:0;
/* End */	
endmodule