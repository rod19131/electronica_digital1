//José Alejandro Rodríguez Porras 19131
//Electrónica Digital 1
//Laboratorio 10
//Ejercicio 2 Testbench ALU
module testbench();
    //Declaración de variables
    reg en_accu, en1, en2, clk, rst;
    reg [3:0]in;
    reg [2:0]opcode;
    wire Carry, Zero;
    wire [3:0]out;
    //Asignación de módulos
    alu_driver_accu ADA(in, clk, rst, en_accu, en1, en2, opcode, Carry, Zero, out);
    //Prueba de funcionamiento de la ALU con acumulador y buses
    initial begin 
        $display("rst en_accu en1 en2 opcode in  | Carry Zero Out");
        $display("-------------------------------|---------------------------");
        $monitor("%b   %b       %b   %b   %b    %b| %b     %b    %b ", rst, en_accu, en1, en2, opcode, in, Carry, Zero, out);
        rst = 0; en_accu = 0; en1 = 0; en2 = 0; opcode = 3'b000; in = 4'b0000; clk = 0;
        //Prueba del reset
        #1  rst = 1; en_accu = 0; en1 = 0; en2 = 0; opcode = 3'b000; in = 4'b0000;
        //Prueba de que cuando todos los enables estan apagados la salida se pone en alta impedancia
        #1  rst = 0; en_accu = 0; en1 = 0; en2 = 0; opcode = 3'b000; in = 4'b0111;
        //Prueba de dejar pasar A y poniendo un input cualquiera
        #10 rst = 0; en_accu = 1; en1 = 1; en2 = 1; opcode = 3'b000; in = 4'b0111;
        //Prueba de dejar pasar B y poniendo un input cualquiera
        #10 rst = 0; en_accu = 1; en1 = 1; en2 = 1; opcode = 3'b010; in = 4'b0001;
        //Prueba de comparación entre A y B
        #10 rst = 0; en_accu = 1; en1 = 1; en2 = 1; opcode = 3'b001; in = 4'b1001;
        //Prueba de la suma entre A y B
        #10 rst = 0; en_accu = 1; en1 = 1; en2 = 1; opcode = 3'b011; in = 4'b1011;
        //Prueba de el NAND entre A y B
        #10 rst = 0; en_accu = 1; en1 = 1; en2 = 1; opcode = 3'b100; in = 4'b1010;
        //Prueba de apagar todos los enables
        #10 rst = 0; en_accu = 0; en1 = 0; en2 = 0; opcode = 3'b100; in = 4'b1100;
        //Prueba del reset asíncrono
        #10 rst = 1; en_accu = 1; en1 = 1; en2 = 1; opcode = 3'b000; in = 4'b1010;
        #1  rst = 0; en_accu = 1; en1 = 1; en2 = 1; opcode = 3'b000; in = 4'b0000;
        #200 $finish;
    end
    //Clock
    always
        #5 clk = ~clk;
    //Creación del diagrama de timing
    initial begin
        $dumpfile("E2_tb.vcd");
        $dumpvars(0,testbench);
    end
endmodule