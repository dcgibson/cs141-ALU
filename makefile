CC = iverilog


alu: 
	$(CC) -o alu.o alu.v alu_defines.v and.v eq32.v eq16.v eq4.v ripple_add_sub32.v ripple_adder32.v mux_16to1.v nor.v or.v test_alu.v xor.v full_adder.v half_adder.v mux_8to1.v mux_4to1.v mux_2to1.v
	vvp alu.o

ripple:
	$(CC) -o ripple.o tests/test_ripple_adder32.v ripple_adder32.v full_adder.v
	vvp ripple.o

sub4:
	$(CC) -o sub4.o tests/test_ripple_add_sub4.v ripple_add_sub4.v full_adder.v mux_2to1.v
	vvp sub4.o

sub32:
	$(CC) -o sub32.o tests/test_ripple_add_sub32.v ripple_add_sub32.v full_adder.v mux_2to1.v
	vvp sub32.o

mux16:
	$(CC) -o mux16.o tests/test_mux_16to1.v mux_16to1.v mux_8to1.v mux_2to1.v mux_4to1.v
	vvp mux16.o

eq4:
	$(CC) -o eq4.o tests/test_eq4.v eq4.v
	vvp eq4.o

eq16:
	$(CC) -o eq16.o tests/test_eq16.v eq16.v eq4.v
	vvp eq16.o

eq32:
	$(CC) -o eq32.o tests/test_eq32.v eq32.v eq16.v eq4.v
	vvp eq32.o

clean:
	rm *.o
