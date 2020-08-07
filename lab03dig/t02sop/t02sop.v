//Alejandro Rodríguez 19131
//Lab 3 t2 sop
module gates(); //creación de módulo
//variables
reg A,B,C; //in variables
wire w1,w2,w3; //or out variables
wire n1,n2,n3; //not out variables
wire a1; //and out variable
not PnA(n1,A); //not gates para A, B y C
not PnB(n2,B);
not PnC(n3,C);
and Pw1(w1,n1,n2,C);//A'B'C
and Pw2(w2,A,B,n3);//ABC'
and Pw3(w3,A,B,C);//ABC
or Pa1(a1,w1,w2,w3);//Y2
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
        $dumpfile("t02sop_tb.vcd"); //se crea archivo vcd
        $dumpvars(0,gates);
    end
endmodule //fin del módulo