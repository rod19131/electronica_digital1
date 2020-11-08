//José Alejandro Rodríguez Porras 19131
//Electrónica Digital 1
//Lab 10 Ejercicio 1 Testbench
//Módulo con Program Counter, ROM de 4096x8 y Fetch
module testbench();
    //Declaración de variables
    reg clk, rst, enabled, load;
    reg [11:0]loadvalue;
    wire [7:0]program_byte;
    wire [3:0]instr;
    wire [3:0]oprnd;
    //Asignación de módulos
    count_rom_fetch COUNT_ROM_FETCHU(rst, clk, enabled, load, loadvalue, program_byte, instr, oprnd);
    //Prueba de funcionamiento del Módulo con counter, rom y fecth
    initial begin 
        $display("rst enabled load loadvalue    | program_byte   instr oprnd");
        $display("------------------------------|---------------------------");
        $monitor("%b      %b     %b   %b| %b         %b     %b", rst, enabled, load, loadvalue, program_byte, instr, oprnd);
        clk = 0; rst = 0; enabled = 0; load = 0; loadvalue = 12'b000000000000;
        //Prueba del reset
        #1   rst = 1; enabled = 0; load = 0; loadvalue = 12'b000000000000;
        #1   rst = 0; enabled = 1; load = 0; loadvalue = 12'b000000000000;
        //Prueba del enable en 0
        #20  rst = 0; enabled = 0; load = 0; loadvalue = 12'b000000000000;
        #20  rst = 0; enabled = 0; load = 0; loadvalue = 12'b000000000000;
        //Prueba del enable en 1, comienza a contar, y loadvalue no se carga si load es 0
        #20  rst = 0; enabled = 1; load = 0; loadvalue = 12'b000000001000;
        //Prueba de la carga de un valor loadvalue con load igual a 1
        #30  rst = 0; enabled = 1; load = 1; loadvalue = 12'b000000001000;
        //Prueba de que comienza a contar desde la dirección que se cargó
        #30  rst = 0; enabled = 1; load = 0; loadvalue = 12'b000000001000;
        //Prueba del reset
        #20  rst = 1; enabled = 0; load = 0; loadvalue = 12'b000001100110;
        #1   rst = 0; enabled = 0; load = 0; loadvalue = 12'b000001100110;
        //Prueba de la carga de un valor de una dirección de la ROM que no tiene ningún valor guardado
        #1   rst = 0; enabled = 1; load = 1; loadvalue = 12'b000001100110;
        #1   rst = 0; enabled = 1; load = 0; loadvalue = 12'b000001100110;
        //Prueba de la carga de un valor cualquiera de una dirección de la ROM que si tiene un valor guardado
        #1   rst = 0; enabled = 1; load = 1; loadvalue = 12'b000000000001;
        #1   rst = 0; enabled = 1; load = 0; loadvalue = 12'b000000000001;
    end
    //Fin de la simulación
    initial 
    #200 $finish;
    //Clock
    always
        #5 clk = ~clk;
    //Creación del diagrama de timing
    initial begin
        $dumpfile("E1_tb.vcd");
        $dumpvars(0,testbench);
    end
endmodule

