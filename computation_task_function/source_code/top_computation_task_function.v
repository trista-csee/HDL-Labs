`timescale 1ns / 1ps

`define USE_TASK // use task , comment out to use function

module top_computation_task_function(i_1,i_2,mul_sum,carryout);
  input [15:0] i_1,i_2;
  output reg [31:0] mul_sum;
  output reg carryout;
  
  `ifdef USE_TASK
  `include "computation_task.v"
  always @ (*)
 	computation_task(i_1,i_2,mul_sum,carryout);
  `else
  `include "computation_function.v"
  always @(*)
    {carryout,mul_sum} = computation_function(i_1,i_2);
  `endif

endmodule