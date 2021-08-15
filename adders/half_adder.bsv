package half_adder;
    
    typedef struct{ Bit#(1) sum; Bit#(1) carry;} Sum_Carry deriving (Bits, Eq);
        
    // sum = a^b, carry = a&b
    function Sum_Carry fn_half_add(Bit#(1) a, Bit#(1) b);
        return(Sum_Carry {sum:a^b, carry:a&b});
    endfunction

    interface HalfAdderIFC;
        method Sum_Carry half_add(Bit#(1) a, Bit#(1) b); 
    endinterface

    (*synthesize*)

    module mkHalfAdder (HalfAdderIFC);

        method Sum_Carry half_add(Bit#(1) a, Bit#(1) b);
            return(fn_half_add(a, b));
        endmethod
    
    endmodule

endpackage