CC = iverilog


alu: 
	$(CC) -o alu.o alu.v alu_defines.v and.v ripple_adder32.v mux_16to1.v nor.v or.v test_alu.v xor.v full_adder.v half_adder.v mux_8to1.v mux_4to1.v mux_2to1.v
	vvp alu.o

ripple:
	$(CC) -o ripple.o test_ripple_adder32.v ripple_adder32.v full_adder.v
	vvp ripple.o

mux16:
	$(CC) -o mux16.o test_mux_16to1.v mux_16to1.v mux_8to1.v mux_2to1.v mux_4to1.v
	vvp mux16.o

eq4:
	$(CC) -o eq4.o tests/test_eq4.v eq4.v
	vvp eq4.o

clean:
	rm *.o

