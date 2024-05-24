module fadder(a,b,cin,cout,sum);
output cout;
output sum;
input a,b,cin;
/*Begin*/
assign {cout,sum} = a + b + cin;


/*end*/
endmodule
