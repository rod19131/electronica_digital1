//José Alejandro Rodríguez Porras 19131
//Electrónica Digital 1
//Laboratorio 9
//Ejercicio 3 
//Flip Flop JK
//Flip Flop Tipo D
module FFD1(input clk, rst, enable, d, output reg q);
    always @ (posedge clk or posedge rst) begin
        if (rst)
            q <= 0;
        else if (enable)
            q <= d;
        end 
endmodule
//módulo del flip flop tipo JK con inputs J y K, con una nube combinacional previa para definir d
module FFJK(input clk, rst, enable, j, k, output q);
    wire nk, nq, j_and_nq, nk_and_q, d; 
    not (nk, k);
    not (nq, q);
    and (j_and_nq, j, nq);
    and (nk_and_q, nk, q);
    or (d, j_and_nq, nk_and_q);
    FFD1 ffd1(clk, rst, enable, d, q);
endmodule
