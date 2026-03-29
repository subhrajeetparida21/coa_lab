module async_cnt(
    input clk,rst,output reg [3:0] count
);
always @(negedge clk or posedge rst)
if(rst)
count<=4'b0000;
else count<=count+1;
endmodule

module testbench();
reg clk,rst;
wire [3:0] count;

always #10 clk=~clk;

async_cnt as(
    .clk(clk),
    .rst(rst),
    .count(count)
);

initial begin

clk=0;
rst=1;
#20 rst=0;
#300 $finish;
end

initial begin
$monitor("Time: %0t, clk: %b, count: %b",$time,clk,count);
end
endmodule
