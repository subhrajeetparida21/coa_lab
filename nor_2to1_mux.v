module mux_2to1( 
    input a, b, sel, 
    output y 
); 
    assign y = (sel) ? b : a; 
endmodule 

module nor_from_mux(
    input a, b,
    output y
);
    
    
    mux_2to1 my_mux (
        .a(~b),   
        .b(1'b0), 
        .sel(a), 
        .y(y)     
    );
endmodule


module tb_nor_mux;
    reg a, b;
    wire y;

    nor_from_mux dut (.a(a), .b(b), .y(y));

    initial begin
        $monitor("A=%b B=%b | NOR_Output=%b", a, b, y);
        
        a=0; b=0; #10;
        a=0; b=1; #10;
        a=1; b=0; #10;
        a=1; b=1; #10;
        
        $finish;
    end
endmodule
