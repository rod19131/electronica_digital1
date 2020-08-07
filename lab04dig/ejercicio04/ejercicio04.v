//José Alejandro Rodríguez Porras 19131
//Electrónica Digital
//Lab 4 Ejercicio 4
//Módulos con Gate Level Modelling 
//Ejercicio 1 Tabla 1 : Y = A'C'+AC+AB'
module gle01_1(input wire A, B, C, output wire Y);

    wire na, nb, nc, w1, w2, w3;

    not (na, A);
    not (nb, B);
    not (nc, C);
    and (w1, na, nc);
    and (w2, A, C);
    and (w3, A, nb);
    or (Y, w1, w2, w3);

endmodule

//Ejercicio 1 Tabla 2: Y = B'
module gle01_2(input wire A, B, C, output wire Y);
    
    wire nb;

    not (nb, B);
    or (Y,nb);

endmodule

//Ejercicio 1 Tabla 3: Y=A'B'C'D'+A'B'CD+A'BC'D+A'BCD'+ABC'D'+ABCD+AB'C'D+AB'CD'
module gle01_3(input wire A, B, C, D, output wire Y);

    wire na, nb, nc, nd, w1, w2, w3, w4, w5, w6, w7, w8;

    not (na, A);
    not (nb, B);
    not (nc, C);
    not (nd, D);
    and (w1, na, nb, nc, nd);
    and (w2, na, nb, C, D);
    and (w3, na, B, nc, D);
    and (w4, na, B, C, nd);
    and (w5, A, B, nc, nd);
    and (w6, A, B, C, D);
    and (w7, A, nb, nc, D);
    and (w8, A, nb, C, nd);
    or (Y, w1, w2, w3, w4, w5, w6, w7, w8);

endmodule

//Ejercicio 1 Tabla 4: Y=BD+AD'+AC
module gle01_4(input wire A, B, C, D, output wire Y);

    wire nd, w1, w2, w3;

    not (nd, D);
    and (w1, B, D);
    and (w2, A, nd);
    and (w3, A, C);
    or (Y, w1, w2, w3);

endmodule

//Módulos con operadores lógicos
//Ejercicio 2 -1): Y=B'C'D'+AC'+AB'+AD'

module ope02_1(input wire A, B, C, D, output wire Y);

    assign Y = (~B & ~C & ~D) | (A & ~C) | (A & ~B) | (A & ~D);

endmodule

//Ejercicio 2 -2): Y=B'+A+C
module ope02_2(input wire A, B, C, output wire Y);

    assign Y = (~B) | (A) | (C);

endmodule

//Ejercicio 2 -3): Y=C'D+B+AD
module ope02_3(input wire A, B, C, D, output wire Y);

    assign Y = (~C & D) | (B) | (A & D);

endmodule

//Ejercicio 2 -4): Y=A'C'+B
module ope02_4(input wire A, B, C, output wire Y);

    assign Y = (~A & ~C) | (B);

endmodule