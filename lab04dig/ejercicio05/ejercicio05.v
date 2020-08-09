//José Alejandro Rodríguez Porras 19131
//Electrónica Digital
//Lab 4 Ejercicio 5
//Variables:
//A = Sistema de Alarma : 1 = armado
//V = sensor de ventana/puerta : 1 = OK
//M = sensor de movimiento : 0 = no movimiento
//L = Alarma y luces encendidas : 1 = se enciende
//Módulos con Gate Level Modelling
//SOP = AV'M'+AV'M+AVM
module gsop05(input wire A, V, M, output wire L);

    wire nv, nm, w1, w2, w3;
    
    not (nv, V);
    not (nm, M);
    and (w1, A, nv, nm);
    and (w2, A, nv, M);
    and (w3, A, V, M);
    or (L, w1, w2, w3);

endmodule

//POS = (A+V+M)*(A+V+M')*(A+V'+M)*(A+V'+M')*(A'+V'+M)
module gpos05(input wire A, V, M, output wire L);

    wire na, nv, nm, w1, w2, w3, w4, w5;
    
    not (na, A);
    not (nv, V);
    not (nm, M);
    or (w1, A, V, M);
    or (w2, A, V, nm);
    or (w3, A, nv, M);
    or (w4, A, nv, nm);
    or (w5, na, nv, M);
    and (L, w1, w2, w3, w4, w5);

endmodule

//Ecuación minimizada con mapa de Karnaugh: Y = AV'+AM
module g05(input wire A, V, M, output wire L);

    wire nv, w1, w2;

    not (nv, V);
    and (w1, A, nv);
    and (w2, A, M);
    or (L, w1, w2);

endmodule

//Módulos con Behavioral Modelling
//SOP = AV'M'+AV'M+AVM
module opsop05(input wire A, V, M, output wire L);

    assign L = (A & ~V & ~M) | (A & ~V & M) | (A & V & M);

endmodule

//POS = (A+V+M)*(A+V+M')*(A+V'+M)*(A+V'+M')*(A'+V'+M)
 module oppos05(input wire A, V, M, output wire L);

    assign L = (A | V | M) & (A | V | ~M) & (A | ~V | M) & (A | ~V | ~M) & (~A | ~V | M);

endmodule

//Ecuación minimizada con mapa de Karnaugh: Y = AV'+AM
module op05(input wire A, V, M, output L);

    assign L = (A & ~V) | (A & M);

endmodule