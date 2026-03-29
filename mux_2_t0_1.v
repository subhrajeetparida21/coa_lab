// The original MUX component
module mux_2to1( 
    input a, b, sel, 
    output y 
); 
    assign y = (sel) ? b : a; 
endmodule 

// Implementing NOR using the MUX
module nor_from_mux(
    input a, b,
    output y
);
    // Logic: 
    // If a=0, output is ~b
    // If a=1, output is 0
    
    mux_2to1 my_mux (
        .a(~b),   // Input 0 of MUX (selected when a is 0)
        .b(1'b0), // Input 1 of MUX (selected when a is 1)
        .sel(a),  // Control line
        .y(y)     // Final output
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