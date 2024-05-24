module shifter_display( 
input clk,
input resetn,    
input [1:0]input_sel,
input clock,
output [7:0]dout,
output lcd_rst,
output lcd_cs,
output lcd_rs,
output lcd_wr,
output lcd_rd,
inout [15:0]lcd_data_io,
output lcd_bl_ctr,
inout ct_int,
inout ct_sda,
output ct_scl,
output ct_rstn);
reg [7:0]din;
reg [1:0]s;
reg slsi,srsi;
shifter shifter_module(.din(din),.s(s),.srsi(srsi),.slsi(slsi),.clk(clock),.clrn(resetn),.dout(dout));
reg display_valid;
reg [39:0]display_name;
reg [31:0]display_value;
wire [5:0]display_number;
wire input_valid;
wire [31:0]input_value;
lcd_module lcd_module(
.clk (clk),
.resetn (resetn),
.display_valid (display_valid),
.display_name (display_name),
.display_value (display_value),
.display_number (display_number),
.input_valid (input_valid),
.input_value (input_value),
.lcd_rst (lcd_rst),
.lcd_cs (lcd_cs),
.lcd_rs (lcd_rs),
.lcd_wr (lcd_wr),
.lcd_rd (lcd_rd),
.lcd_data_io (lcd_data_io),
.lcd_bl_ctr (lcd_bl_ctr),
.ct_int (ct_int), 
.ct_sda (ct_sda),
.ct_scl (ct_scl),
.ct_rstn (ct_rstn));
always@(posedge clk)
begin
if(!resetn)
begin
din <= 4'd0;
end
else if(input_valid&&input_sel==2'b00)
begin
din <= input_value[7:0];
end
end

always @(posedge clk)
begin
if(!resetn)
begin
s <= 32'd0;
end
else if(input_valid&&input_sel==2'b11)
begin
s <= input_value[1:0];
end
end
always @(posedge clk)
begin
if(!resetn)
begin
slsi <= 32'd0;
end
else if(input_valid&&input_sel==2'b01)
begin
slsi <= input_value[0];
end
end
always @(posedge clk)
begin
if(!resetn)
begin
srsi <= 32'd0;
end
else if(input_valid&&input_sel==2'b10)
begin
srsi <= input_value[0];
end
end
always @(posedge clk)
begin
case(display_number)
6'd1:
begin
     display_valid <= 1'b1;
     display_name  <="CLRN";
     display_value <=resetn;
end
6'd2:
begin
display_valid <= 1'b1;
display_name <="DIN";
display_value <={24'b0,din};
end
6'd3:
begin
display_valid <= 1'b1;
display_name <="S";
display_value <={30'b0,s};
end
6'd4:
begin
display_valid <= 1'b1;
display_name  <="SRSI";
display_value <=srsi;
end
6'd5:
begin
display_valid <= 1'b1;
display_name  <="SLSI";
display_value <=slsi;
end
6'd6:
begin
display_valid <= 1'b1;
display_name  <="DOUT";
display_value <={24'b0,dout};
end
default:
begin
display_valid <= 1'b0;
display_name  <= 40'd0;
display_value <= 32'd0;
end
endcase
end
endmodule