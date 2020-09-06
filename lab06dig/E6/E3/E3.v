//José Alejandro Rodríguez Porras 19131
//Electrónica Digital
//Laboratorio 6
//Ejercicio 6: Ejercicio 3
// Flip Flop Tipo D con reset asíncrono de un bit
module dff(input clk, rst, d, output reg q);

    always @ (posedge clk or posedge rst)
        if (rst)
            q <= 1'b0; 
        else begin
            q <= d;
    end
endmodule
//módulo de la FSM de Moore del contador de Gray (Ejercicio 3)
module E_3(input clk, rst, A, output S2, S1, S0, SF2, SF1, SF0, Y2, Y1, Y0);
    //salidas de estados presentes y futuros
    wire S2, S1, S0, SF2, SF1, SF0;
    //asignación de cada estado futuro con su ecuación minimizada
    assign SF2 = (~S2 & S1 & S0 & A) | (~S2 & ~S1 & ~S0 & ~A) | (S2 & S0 & ~A) | (S2 & ~S1 & A) | (S2 & S1 & ~S0);
    assign SF1 = (S1 & S0 & ~A) | (~S1 & S0 & A) | (~S1 & ~S0 & ~A) | (S1 & ~S0 & A);
    assign SF0 = ~S0;
    //creación de los flip flops para cada estado y asignación de variables a cada módulo
    dff FF2(clk, rst, SF2, S2);
    dff FF1(clk, rst, SF1, S1);
    dff FF0(clk, rst, SF0, S0);
    //asignación de las salidas de la fsm con sus ecuaciones minimizadas
    assign Y2 = S2;
    assign Y1 = (~S2 & S1) | (S2 & ~S1);
    assign Y0 = (S1 & ~S0) | (~S1 & S0);
endmodule
 
