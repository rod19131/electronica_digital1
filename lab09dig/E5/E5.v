//José Alejandro Rodríguez Porras 19131
//Electrónica Digital 1
//Laboratorio 9
//Ejercicio 5
//Memoria ROM 
module ROM(input wire [6:0]in, output reg [12:0]out);

        always @ (*)begin
                casex (in)
                    7'bxxxxxx0: out <= 13'b1000000001000;
                    7'b00001x1: out <= 13'b0100000001000;
                    7'b00000x1: out <= 13'b1000000001000;
                    7'b00011x1: out <= 13'b1000000001000;
                    7'b00010x1: out <= 13'b0100000001000;
                    7'b0010xx1: out <= 13'b0001001000010;
                    7'b0011xx1: out <= 13'b1001001000000;
                    7'b0100xx1: out <= 13'b0011010000010;
                    7'b0101xx1: out <= 13'b0011010000100;
                    7'b0110xx1: out <= 13'b1011010100000;
                    7'b0111xx1: out <= 13'b1000000111000;
                    7'b1000x11: out <= 13'b0100000001000;
                    7'b1000x01: out <= 13'b1000000001000;
                    7'b1001x11: out <= 13'b1000000001000;
                    7'b1001x01: out <= 13'b0100000001000;
                    7'b1010xx1: out <= 13'b0011011000010;
                    7'b1011xx1: out <= 13'b1011011100000;
                    7'b1100xx1: out <= 13'b0100000001000;
                    7'b1101xx1: out <= 13'b0000000001001;
                    7'b1110xx1: out <= 13'b0011100000010;
                    7'b1111xx1: out <= 13'b1011100100000;
                endcase
        end
endmodule