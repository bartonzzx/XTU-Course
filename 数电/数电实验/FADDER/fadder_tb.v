`include "fadder.v"
module fadder_tb;
	wire cout;
	wire sum;
	reg a,b;
	reg cin;
	integer i;
initial begin
	i=7;a=1'b0;b=1'b0;cin=1'b0;
	#0 $display("time\ta\tb\tcin\tsum\tcout");
	while(i>0) begin
	#1 a=~a;
	#2 b=~b;
	#4 cin=~cin;
	i=i-1;
	end
end
fadder m(.a(a),.b(b),.cin(cin),.cout(cout),.sum(sum));
endmodule
