//José Alejandro Rodríguez Porras 19131
//Electrónica Digital 1
//Laboratorio 9
//Ejercicio 3 
//Flip Flop JK testbench
module testbench();
//Declaración de variables
    reg clk, rst, enable, j, k;
    wire q;
//Asignación de módulos
    FFJK fft(clk, rst, enable, j, k, q);

//Prueba de funcionamiento del Flip Flop JK con Enable de 1 bit
initial begin
    $display("rst enable j k    | q");
    $display("------------------|--");
    $monitor("%b    %b     %b %b   | %b", rst, enable, j, k, q);
    clk = 0; rst = 0; enable = 0; j = 0; k = 0;
    //Prueba del reset
    #1  rst = 1; enable = 0; j = 0; k = 0;
    //Prueba del enable en 0
    #1  rst = 0; enable = 0; j = 1; k = 0;
    #10 rst = 0; enable = 0; j = 0; k = 0;
    #10 rst = 0; enable = 0; j = 0; k = 1;
    #10 rst = 0; enable = 0; j = 1; k = 1;
    //Prueba del enable en 1
    #10 rst = 0; enable = 1; j = 0; k = 0;
    #10 rst = 0; enable = 1; j = 1; k = 0;
    #10 rst = 0; enable = 1; j = 0; k = 0;
    #10 rst = 0; enable = 1; j = 0; k = 1;
    #10 rst = 0; enable = 1; j = 1; k = 1;
    //Prueba del enable en 0
    #10 rst = 0; enable = 0; j = 0; k = 1;
    #10 rst = 1; enable = 0; j = 0; k = 0;
    #1  rst = 0; enable = 0; j = 0; k = 0;
    #150 $finish;
end
always
        #5 clk = ~clk;
    initial begin
        $dumpfile("E3_tb.vcd");
        $dumpvars(0,testbench);
    end
endmodule