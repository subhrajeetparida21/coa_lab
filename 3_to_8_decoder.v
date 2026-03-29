module decoder_3to8(
    input [2:0] in,      // 3-bit input (can be 000 to 111)
    output reg [7:0] out // 8-bit output (one-hot)
);

    // This block triggers whenever the input 'in' changes
    always @(*) begin
        case (in)
            3'b000: out = 8'b00000001; // Decimal 0
            3'b001: out = 8'b00000010; // Decimal 1
            3'b010: out = 8'b00000100; // Decimal 2
            3'b011: out = 8'b00001000; // Decimal 3
            3'b100: out = 8'b00010000; // Decimal 4
            3'b101: out = 8'b00100000; // Decimal 5
            3'b110: out = 8'b01000000; // Decimal 6
            3'b111: out = 8'b10000000; // Decimal 7
            default: out = 8'b00000000;
        endcase
    end

endmodule

module tb_decoder;
    reg [2:0] t_in;
    wire [7:0] t_out;

    // Connect the decoder
    decoder_3to8 dut (.in(t_in), .out(t_out));

    initial begin
        $monitor("Input: %b | Output: %b", t_in, t_out);
        
        t_in = 3'b000; #10;
        t_in = 3'b011; #10;
        t_in = 3'b111; #10;
        
        $finish;
    end
endmodule
