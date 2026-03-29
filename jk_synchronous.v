
module jk_ff(
    input j, k, clk, rst, 
    output reg q
);
    
    always @ (posedge clk or posedge rst) begin
        if(rst)
            q <= 1'b0;
        else if(j == 1'b1 && k == 1'b1) 
            q <= ~q;
        else if(j == 1'b0 && k == 1'b0)
            q <= q; 
    end
endmodule


module sync_counter(
    input clk, rst,
    output wire [3:0] count
);
    wire q0, q1, q2, q3;
    wire en1, en2;

    jk_ff u0 (.j(1'b1), .k(1'b1), .clk(clk), .rst(rst), .q(q0));
    jk_ff u1 (.j(q0),   .k(q0),   .clk(clk), .rst(rst), .q(q1));

    assign en1 = q0 & q1;
    jk_ff u2 (.j(en1),  .k(en1),  .clk(clk), .rst(rst), .q(q2));
    
    assign en2 = en1 & q2;
    jk_ff u3 (.j(en2),  .k(en2),  .clk(clk), .rst(rst), .q(q3));

    assign count = {q3, q2, q1, q0}; 
endmodule

module testbench();
    reg clk, rst;
    wire [3:0] count;

    sync_counter uut ( 
        .clk(clk), 
        .rst(rst), 
        .count(count) 
    ); 

    always #10 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;     // Start with Reset ON
        #20 rst = 0; // Turn Reset OFF
        #300 $finish;
    end 

    initial begin 
        $monitor("Time=%0t | Reset=%b | Count=%b (%d)", $time, rst, count, count); 
    end 
endmodule
