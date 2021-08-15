package basic_gates_tb;

import basic_gates :: *;

(* synthesize *)
module mkGates_tb();
    GatesIFC inst1 <- mkGates;
    Reg#(Bit#(1)) in1 <- mkReg(1);
    Reg#(Bit#(1)) in2 <- mkReg(1);
    Reg#(Bit#(1)) res <- mkReg(0);
    Reg#(Bit#(4)) count <- mkReg(0);

    rule counting;
        count<=count+1;
    endrule

    rule and_op(count==0);
        res <= inst1.and2_in(in1, in2);
        $display("%t %1b %1b %1b", $time, in1, in2, res);
    endrule
    
    rule inv_op(count==2);
    res <= inst1.inv_in(in1);
    $display("%t %1b %1b", $time, in1, res);
    endrule
    
    rule  or_op(count==4);
        res <= inst1.or2_in(in1, in2);
        $display("%t %1b %1b %1b", $time, in1, in2, res);
    endrule
    
    rule xor_op(count==6);
        res <= inst1.xor2_in(in1, in2);
        $display("%t %1b %1b %1b", $time, in1, in2, res);
    endrule

    rule done(count==8);
        $finish(0);
    endrule

endmodule

endpackage