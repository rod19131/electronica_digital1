//José Alejandro Rodríguez Porras 19131
//Electrónica Digital
//Laboratorio 6
//Ejercicio 6: Ejercicio 1
// Flip Flop Tipo D con reset asíncrono y
module dff(input clk, rst, d, output reg q);

    always @ (posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule
//Módulo de la FSM de Mealy del ejercicio 1
module E_1(input clk, rst, A, B, output S1, S0, SF1, SF0, output Y);
    //estaos presentes y futuros
    wire S1, S0, SF1, SF0;
    //asignación del estado futuro con sus respectivas ecuaciones minimizadas
    assign SF1 = (S1 & A & B) | (S0 & B);
    assign SF0 = (~S1 & ~S0 & A);
    //creación de cada flip flop para cada estado futuro y su respectiva asignación de variables al módulo
    dff FF1(clk, rst, SF1, S1);
    dff FF0(clk, rst, SF0, S0);
    //asignación de la salida de la máquina con su ecuación minimizada
    assign Y = (S1 & A & B);
endmodule





