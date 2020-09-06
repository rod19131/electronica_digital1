//Alejandro Rodríguez 19131
//Lab 6
//testbench
//Ejercicio 1
module testbench();
    reg clk, rst, A, B;
    wire Y, S1, S0, SF1, SF0;
    E_1 e1(clk, rst, A, B, S1, S0, SF1, SF0, Y);
    initial begin
    $display("clk rst A B S1 S0 SF1 SF0 | Y");
    $display("--------------------------|--");
    $monitor("%b %b %b %b %b %b %b %b| %b", clk, rst, A, B, S1, S0, SF1, SF0, Y);
 // Prueba del funcionamiento de la máquina con las distintas combinaciones para que cambie a cada uno de los estados 
        clk = 0; rst = 0; A = 0; B = 0;
        #1 rst = 1;
        #1 rst = 0;
        #3 A = 1; B = 0;
        #3 A = 0; B = 1;
        #3 A = 1; B = 1;
        //Prueba del reset asíncrono en un flanco negativo
        #1 rst = 1;
        #1 rst = 0;
        #3 A = 1; B = 0;
        #3 A = 0; B = 0;
        #3 A = 0; B = 0;
        #3 A = 1; B = 1;
        #50 $finish;
    end 
    //generación del reloj con período de 4 unidades de tiempo
    always
        #2 clk = ~clk;
    initial begin
        $dumpfile("E1_tb.vcd");
        $dumpvars(0,testbench);
    end
endmodule