module  tf_ctrl_test(clk,enb,lock,clr);
     input  clk;
     output  enb,lock,clr;
     
      reg     enb,lock,clr;
      reg  [3:0]count;		

initial  begin  enb=0;lock=0;clr=0;count=0;end

always @(posedge clk)
	// 请在下面添加代码，完成测频时序控制电路
	/* Begin */
	begin	
		count<=count+4'b0001;
		if (count<=7)
			begin enb<=1;clr<=0;lock<=0;end
		else if (count==9)
			begin enb<=0;clr<=0;lock<=1;end
		else if (count==13)
			begin enb<=0;clr<=1;lock<=0;end
		else if (count==15)
			begin enb<=0;clr<=0;lock<=0;count<=0;end
		else 
			begin enb<=0;clr<=0;lock<=0;end
	end	
	
	/* End */
endmodule
