module full_adder_mux(
    input a, b, cin,
    output sum, carry
);
    // Sum Logic using 4:1 MUX behavior
    // Select lines are {a, b}
    assign sum = (a==0 && b==0) ? cin :
                 (a==0 && b==1) ? ~cin :
                 (a==1 && b==0) ? ~cin : cin;

    // Carry Logic using 4:1 MUX behavior
    assign carry = (a==0 && b==0) ? 1'b0 :
                   (a==0 && b==1) ? cin :
                   (a==1 && b==0) ? cin : 1'b1;
endmodule


module tb_fa_mux;
    reg a, b, cin;
    wire s, cy;

    full_adder_mux dut (a, b, cin, s, cy);

    initial begin
        $monitor("A=%b B=%b Cin=%b | Sum=%b Carry=%b", a, b, cin, s, cy);
        
        // Test all 8 cases
        a=0; b=0; cin=0; #10;
        a=0; b=0; cin=1; #10;
        a=0; b=1; cin=0; #10;
        a=0; b=1; cin=1; #10;
        a=1; b=0; cin=0; #10;
        a=1; b=0; cin=1; #10;
        a=1; b=1; cin=0; #10;
        a=1; b=1; cin=1; #10;
        
        $finish;
    end
endmodule