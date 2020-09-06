//Alejandro Rodríguez 19131
//Lab 6
//testbench
//Ejercicio 3
module testbench();
    reg clk, rst, A;
    wire Y2, Y1, Y0, S2, S1, S0, SF2, SF1, SF0;
    E_3 e3(clk, rst, A, S2, S1, S0, SF2, SF1, SF0, Y2, Y1, Y0);
    initial begin
    $display("S2 S1 S0 SF2 SF1 SF0 | Y2 Y1 Y0");
    $display("------------------|----------");
    $monitor("%b %b %b %b %b %b | %b %b %b", clk, rst, A, S2, S1, S0, SF2, SF1, SF0, Y2, Y1, Y0);
 // Prueba del funcionamiento de la máquina completa, comienza el contador de Gray
        clk = 0; rst = 0; A = 0;
        #1 rst = 1;
        #1 rst = 0;
        #3 A = 1;
        //Prueba del reset asíncrono 
        #31 rst = 1;
        #1 rst = 0;
        #1 A = 1;
        //Se pone en modo reversa
        #5 A = 0;
        #100 $finish;
    end 
    //generación del reloj con período de 4 unidades de tiempo
    always
        #2 clk = ~clk;
        //creación del archivo vcd
    initial begin
        $dumpfile("E3_tb.vcd");
        $dumpvars(0,testbench);
    end
endmodule