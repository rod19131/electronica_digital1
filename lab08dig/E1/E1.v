//José Alejandro Rodríguez Porras 19131
//Electrónica Digital 1
//Lab 8 Ejercicio 1
//Contador de 12 bits, con Load, Enabled y Reset
module up_counter(input clk, rst, Load, Enabled, input [11:0]Loadvalue, output [11:0]counter);
reg [11:0] counter_up;
// Load y reset asíncronos
always @(posedge clk or posedge Load or posedge rst)
// El reset pone todos los bits del contador en 0 de forma asíncrona
begin
if (rst)
    counter_up <= 12'b000000000000;
// El Load asigna un valor específico(Loadvalue) al contador mientras Load sea igual a 1
else if(Load)
    counter_up <= Loadvalue;
//Mientras Enable sea igual a 1 el contador va sumando uno al valor previo, "va contando"
else begin 
//Si el contador llega a su valor máximo, es decir 4095 el siguiente valor que se le asigna es 0
if (Enabled == 1 & counter_up == 12'b111111111111)
    counter_up = 12'd0;
//El contador cuenta
else if (Enabled == 1)
    counter_up <= counter_up + 12'd1;
end    
end
//Se asigna el valor del contador a la salida
assign counter = counter_up;
endmodule