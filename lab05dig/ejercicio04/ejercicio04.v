//José Alejandro Rodríguez Porras 19131
//Electrónica Digital
//Lab 5 Ejercicio 4
//Módulo MUX 2:1
module mux21(input wire a0, a1, s0, output wire y);

    assign y = s0 ? a1 : a0;

endmodule

//Módulo MUX 4:1
module mux41(input wire a0, a1, a2, a3, s1, s0, output wire y);

    wire y1, y0;
    mux21 m2_1(a0, a1, s1, y1);
    mux21 m2_2(a2, a3, s1, y0);
    mux21 m2(y1, y0, s0, y);

endmodule

//Módulo MUX 8:1
module mux81(input wire a0, a1, a2 ,a3, a4, a5, a6, a7, s0, s1, s2, output wire y);

    wire y1, y0;
    mux41 m4_1(a0, a1, a2, a3, s2, s1, y1);
    mux41 m4_2(a4, a5, a6, a7, s2, s1, y0);
    mux21 m2(y1, y0, s0, y);

endmodule

//Tabla 1 MUX 8:1 
module t1_81(input wire A, B, C, output wire y);

    wire H, L;
    assign H = 1;
    assign L = 0;
    mux81 T1_8(L, H, H, L, H, L, L, H, A, B, C, y);

endmodule

//Tabla 1 MUX 4:1
module t1_41(input wire A, B, C, output wire y);

    mux41 T1_4(C, ~C, ~C, C, A, B, y);

endmodule

//Tabla 1 MUX 2:1
module t1_21(input wire A, B, C, output wire y);

    mux21 T1_2((B^C),~(B^C), A, y);

endmodule

//Tabla 2 MUX 8:1
module t2_81(input wire A, B, C, output wire y);

    wire H, L;
    assign H = 1;
    assign L = 0;
    mux81 T2_8(H, H, L, L, L, H, H, L, A, B, C, y);

endmodule

//Tabla 2 MUX 4:1
module t2_41(input wire A, B, C, output wire y);

    wire L;
    assign L = 0;
    mux41 T2_4(~C, L, C, ~C, B, A, y);

endmodule

//Tabla 2 MUX 2:1
module t2_21(input wire A, B, C, output wire y);

    mux21 T2_2(~B, ~(B & C), A, y);

endmodule

