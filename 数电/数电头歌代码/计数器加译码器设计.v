module counter_decl7s(ena,clock,rst,co,num1_scan_select,num1_seg7);
input ena,clock,rst;
output [7:0] num1_seg7;//FPGA_NUM1 7段数码管显示DP和a~g
output co;
output [1:0] num1_scan_select;//选择FPGA_NUM1 7段数码管的扫描位
wire [3:0]outy;

counter counter(ena,clock,rst,co,outy);
decl7s decl7s(outy,num1_scan_select,num1_seg7);

endmodule

module counter(en,clk,clr,cout,outy);
input en,clk,clr;
output [3:0]outy;
output cout;
reg [3:0]outy;
always @(posedge clk or posedge clr)
    begin
        if(clr)  outy<=4'b0000;
        else if(en)
            begin
            if(outy==4'b1111)    outy<=4'b0000;
            else  outy<=outy+1'b1;
            end
    end
    assign cout=((outy==4'b1111)&en)?1:0;
endmodule

module decl7s(num,num1_scan_select,num1_seg7);
input [3:0] num;
output [1:0] num1_scan_select;
output [7:0] num1_seg7;
reg [7:0] num1_seg7;
assign num1_scan_select=2'b10;
always@(num)
case(num)
4'b0000 : num1_seg7<=8'b01111110;//0
4'b0001 : num1_seg7<=8'b00110000;//1
4'b0010 : num1_seg7<=8'b01101101;//2
4'b0011 : num1_seg7<=8'b01111001;//3
4'b0100 : num1_seg7<=8'b00110011;//4
4'b0101 : num1_seg7<=8'b01011011;//5
4'b0110 : num1_seg7<=8'b01011111;//6
4'b0111 : num1_seg7<=8'b01110000;//7
4'b1000 : num1_seg7<=8'b01111111;//8
4'b1001 : num1_seg7<=8'b01111011;//9
4'b1010 : num1_seg7<=8'b01110111;//A
4'b1011 : num1_seg7<=8'b00011111;//b
4'b1100 : num1_seg7<=8'b01001110;//C
4'b1101 : num1_seg7<=8'b00111101;//d
4'b1110 : num1_seg7<=8'b01001111;//E
4'b1111 : num1_seg7<=8'b01000111;//F
default   : num1_seg7<=8'b00000000;//0
endcase
endmodule