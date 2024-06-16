module Nbit_Full_Adder_tb;

parameter width = 16;
reg Cin;
reg [width-1:0] A,B;
wire [width-1:0] Sum;
wire Cout;

initial begin
   A=0;
   B=0;
   Cin=0;

   #10;
   A=100;
   B=200;
   Cin=1;

   #10;
   A=16'hffff;
   B=16'hffff;
   Cin=0;

   #10;
   $finish;
end

Nbit_Full_Adder inst (
    .A(A),		
    .B(B), 
    .Cin(Cin),
	.Sum(Sum),
    .Cout(Cout)
);

endmodule