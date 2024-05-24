`include"decl7s.v"
module decl7s_tb;
wire [1:0]numl_scan_select;
reg [3:0]num;
wire [7:0]numl_seg7;
integer i;
initial begin
i=16;num=4'b0000;
#0 $display("time\tnum\tnuml_seg7\tnuml_scan_select");
while(i>0) begin
#1 num=num+4'b0001;
i=i-1;
end
end
decl7s m(.num(num),.numl_seg7(numl_seg7),.numl_scan_select(numl_scan_select));
initial 
begin
$dumpfile("test.vcd");  
        $dumpvars;        
        $monitor("%g\t%b\t%b\t%b",
                $time,num,numl_seg7,numl_scan_select); 
    #60 $finish;   
end
endmodule