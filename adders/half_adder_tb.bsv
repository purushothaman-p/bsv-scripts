package half_adder_tb;

import half_adder :: *;

(* synthesize *)
module mkHalfAdder_tb();
    HalfAdderIFC inst1 <- mkHalfAdder;
    Reg#(Bit#(1)) in1 <- mkReg(1);
    Reg#(Bit#(1)) in2 <- mkReg(1);
    
    Reg#(Sum_Carry) res <- mkReg(Sum_Carry{sum:0, carry:0});
    Reg#(Bit#(4)) count <- mkReg(0);

    rule counting;
        count<=count+1;
    endrule

    rule ha_1(count==0);
        res <= inst1.half_add(in1, in2);
        $display("a = ", in1, "\tb = ", in2, "\ts = ", inst1.half_add(in1, in2).sum, "\tc = ", inst1.half_add(in1, in2).carry);
    endrule

    rule done(count==2);
        $finish(0);
    endrule

endmodule

endpackage