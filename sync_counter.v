module sync_counter (
input clk, 
input rst, 
output reg [3:0] count 
);
always @(posedge clk or posedge rst) begin
if (rst)
count <= 4'b0000; 
else
count <= count + 1; 
end
endmodule

module sync_counter_tb;
reg clk, rst; 
wire [3:0] count; 

sync_counter uut (
.clk(clk),
.rst(rst),
.count(count)
);

always #10 clk = ~clk;
initial begin
// Initialize inputs
clk = 0;
rst = 1; 
#20 rst = 0; 

#300 $finish;
end


initial begin
$monitor("Time=%0t | Reset=%b | Count=%b", $time,
rst, count);
end
endmodule
