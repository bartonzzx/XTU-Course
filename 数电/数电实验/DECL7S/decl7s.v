module decl7s(num,numl_scan_select,numl_seg7);
input [3:0]num;
output [1:0]numl_scan_select;
output [7:0]numl_seg7;
reg [7:0]numl_seg7;
wire [1:0]numl_scan_select;
assign numl_scan_select=2'b10;
always@(num)
case(num)
4'b0000:numl_seg7<=8'b01111110;
4'b0001:numl_seg7<=8'b00110000;
4'b0010:numl_seg7<=8'b01101101;
4'b0011:numl_seg7<=8'b01111001;
4'b0100:numl_seg7<=8'b00110011;
4'b0101:numl_seg7<=8'b01011011;
4'b0110:numl_seg7<=8'b01011111;
4'b0111:numl_seg7<=8'b01110000;
4'b1000:numl_seg7<=8'b01111111;
4'b1001:numl_seg7<=8'b01111011;
4'b1010:numl_seg7<=8'b01110111; 
4'b1011:numl_seg7<=8'b00011111; 
4'b1100:numl_seg7<=8'b01001110; 
4'b1101:numl_seg7<=8'b00111101; 
4'b1110:numl_seg7<=8'b01001111; 
4'b1111:numl_seg7<=8'b01000111; 
default:numl_seg7<=8'b01111110; 
endcase
endmodule
