//José Alejandro Rodríguez Porras 19131
//Electrónica Digital 1
//Laboratorio 9
//Ejercicio 1
//Flip Flop tipo D de 1 bit con Enable
module FFD1(input clk, rst, enable, d, output reg q);
    always @ (posedge clk or posedge rst) begin
        if (rst)
            q <= 0;
        else if (enable)
            q <= d;
    end 
endmodule
//Flip Flop tipo D de 2 bits con Enable
module FFD2(input clk, rst, enable, input [1:0]d, output [1:0]q);
    
    FFD1 df1_1(clk, rst, enable, d[1], q[1]);
    FFD1 df1_0(clk, rst, enable, d[0], q[0]);

endmodule
//Flip Flop tipo D de 4 bits con Enable
module FFD4(input clk, rst, enable, input [3:0]d, output [3:0]q);
    
    FFD2 df2_1(clk, rst, enable, d[3:2], q[3:2]);
    FFD2 df2_0(clk, rst, enable, d[1:0], q[1:0]);

endmodule


