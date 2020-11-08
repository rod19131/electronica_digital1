//José Alejandro Rodríguez Porras 19131
//Electrónica Digital 1
//Laboratorio 10
//Ejercicio 2 ALU
//Flip Flop de 4 bits
//Flip Flop tipo D de 4 bits con Enable (acumulador)
module accu(input clk, rst, enable, input [3:0]d, output reg [3:0]q);
    always @ (posedge clk or posedge rst) begin
        if (rst) begin
            q <= 4'b0000;
        end
        else if (enable) begin
            q <= d;
        end
    end
endmodule

//Buffer Triestado de 4 bits 
module tribuf4(input enable, input [3:0]in, output wire [3:0]out);
    assign out = (enable) ? in:4'bz;

endmodule  
//ALU de 4 bits
module ALU(input [3:0]A, input [3:0]B, input [2:0]opcode, output reg [3:0]resultado, output reg Carry, output reg Zero); 

        reg [4:0]q; //Variable interna

        always @ (A or B or opcode) begin
            q = 5'b00000;
            // Depende de los casos del opcode se ejecuta una operación específica
            case(opcode)
                3'b000: begin
                            // Dejar pasar A
                            q = A;
                            Carry = 1'b0;
                        end

                3'b001: begin
                            // Comp
                            q = A - B; 
                            Carry = (q[4] == 5'b00000) ? 1:0;
 
                        end
                
                3'b010: begin
                            // Dejar pasar B
                            q = B;
                            Carry = 1'b0;
                        end

                3'b011: begin
                            // Suma
                            q = A + B;
                            Carry = (q[4] == 5'b00000) ? 1:0;
                        end

                3'b100: begin
                            // NAND
                            q = ~(A & B);
                            Carry = 1'b0;
                        end
            endcase
            Zero = (q == 5'b00000) ? 1:0;
            resultado = q[3:0];
        end
endmodule
//Módulo completo con los demás submodulos, es decir, el buffer triestado de 4 bits, el accu y la ALU
module alu_driver_accu(input [3:0]in, input clk, rst, en_accu, en1, en2, input [2:0]opcode, output wire Carry, Zero, output wire [3:0]out);
        wire [3:0]A;
        wire [3:0]B;
        wire [3:0]alu_out;
        //Entrada
        tribuf4 BT1(en1, in, B);
        //Acumulador
        accu DFF4(clk, rst, en_accu, alu_out, A);
        //ALU
        ALU alu(A, B, opcode, alu_out, Carry, Zero);
        //Salida
        tribuf4 BT2(en2, alu_out, out);
endmodule   