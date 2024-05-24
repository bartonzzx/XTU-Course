module counter6bit_test(ENA,CLR,F_IN,Q);
    input ENA;
    input CLR;
    input F_IN;
    output [23:0] Q;  
    
   
    reg [23:0] Q;
    reg F_OUT;
    
/*请在下面添加代码，完成6位十进制计数器*/
		/* Begin */
        always @ (posedge F_IN)
        begin
        if(CLR == 1)
        Q = 0;
        else if(ENA == 1)
        begin
        if(Q[3:0] != 4'b1001)
        Q = Q + 1;
        else
        Q = Q + 7;
        end
        else 
        Q = Q;
        end


		/* End */
  endmodule