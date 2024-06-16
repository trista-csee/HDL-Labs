`timescale 1ns / 1ps

task computation_task;
input [15:0] i_1, i_2;
output [31:0] mul_sum;
output carryout;
begin
  {carryout,mul_sum} = (i_1/i_2)*(i_1+i_2)+(i_1-i_2);
end
endtask