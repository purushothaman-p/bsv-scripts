package basic_gates;

    function Bit#(1) and2_gate(Bit#(1) a, Bit#(1) b);
        return a & b;
    endfunction

    function Bit#(1) or2_gate(Bit#(1) a, Bit#(1) b);
        return a | b;
    endfunction

    function Bit#(1) xor2_gate(Bit#(1) a, Bit#(1) b);
        return a ^ b;
    endfunction

    function Bit#(1) inv_gate(Bit#(1) a);
        return ~ a;
    endfunction

    interface GatesIFC;
        method Bit#(1) and2_in(Bit#(1) a, Bit#(1) b);
        method Bit#(1)  or2_in(Bit#(1) a, Bit#(1) b);
        method Bit#(1)  inv_in(Bit#(1) a);           
        method Bit#(1) xor2_in(Bit#(1) a, Bit#(1) b);
    endinterface

    (*synthesize*)
    (*always_ready*)

    module mkGates (GatesIFC);

        method Bit#(1) and2_in(Bit#(1) a, Bit#(1) b);
            return and2_gate(a, b);
        endmethod
        
        method Bit#(1)  or2_in(Bit#(1) a, Bit#(1) b);
            return  or2_gate(a, b);
        endmethod
        
        method Bit#(1) inv_in(Bit#(1) a);
            return inv_gate(a);
        endmethod
        
        method Bit#(1) xor2_in(Bit#(1) a, Bit#(1) b);
            return xor2_gate(a, b);
        endmethod
    
    endmodule
endpackage