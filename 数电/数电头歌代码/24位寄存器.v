module latch24_test( d, clk,q );
	// 请在下面添加代码，完成24位寄存器
	/* Begin */
    input [23:0] d;
    input clk;
    output [23:0] q;
    reg [23:0] q;
always @ (posedge clk)
begin
q = d;
end
	/* End */
endmodule
