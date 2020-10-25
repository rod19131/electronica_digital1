//José Alejandro Rodríguez Porras 19131
//Electrónica Digital 1
//Lab 8 Ejercicio 3 
//ALU
module ALU(input wire [3:0]A, input wire [3:0]B, input wire [2:0]opcode, output reg [3:0]Y);
    always @(opcode or A or B) begin 
        //case para elegir cada uno de los modos de operación
        case(opcode)
        3'b000: Y <= A & B; //A AND B
        3'b001: Y <= A | B; // A OR B
        3'b010: Y <= A + B; // A + B
        3'b011: Y <= 4'b0000; // Sin uso
        3'b100: Y <= A & ~B; //A AND B'
        3'b101: Y <= A | ~B; //A OR B'
        3'b110: Y <= A - B; //A - B
        3'b111: Y <= (A < B) ? 1:0; // Y es 1 solo cuando A es menor que B
        //valor por defecto de salida
        default: Y <= 4'b0000;
        endcase
    end
endmodule
