//José Alejandro Rodríguez Porras 
//Electrónica Digital 1
//Lab 8 Ejercicio 1 testbench
module testbench();
reg clk, rst, Load, Enabled;
reg [11:0]Loadvalue;
wire [11:0]counter;

up_counter count(clk, rst, Load, Enabled, Loadvalue, counter);
initial begin 
forever #5 clk=~clk;
end
initial begin
$display("Load Enabled Loadvalue | counter ");
$display("-----------------------|---------");
$monitor("%d      %d      %d     | %d", Load, Enabled, Loadvalue, counter);
//Valores iniciales de los inputs, el clock y el rst
clk=0; rst = 0; Load = 0;  Enabled = 0; Loadvalue = 12'b000000000000; 
//Prueba de que el contador no cuenta si el Enabled es 0
#1  rst = 1;
#1  rst = 0; 
//Prueba de que el contador comienza a contar cuanto se el Enabled es 1
#40  Enabled = 1;
//Prueba de una carga de un valor al contador de forma asíncrona cuando el Load es 1
#100 Load = 1; Loadvalue = 12'b000000011010;
//La salida del contador es el valor cargado por el Load mientras el Load se quede en 1
// Cuando el Load es 0 el contador comienza a contar desde el valor asignado cuando se activó el Load
#100 Load = 0; 
//Prueba de que el contador deja de contar cuando el Enabled es 0.
#100 Enabled = 0;
// Se carga el valor de 4094 con el Load al contador
#100 Enabled = 1; Loadvalue = 12'b111111111110; 
#60 Load = 1; 
//Prueba de que el contador vuelve todos sus bits a 0 luego de llegar a su valor máximo (4095) 
#10  Load = 0;
//Prueba del reset asíncrono
#100 rst = 1;
#1   rst = 0;
//final de la simulación
#40 $finish;
end
//creación del archivo vcd  (diagrama de timing)
initial begin
        $dumpfile("E1_tb.vcd");
        $dumpvars(0,testbench);
    end
endmodule
