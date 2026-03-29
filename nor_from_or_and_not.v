module or_gate(input a,b,output y);
assign y=a|b;
endmodule

module not_gate(input a,output y);
assign y=~a;
endmodule

module nor_gate(input a,b, output y);
wire w0;
or_gate x4(.a(a),.b(b),.y(w0));
not_gate b4(.a(w0),.y(y));
endmodule

module tb();
reg a,b;
wire nor_y;

nor_gate u1(.a(a),.b(b),.y(nor_y));

initial begin
$monitor("a:%b,b:%b,y:%b",a,b,nor_y);

a=0;b=0;#10;
a=1;b=0;#10;

$finish;
end
endmodule
