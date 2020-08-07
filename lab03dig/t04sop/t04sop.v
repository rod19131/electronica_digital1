//Alejandro Rodríguez 19131
//Lab 3 t4 sop
module gates(); //creación de módulo
//variables
reg A,B,C,D; //in variables
wire w1,w2,w3,w4,w5,w6,w7; //or out variables
wire n1,n2,n3,n4; //not out variables
wire r1; //and out variable
not PnA(n1,A); //not gates para A, B, C y D
not PnB(n2,B);
not PnC(n3,C);
not PnD(n4,D);
and Pw1(w1,n1,n2,n3,n4);//A'+B'+C+D
and Pw2(w2,n1,n2,C,n4);//A+B+C+D
and Pw3(w3,n1,n2,C,D);//A+B+C+D
and Pw4(w4,n1,B,C,n4);//A+B+C+D
and Pw5(w5,n1,B,C,D);//A+B+C+D
and Pw6(w6,A,n2,n3,n4);//A+B+C+D
and Pw7(w7,A,n2,C,n4);//A+B+C+D
or Pr1(r1,w1,w2,w3,w4,w5,w6,w7);//Y3
//comienzo
initial begin
    $display("A B C D | Y");
    $display("-----------");
    $monitor("%b %b %b %b | %b", A, B, C, D, r1);
    //condición inicial
    A = 0; B = 0; C = 0; D = 0;
    //simulación combinaciones
    #1 D = 1;
    #1 C = 1; D = 0;
    #1 D = 1;
    #1 B = 1; C = 0; D = 0;
    #1 D = 1;
    #1 C = 1; D = 0;
    #1 D = 1;
    #1 A = 1; B = 0; C = 0; D = 0;
    #1 D = 1;
    #1 C = 1; D = 0;
    #1 D = 1;
    #1 B = 1; C = 0; D = 0;
    #1 D = 1;
    #1 C = 1; D = 0;
    #1 D = 1;
    #1 $finish; //final de la simulación
end
initial
    begin
        $dumpfile("t04sop_tb.vcd"); //se crea archivo vcd
        $dumpvars(0,gates);
    end
endmodule //fin del módulo