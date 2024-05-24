module mux21(a,b,s,y);
	input a,b,s;
	output y;
	reg y;
	always @(a,b,s)
    // 请在下面添加代码，实现当选择信号S为0时选中a，为1时选中b;
        /********** Begin *********/
    if(s)
    y <= b;
    else
    y <= a;
        /********** End *********/
	
endmodule