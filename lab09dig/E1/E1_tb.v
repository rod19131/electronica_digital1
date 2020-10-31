//José Alejandro Rodríguez Porras 19131
//Electrónica Digital 1
//Laboratorio 9
//Ejercicio 1 Testbench
//Flip Flop tipo D de 1 bit con Enable, Flip Flop tipo D de 2 bit con Enable, Flip Flop tipo D de 4 bit con Enable,
module testbench();
//Declaración de variables
    reg clk, rst, enable;
    reg [3:0]d;
    wire [3:0]q;
//Asignación de módulos
    FFD4 ffd4(clk, rst, enable, d, q);

//Prueba de funcionamiento del Flip Flop Tipo D con Enable de 1 bit
initial begin
    $display("rst enable d | q");
    $display("-------------|--");
    $monitor("%b    %b   %b| %b", rst, enable, d, q);
    clk = 0; rst = 0; enable = 0; d = 4'b0000;
    //Prueba de reset
    #1  rst = 1; enable = 0; d = 4'b0000;
    #1  rst = 0; enable = 0; d = 4'b0000;
    //Prueba de que cuando enable esta apagado q no se actualiza 
    #1  rst = 0; enable = 0; d = 4'b1001;
    #5  rst = 0; enable = 0; d = 4'b0000;
    //Prueba de que cuando enable esta encendido q se actualiza con los flancos positivos del clk
    #5  rst = 0; enable = 1; d = 4'b0101;
    #10 rst = 0; enable = 1; d = 4'b0000;
    //Prueba de que cuando enable esta apagado q no se actualiza 
    #10 rst = 0; enable = 0; d = 4'b0111;
    #10 rst = 0; enable = 0; d = 4'b0000;
    //Prueba de reset
    #10 rst = 0; enable = 1; d = 4'b1111;
    #10 rst = 1; enable = 1; d = 4'b0000;
    #1  rst = 0;
    #80 $finish;
end
always
        #5 clk = ~clk;
    initial begin
        $dumpfile("E1_tb.vcd");
        $dumpvars(0,testbench);
    end
endmodule
