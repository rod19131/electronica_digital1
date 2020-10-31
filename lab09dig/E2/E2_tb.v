//José Alejandro Rodríguez Porras 19131
//Electrónica Digital 1
//Laboratorio 9
//Ejercicio 2 testbench 
//Flip Flop tipo T con Enable
module testbench();
//Declaración de variables
    reg clk, rst, enable;
    wire q;
//Asignación de módulos
    FFT fft(clk, rst, enable, q);

//Prueba de funcionamiento del Flip Flop Tipo D con Enable de 1 bit
initial begin
    $display("rst enable | q");
    $display("-----------|--");
    $monitor("%b    %b   | %b", rst, enable, q);
    clk = 0; rst = 0; enable = 0;
    //Prueba del reset
    #1  rst = 1; enable = 0;
    #1  rst = 0; enable = 0;
    //Prueba de que q se actualiza con el enable encendido en cada flanco de reloj
    #10 rst = 0; enable = 1;
    //Prueba de que q no se actualiza con el enable apagado
    #30 rst = 0; enable = 0;
    //Prueba del reset
    #10 rst = 1; enable = 0;
    //Prueba de que q se actualiza con el enable encendido en cada flanco de reloj
    #1  rst = 0; enable = 1;
    #20 rst = 0; enable = 0;
    #80 $finish;
end
always
        #5 clk = ~clk;
    initial begin
        $dumpfile("E2_tb.vcd");
        $dumpvars(0,testbench);
    end
endmodule