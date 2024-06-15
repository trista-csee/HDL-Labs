module nonblocking_blocking_tb;

reg clk;
reg rst_n;
reg d_in;
wire d_out_nonblocking;
wire d_out_blocking;

initial begin
   clk = 1'b0;
   rst_n = 1'b0;
   d_in = 1'b0;
   #5;
   rst_n = 1'b1;
   d_in = 1'b1;
   #100;
   $finish;
end

always #10 clk = ~clk;
 
nonblocking nonblocking_inst (
    .q4(d_out_nonblocking),		
    .d(d_in), 
	.rstn(rst_n),
    .clk(clk)
);

blocking blocking_inst (
    .q4(d_out_blocking), 
    .d(d_in), 
	.rstn(rst_n),	
    .clk(clk)
);
 
endmodule