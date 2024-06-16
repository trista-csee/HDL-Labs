module computation_task_function_tb;

reg [15:0] i_1,i_2;
wire [31:0] mul_sum;
wire carryout;

initial begin
   i_1=0;
   i_2=0;

   #10; // (100/200)*(100+200)+(100-200)=-100
   i_1=100;
   i_2=200;

   #10; // (i_1/i_2)*(i_1+i_2)+(i_1-i_2)=1_fffe
   i_1=16'hffff;
   i_2=16'hffff;

   #10;
   $finish;
end

top_computation_task_function inst (
    .i_1(i_1),		
    .i_2(i_2), 
	.mul_sum(mul_sum),
    .carryout(carryout)
);

 
endmodule