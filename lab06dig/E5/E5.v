//José Alejandro Rodríguez Porras 19131
//Electrónica Digital
//Laboratorio 6
//Ejercicio 5: Flip Flop Tipo D de 4 Bits con reset asíncrono y un set síncrono
module dff4(input clk, rst, input [3:0] d, output reg [3:0] q); 
    //lista sensible de variables con clock y reset y las instrucciones que se ejecutan 
    always @ (posedge clk or posedge rst)
        if (rst)
            q <= 4'b0;
        else 
            q <= d;
    end
endmodule 

