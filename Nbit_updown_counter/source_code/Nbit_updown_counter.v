// N bits up/down counter with asynchronous reset

module Nbit_updown_counter(
    Clk, reset, UpOrDown,  //high for UP counter and low for Down counter
    Count
    );

    parameter WIDTH = 5;
    parameter MAXWIDTH = 1 << WIDTH;  // 2^WIDTH

    input Clk,reset,UpOrDown; //high for UP counter and low for Down counter
    output [WIDTH-1:0] Count;
    reg [WIDTH-1:0] Count = 0;  
    
    always @(posedge Clk or posedge reset) //asynchronous reset
    begin
        if(reset == 1) 
            Count <= 0;
        else    
            if(UpOrDown == 1) //Up mode selected
                if(Count == MAXWIDTH-1) // auto reset to 0 when satuarated 
                    Count <= 0;
                else
                    Count <= Count + 1; //increase counter
            else //Down mode selected
                if(Count == 0)
                    Count <= MAXWIDTH-1; // auto set to MAXWIDTH-1 when satuarated
                else
                    Count <= Count - 1; //decrese counter
     end    
    
endmodule