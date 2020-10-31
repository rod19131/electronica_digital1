//José Alejandro Rodríguez Porras 19131
//Electrónica Digital 1
//Laboratorio 9
//Ejercicio 2 
//Flip Flop tipo T con Enable
module FFD1(input clk, rst, enable, d, output reg q);
    always @ (posedge clk or posedge rst) begin
        if (rst)
            q <= 0;
        else if (enable)
            q <= d;
        end 
endmodule

module FFT(input clk, rst, enable, output q);
    FFD1 ffd1(clk, rst, enable, ~q, q);
endmodule


