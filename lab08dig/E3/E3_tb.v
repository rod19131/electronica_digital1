//José ALejandro Rodríguez Porras 19131
//Electrónica Digital 1
//Lab 8 Ejercicio 3 testbench
module testbench();
    reg [3:0]A;
    reg [3:0]B;
    reg [2:0]opcode;
    wire [3:0]Y;

ALU alu(A, B, opcode, Y);
//Comienzo de la simulación
initial begin
   #1 $display("A        B    opcode |    Y");
      $display("---------------------|-----------");
    $monitor("%b    %b    %b  |   %b", A, B, opcode, Y);
// Prueba A AND B
    A = 4'b0000; B = 4'b0000; opcode = 3'b000; 
   #1 A = 4'b0001; B = 4'b0000; opcode = 3'b000;
   #1 A = 4'b0000; B = 4'b0001; opcode = 3'b000;
   #1 A = 4'b0001; B = 4'b0001; opcode = 3'b000;
   #1 A = 4'b0110; B = 4'b0110; opcode = 3'b000;
   #1 A = 4'b0011; B = 4'b0010; opcode = 3'b000;
//Prueba A OR B
   #1 A = 4'b0000; B = 4'b0000; opcode = 3'b001;
   #1 A = 4'b0000; B = 4'b0001; opcode = 3'b001;
   #1 A = 4'b0001; B = 4'b0000; opcode = 3'b001;
   #1 A = 4'b1010; B = 4'b0010; opcode = 3'b001;
//Prueba A + B
   #1 A = 4'b0000; B = 4'b0000; opcode = 3'b010;//0+0 = 0
   #1 A = 4'b1000; B = 4'b0011; opcode = 3'b010;//8+3 = 11
   #1 A = 4'b0000; B = 4'b0001; opcode = 3'b010;//0+1 = 1
   #1 A = 4'b0001; B = 4'b0010; opcode = 3'b010;//1+2 = 3
   #1 A = 4'b0001; B = 4'b0101; opcode = 3'b010;//1+5 = 6
//Prueba sin uso (salida es 0 siempre)
   #1 A = 4'b0000; B = 4'b0000; opcode = 3'b011;
   #1 A = 4'b0001; B = 4'b0110; opcode = 3'b011;
//Prueba A AND B'
   #1 A = 4'b0000; B = 4'b0000; opcode = 3'b100;
   #1 A = 4'b0001; B = 4'b0000; opcode = 3'b100;
   #1 A = 4'b0011; B = 4'b0001; opcode = 3'b100;
   #1 A = 4'b0100; B = 4'b0010; opcode = 3'b100;
//Prueba A OR B' 
   #1 A = 4'b0000; B = 4'b0000; opcode = 3'b101;
   #1 A = 4'b0000; B = 4'b0001; opcode = 3'b101;
   #1 A = 4'b0010; B = 4'b0000; opcode = 3'b101;
//Prueba A - B
   #1 A = 4'b0000; B = 4'b0000; opcode = 3'b110;// 0 - 0 = 0
   #1 A = 4'b0001; B = 4'b0000; opcode = 3'b110;// 1-0 = 1
   #1 A = 4'b0010; B = 4'b0010; opcode = 3'b110;//2-2 = 0
   #1 A = 4'b0100; B = 4'b0001; opcode = 3'b110;//4-1 = 3
//Prueba Y = 1 solo cuando A<B
   #1 A = 4'b0011; B = 4'b0011; opcode = 3'b111;
   #1 A = 4'b0110; B = 4'b0111; opcode = 3'b111;
   #1 A = 4'b0100; B = 4'b0010; opcode = 3'b111;
   #1 A = 4'b0101; B = 4'b0010; opcode = 3'b111;
end    
//final de la simulación
initial
    #40 $finish;
//Creación del vcd
initial begin 
    $dumpfile("E3_tb.vcd");
    $dumpvars(0, testbench);
end
endmodule