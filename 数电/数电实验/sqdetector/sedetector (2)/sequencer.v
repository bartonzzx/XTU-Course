module sequencer(clk,clrn,din,ds);   
input [7:0] din;  
input clk,clrn;  
output ds;       
reg  ds;  
    

//3位二进制计数器
  reg [2:0] count;                             
   always @(posedge clk or negedge clrn)
   begin
      if ( !clrn )                              
         begin
            count <= 3'd0;
         end
      else 
         begin
            count <= count +1;               
         end 
   end

//8选1数据选择器
always @( posedge clk )
         case ( count )
            3'd0 : ds <= din[7];   //7
            3'd1 : ds <= din[6];   //6
            3'd2 : ds <= din[5];   //5
            3'd3 : ds <= din[4];   //4
            3'd4 : ds <= din[3];   //3
            3'd5 : ds <= din[2];   //2
            3'd6 : ds <= din[1];   //1
            3'd7 : ds <= din[0];   //0
            default:ds <=1'b0;
         endcase      
endmodule
