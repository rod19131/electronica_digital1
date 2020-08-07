//Alejandro Rodríguez 19131
//Lab 3 t2 pos
module gates(); //creación de módulo
//variables
reg A,B,C; //in variables
wire w1,w2,w3,w4,w5; //or out variables
wire n1,n2,n3; //not out variables
wire a1; //or out variable
not PnA(n1,A); //not gates para A, B y C
not PnB(n2,B);
not PnC(n3,C);
or Pw1(w1,A,B,C);//A+B+C 
or Pw2(w2,A,n2,C);//A+B'+C
or Pw3(w3,A,n2,n3);//A+B'+C'
or Pw4(w4,n1,B,C);//A'+B+C
or Pw5(w5,n1,B,n3);//A'+B+C'
and Pa1(a1,w1,w2,w3,w4,w5);//Y2
//comienzo
initial begin
    $display("A B C | Y");
    $display("---------");
    $monitor("%b %b %b | %b", A, B, C, a1);
    //condición inicial
    A = 0; B = 0; C = 0;
    //simulación combinaciones
    #1 C = 1;
    #1 B = 1; C = 0;
    #1 C = 1;
    #1 A = 1; B = 0; C = 0;
    #1 C = 1;
    #1 B = 1; C = 0;
    #1 C = 1;
    #1 $finish; //final de la simulación
end
initial
    begin
        $dumpfile("t02pos_tb.vcd"); //se crea archivo vcd
        $dumpvars(0,gates);
    end
endmodule //fin del módulo