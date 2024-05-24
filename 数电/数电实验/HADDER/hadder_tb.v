`include "hadder.v"
module hadder_tb;
	wire cout;
	wire sum;
	reg a,b;
	integer i;
initial begin
	i=7;a=1'b0;b=1'b0;
	#0 $display("time\ta\tb\tsum\tcout");
	while(i>0) begin
	#1 a=~a;
	#2 b=~b;
	i=i-1;
	end
end
hadder m(.a(a),.b(b),.cout(cout),.sum(sum));
endmodule
