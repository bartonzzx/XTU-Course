module shifter(din,s,srsi,slsi,clk,clrn,dout); 
	input clrn,clk,srsi,slsi;  
	input [7:0]din;
	input [1:0]s;
	output [7:0]dout;     
	reg [7:0]dout;        
	always @ (negedge clrn or posedge clk)
		begin
		  if(clrn==1'b0) dout <= 8'b00000000;   
		  else 
		  case(s)
			2'b00:dout<=dout;
			2'b01: begin dout<=(dout<<1); dout[0]<=slsi; end
			2'b10: begin dout<=(dout>>1); dout[7]<=srsi; end
			2'b11:dout<=din;
			default:dout<=dout;
		  endcase
		end
endmodule