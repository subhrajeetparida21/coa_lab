module mux_4to1(
    input i0, i1, i2, i3,    // 4 Data inputs
    input [1:0] sel,         // 2 Selection lines (sel[1] and sel[0])
    output reg y             // 'reg' because it's inside an 'always' block
);

    always @(*) begin
        case (sel)
            2'b00: y = i0;   // If sel is 00, output is i0
            2'b01: y = i1;   // If sel is 01, output is i1
            2'b10: y = i2;   // If sel is 10, output is i2
            2'b11: y = i3;   // If sel is 11, output is i3
            default: y = 1'b0;
        endcase
    end

endmodule


module tb_mux4;
    reg i0, i1, i2, i3;
    reg [1:0] sel;
    wire y;

    // Instantiate the MUX
    mux_4to1 dut (i0, i1, i2, i3, sel, y);

    initial begin
        $monitor("Sel=%b | Inputs: i0=%b, i1=%b, i2=%b, i3=%b | Output y=%b", sel, i0, i1, i2, i3, y);
        
        // Setup some data on inputs
        i0=1; i1=0; i2=1; i3=0;

        sel = 2'b00; #10; // Should pick i0 (1)
        sel = 2'b01; #10; // Should pick i1 (0)
        sel = 2'b10; #10; // Should pick i2 (1)
        sel = 2'b11; #10; // Should pick i3 (0)
        
        $finish;
    end
endmodule