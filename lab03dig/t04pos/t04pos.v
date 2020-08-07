//Alejandro Rodríguez 19131
//Lab 3 t4 pos
module gates(); //creación de módulo
//variables
reg A,B,C,D; //in variables
wire w1,w2,w3,w4,w5,w6,w7,w8,w9; //or out variables
wire n1,n2,n3,n4; //not out variables
wire a1; //and out variable
not PnA(n1,A); //not gates para A, B, C y D
not PnB(n2,B);
not PnC(n3,C);
not PnD(n4,D);
or Pw1(w1,A,B,C,n4);//A+B+C+D'
or Pw2(w2,A,n2,C,D);//A+B'+C+D
or Pw3(w3,A,n2,C,n4);//A+B'+C+D'
or Pw4(w4,n1,B,C,n4);//A'+B+C+D'
or Pw5(w5,n1,B,n3,n4);//A'+B+C'+D'
or Pw6(w6,n1,n2,C,D);//A'+B'+C+D
or Pw7(w7,n1,n2,C,n4);//A'+B'+C+D'
or Pw8(w8,n1,n2,n3,D);//A'+B'+C'+D
or Pw9(w9,n1,n2,n3,n4);//A'+B'+C'+D'
and Pa1(a1,w1,w2,w3,w4,w5,w6,w7,w8,w9);//Y4
//comienzo
initial begin
    $display("A B C D | Y");
    $display("-----------");
    $monitor("%b %b %b %b | %b", A, B, C, D, a1);
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
        $dumpfile("t04pos_tb.vcd"); //se crea archivo vcd
        $dumpvars(0,gates);
    end
endmodule //fin del módulo