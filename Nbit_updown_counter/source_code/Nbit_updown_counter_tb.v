`timescale 1ns/1ps

module Nbit_updown_counter_tb;

parameter period = 10; // 10ns = 100MHz
parameter WIDTH = 5;
parameter MAXWIDTH = 1 << WIDTH;  // 2^WIDTH

reg clock,reset,updown;
wire [WIDTH-1:0] Count;
integer i,j;
                    
Nbit_updown_counter counter_inst(
    .Clk(clock), 
    .reset(reset), 
    .UpOrDown(updown), 
    .Count(Count)
);

always begin
   # (period / 2) clock = ~clock;
end

initial begin
    reset = 0;
    updown = 0;
    clock = 0;
    @(posedge clock) ;            
    reset = 1;
    @(posedge clock) ;    
    reset = 0;   

    updown = 1; // up counter
    for (i = 0; i < MAXWIDTH; i = i + 1) begin : upwait_blocks
      @(posedge clock);  // should count up and reach MAXWIDTH-1 and auto reset to 0
      $display("Block %0d triggered at time %0t", i, $time);
    end

    updown = 0; // down counter 
    for (j = 0; j < MAXWIDTH; j = j + 1) begin : downwait_blocks
      @(posedge clock);  // should count down reach 0 and auto reset to MAXWIDTH-1
      $display("Block %0d triggered at time %0t", j, $time);
    end

    $finish();
end 

endmodule