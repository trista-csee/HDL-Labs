`timescale 1ns / 1ps

function [32:0] computation_function;
input [15:0] i_1, i_2;
// don't have output/inout​

begin
  computation_function = (i_1/i_2)*(i_1+i_2)+(i_1-i_2); // return the value
end
endfunction