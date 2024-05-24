module fadder(a,b,cin,cout,sum);
       input a,b;
       input cin;
       output  sum;
       output cout;
        assign sum  = ((~a&b)|(a&~b))&~(cin)|~((~a&b)|(a&~b))&(cin);
        assign cout = a&b|a&cin|b&cin;
endmodule