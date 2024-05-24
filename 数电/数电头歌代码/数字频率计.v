module szplj_test(f_in, clk, q);
input clk, f_in;
output[23: 0] q;

wire[23: 0] d;
wire clr, enb, lock;

// 请在下面添加代码，完成数字频率计
/* Begin */
tf_ctrl tf_ctrl(clk, enb, lock, clr);
counter6bit counter6bit(enb, clr, f_in, d);
latch24 latch24(d, lock, q);
/* End */
endmodule

module tf_ctrl(clk, enb, lock, clr);
input clk;
output enb, lock, clr;

reg enb, lock, clr;
reg[3: 0] count;

initial begin enb = 0;
lock = 0;
clr = 0;
count = 0;
end

always @(posedge clk)
// 请在下面添加代码，完成测频时序控制电路
/* Begin */
begin
count <= count + 4 'b0001;
if (count <= 7)
  begin enb <= 1;
clr <= 0;
lock <= 0;
end
else if (count == 9)
  begin enb <= 0;
clr <= 0;
lock <= 1;
end
else if (count == 13)
  begin enb <= 0;
clr <= 1;
lock <= 0;
end
else if (count == 15)
  begin enb <= 0;
clr <= 0;
lock <= 0;
count <= 0;
end
else
  begin enb <= 0;
clr <= 0;
lock <= 0;
end
end
/* End */
endmodule

module counter6bit(ENA, CLR, F_IN, Q);
input ENA;
input CLR;
input F_IN;
output[23: 0] Q;

reg[23: 0] Q;
reg F_OUT;

always @(posedge F_IN)
begin
if (CLR == 1 'b1) 
  Q <= 24 'b0000_0000_0000_0000_0000_0000; 		  
  else if (ENA == 1 'b0)        
    Q[3: 0] <= Q[3: 0];

    else

    if (Q[3: 0] < 4 'b1001)       
      Q[3: 0] <= Q[3: 0] + 4 'b0001;

      else
        // 请在下面添加代码，完成6位十进制计数器
        /* Begin */
        begin
      Q[3: 0] <= 4 'b0000;
      if (Q[7: 4] < 4 'b1001)
        Q[7: 4] <= Q[7: 4] + 4 'b0001;
        else
          begin
        Q[7: 4] <= 4 'b0000;
        if (Q[11: 8] < 4 'b1001)
          Q[11: 8] <= Q[11: 8] + 4 'b0001;
          else
            begin
          Q[11: 8] <= 4 'b0000;
          if (Q[15: 12] < 4 'b1001)
            Q[15: 12] <= Q[15: 12] + 4 'b0001;
            else
              begin
            Q[15: 12] <= 4 'b0000;
            if (Q[19: 16] < 4 'b1001)
              Q[19: 16] <= Q[19: 16] + 4 'b0001;
              else
                begin
              Q[19: 16] <= 4 'b0000;
              if (Q[23: 20] < 4 'b1001)
                Q[23: 20] <= Q[23: 20] + 4 'b0001;
                else
                  Q[23: 20] <= 4 'b0000;

                end end end end end
                /* End */
                end endmodule

                module latch24(d, clk, q); output[23: 0] q; reg[23: 0] q; input[23: 0] d; input clk; always @(posedge clk)
                // 请在下面添加代码，完成24位寄存器
                /* Begin */
                q <= d;
                /* End */
                endmodule
