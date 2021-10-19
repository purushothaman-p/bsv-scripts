all: compile sim wave

compile:
	mkdir -p temp
	bsc -u -bdir temp -vdir temp -verilog half_adder.bsv
	bsc -u -bdir temp -vdir temp -verilog half_adder_tb.bsv

sim:
	bsc -u -bdir temp -simdir temp -sim half_adder_tb.bsv
	bsc    -bdir temp -simdir temp -sim -o temp/sim -e mkHalfAdder_tb
	temp/sim -V temp/dump.vcd

wave:
	gtkwave temp/dump.vcd

clean:
	rm temp/*
