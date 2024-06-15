module Nbit_Full_Adder #(parameter width=16)
(
  input Cin,
  input [width-1:0] A,B,
  output [width-1:0] Sum,
  output reg Cout
);

reg [width-1:0] Ci;
wire [width-1:0] Co;
integer j;

always @(*) begin
  Ci[0]=Cin;
  Cout = Co[width-1];
  
  for(j=1;j<width;j=j+1) 
  begin 
    Ci[j] = Co[j-1];
  end 
end

genvar i;
generate
  for(i=0; i<width; i=i+1)  begin : FA_group
     Full_Adder_1bit inst (
       .A(A[i]),
       .B(B[i]),
       .Cin(Ci[i]),
       .Sum(Sum[i]),
       .Cout(Co[i])); 
   end 
endgenerate

endmodule
