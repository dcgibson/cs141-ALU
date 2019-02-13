CC = iverilog


alu: 
	$(CC) -o alu.o alu.v alu_defines.v and.v ripple_adder32.v mux_16to1.v nor.v or.v test_alu.v xor.v full_adder.v half_adder.v mux_8to1.v mux_4to1.v mux_2to1.v
	vvp alu.o


mux16:
	$(CC) -o mux16.o test_mux_16to1.v mux_16to1.v mux_8to1.v mux_2to1.v mux_4to1.v
	vvp mux16.o

mux8:
	$(CC) -o mux8.o test_mux_8to1.v mux_8to1.v mux_4to1.v mux_2to1.v
	vvp mux8.o

mux4:
	$(CC) -o mux4.o test_mux_4to1.v mux_4to1.v mux_2to1.v
	vvp mux4.o

mux2:
	$(CC) -o mux2.o test_mux_2to1.v mux_2to1.v
	vvp mux2.o

clean:
	rm *.o

