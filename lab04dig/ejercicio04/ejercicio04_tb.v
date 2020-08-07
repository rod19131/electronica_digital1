// José Alejandro Rodríguez Porras 19131
//testbench
module testbench();

//definir variables de inputs para cada ecuación
    reg e1A1, e1B1, e1C1, e1A2, e1B2, e1C2, e1A3, e1B3, e1C3, e1D3, e1A4, e1B4, e1C4, e1D4, e2A1, e2B1, e2C1, e2D1, e2A2, e2B2, e2C2,
    e2A3, e2B3, e2C3, e2D3, e2A4, e2B4, e2C4;
    wire e1Y1, e1Y2, e1Y3, e1Y4, e2Y1, e2Y2, e2Y3, e2Y4;

 //asignación de las variables a cada uno de los módulos
 //módulos con gate level modelling   
    gle01_1 GE1_1(e1A1, e1B1, e1C1, e1Y1);
    gle01_2 GE1_2(e1A2, e1B2, e1C2, e1Y2);
    gle01_3 GE1_3(e1A3, e1B3, e1C3, e1D3, e1Y3);
    gle01_4 GE1_4(e1A4, e1B4, e1C4, e1D4, e1Y4);
//módulos con operadores lógicos
    ope02_1 OPE2_1(e2A1, e2B1, e2C1, e2D1, e2Y1);
    ope02_2 OPE2_2(e2A2, e2B2, e2C2, e2Y2);
    ope02_3 OPE2_3(e2A3, e2B3, e2C3, e2D3, e2Y3);
    ope02_4 OPE2_4(e2A4, e2B4, e2C4, e2Y4);

//Simulación Ejercicio 1 Ecuación 1
    initial begin
        $display("A B C | Y");
        $display("------|--");
        $monitor("%b %b %b | %b", e1A1, e1B1, e1C1, e1Y1);
        e1A1 = 0; e1B1 = 0; e1C1 = 0;
        #1 e1A1 = 0; e1B1 = 0; e1C1 = 1;
        #1 e1A1 = 0; e1B1 = 1; e1C1 = 0;
        #1 e1A1 = 0; e1B1 = 1; e1C1 = 1;
        #1 e1A1 = 1; e1B1 = 0; e1C1 = 0;
        #1 e1A1 = 1; e1B1 = 0; e1C1 = 1;
        #1 e1A1 = 1; e1B1 = 1; e1C1 = 0;
        #1 e1A1 = 1; e1B1 = 1; e1C1 = 1;
    end

//Simulación Ejercicio 1 Ecuación 2
    initial begin
        #8
        $display("\n");
        $display("A B C | Y");
        $display("------|--");
        $monitor("%b %b %b | %b", e1A2, e1B2, e1C2, e1Y2);
        e1A2 = 0; e1B2 = 0; e1C2 = 0;
        #1 e1A2 = 0; e1B2 = 0; e1C2 = 1;
        #1 e1A2 = 0; e1B2 = 1; e1C2 = 0;
        #1 e1A2 = 0; e1B2 = 1; e1C2 = 1;
        #1 e1A2 = 1; e1B2 = 0; e1C2 = 0;
        #1 e1A2 = 1; e1B2 = 0; e1C2 = 1;
        #1 e1A2 = 1; e1B2 = 1; e1C2 = 0;
        #1 e1A2 = 1; e1B2 = 1; e1C2 = 1;
    end

    //Simulación Ejercicio 1 Ecuación 3
    initial begin
        #16
        $display("\n");
        $display("A B C D | Y");
        $display("--------|--");
        $monitor("%b %b %b %b | %b", e1A3, e1B3, e1C3, e1D3, e1Y3);
        e1A3 = 0; e1B3 = 0; e1C3 = 0; e1D3 = 0;
        #1 e1A3 = 0; e1B3 = 0; e1C3 = 0; e1D3 = 1;
        #1 e1A3 = 0; e1B3 = 0; e1C3 = 1; e1D3 = 0;
        #1 e1A3 = 0; e1B3 = 0; e1C3 = 1; e1D3 = 1;
        #1 e1A3 = 0; e1B3 = 1; e1C3 = 0; e1D3 = 0;
        #1 e1A3 = 0; e1B3 = 1; e1C3 = 0; e1D3 = 1;
        #1 e1A3 = 0; e1B3 = 1; e1C3 = 1; e1D3 = 0;
        #1 e1A3 = 0; e1B3 = 1; e1C3 = 1; e1D3 = 1;
        #1 e1A3 = 1; e1B3 = 0; e1C3 = 0; e1D3 = 0;
        #1 e1A3 = 1; e1B3 = 0; e1C3 = 0; e1D3 = 1;
        #1 e1A3 = 1; e1B3 = 0; e1C3 = 1; e1D3 = 0;
        #1 e1A3 = 1; e1B3 = 0; e1C3 = 1; e1D3 = 1;
        #1 e1A3 = 1; e1B3 = 1; e1C3 = 0; e1D3 = 0;
        #1 e1A3 = 1; e1B3 = 1; e1C3 = 0; e1D3 = 1;
        #1 e1A3 = 1; e1B3 = 1; e1C3 = 1; e1D3 = 0;
        #1 e1A3 = 1; e1B3 = 1; e1C3 = 1; e1D3 = 1;
    end

//Simulación Ejercicio 1 Ecuación 4
    initial begin
        #32
        $display("\n");
        $display("A B C D | Y");
        $display("--------|--");
        $monitor("%b %b %b %b | %b", e1A4, e1B4, e1C4, e1D4, e1Y4);
        e1A4 = 0; e1B4 = 0; e1C4 = 0; e1D4 = 0;
        #1 e1A4 = 0; e1B4 = 0; e1C4 = 0; e1D4 = 1;
        #1 e1A4 = 0; e1B4 = 0; e1C4 = 1; e1D4 = 0;
        #1 e1A4 = 0; e1B4 = 0; e1C4 = 1; e1D4 = 1;
        #1 e1A4 = 0; e1B4 = 1; e1C4 = 0; e1D4 = 0;
        #1 e1A4 = 0; e1B4 = 1; e1C4 = 0; e1D4 = 1;
        #1 e1A4 = 0; e1B4 = 1; e1C4 = 1; e1D4 = 0;
        #1 e1A4 = 0; e1B4 = 1; e1C4 = 1; e1D4 = 1;
        #1 e1A4 = 1; e1B4 = 0; e1C4 = 0; e1D4 = 0;
        #1 e1A4 = 1; e1B4 = 0; e1C4 = 0; e1D4 = 1;
        #1 e1A4 = 1; e1B4 = 0; e1C4 = 1; e1D4 = 0;
        #1 e1A4 = 1; e1B4 = 0; e1C4 = 1; e1D4 = 1;
        #1 e1A4 = 1; e1B4 = 1; e1C4 = 0; e1D4 = 0;
        #1 e1A4 = 1; e1B4 = 1; e1C4 = 0; e1D4 = 1;
        #1 e1A4 = 1; e1B4 = 1; e1C4 = 1; e1D4 = 0;
        #1 e1A4 = 1; e1B4 = 1; e1C4 = 1; e1D4 = 1;
    end

//Simulación Ejercicio 2 Ecuación 1
    initial begin
        #48
        $display("\n");
        $display("A B C D | Y");
        $display("--------|--");
        $monitor("%b %b %b %b | %b", e2A1, e2B1, e2C1, e2D1, e2Y1);
        e2A1 = 0; e2B1 = 0; e2C1 = 0; e2D1 = 0;
        #1 e2A1 = 0; e2B1 = 0; e2C1 = 0; e2D1 = 1;
        #1 e2A1 = 0; e2B1 = 0; e2C1 = 1; e2D1 = 0;
        #1 e2A1 = 0; e2B1 = 0; e2C1 = 1; e2D1 = 1;
        #1 e2A1 = 0; e2B1 = 1; e2C1 = 0; e2D1 = 0;
        #1 e2A1 = 0; e2B1 = 1; e2C1 = 0; e2D1 = 1;
        #1 e2A1 = 0; e2B1 = 1; e2C1 = 1; e2D1 = 0;
        #1 e2A1 = 0; e2B1 = 1; e2C1 = 1; e2D1 = 1;
        #1 e2A1 = 1; e2B1 = 0; e2C1 = 0; e2D1 = 0;
        #1 e2A1 = 1; e2B1 = 0; e2C1 = 0; e2D1 = 1;
        #1 e2A1 = 1; e2B1 = 0; e2C1 = 1; e2D1 = 0;
        #1 e2A1 = 1; e2B1 = 0; e2C1 = 1; e2D1 = 1;
        #1 e2A1 = 1; e2B1 = 1; e2C1 = 0; e2D1 = 0;
        #1 e2A1 = 1; e2B1 = 1; e2C1 = 0; e2D1 = 1;
        #1 e2A1 = 1; e2B1 = 1; e2C1 = 1; e2D1 = 0;
        #1 e2A1 = 1; e2B1 = 1; e2C1 = 1; e2D1 = 1;
    end

//Simulación Ejercicio 2 Ecuación 2
    initial begin
        #64
        $display("\n");
        $display("A B C | Y");
        $display("------|--");
        $monitor("%b %b %b | %b", e2A2, e2B2, e2C2, e2Y2);
        e2A2 = 0; e2B2 = 0; e2C2 = 0;
        #1 e2A2 = 0; e2B2 = 0; e2C2 = 1;
        #1 e2A2 = 0; e2B2 = 1; e2C2 = 0;
        #1 e2A2 = 0; e2B2 = 1; e2C2 = 1;
        #1 e2A2 = 1; e2B2 = 0; e2C2 = 0;
        #1 e2A2 = 1; e2B2 = 0; e2C2 = 1;
        #1 e2A2 = 1; e2B2 = 1; e2C2 = 0;
        #1 e2A2 = 1; e2B2 = 1; e2C2 = 1;
    end

//Simulación Ejercicio 2 Ecuación 3
    initial begin
        #72
        $display("\n");
        $display("A B C D | Y");
        $display("--------|--");
        $monitor("%b %b %b %b | %b", e2A3, e2B3, e2C3, e2D3, e2Y3);
        e2A3 = 0; e2B3 = 0; e2C3 = 0; e2D3 = 0;
        #1 e2A3 = 0; e2B3 = 0; e2C3 = 0; e2D3 = 1;
        #1 e2A3 = 0; e2B3 = 0; e2C3 = 1; e2D3 = 0;
        #1 e2A3 = 0; e2B3 = 0; e2C3 = 1; e2D3 = 1;
        #1 e2A3 = 0; e2B3 = 1; e2C3 = 0; e2D3 = 0;
        #1 e2A3 = 0; e2B3 = 1; e2C3 = 0; e2D3 = 1;
        #1 e2A3 = 0; e2B3 = 1; e2C3 = 1; e2D3 = 0;
        #1 e2A3 = 0; e2B3 = 1; e2C3 = 1; e2D3 = 1;
        #1 e2A3 = 1; e2B3 = 0; e2C3 = 0; e2D3 = 0;
        #1 e2A3 = 1; e2B3 = 0; e2C3 = 0; e2D3 = 1;
        #1 e2A3 = 1; e2B3 = 0; e2C3 = 1; e2D3 = 0;
        #1 e2A3 = 1; e2B3 = 0; e2C3 = 1; e2D3 = 1;
        #1 e2A3 = 1; e2B3 = 1; e2C3 = 0; e2D3 = 0;
        #1 e2A3 = 1; e2B3 = 1; e2C3 = 0; e2D3 = 1;
        #1 e2A3 = 1; e2B3 = 1; e2C3 = 1; e2D3 = 0;
        #1 e2A3 = 1; e2B3 = 1; e2C3 = 1; e2D3 = 1;
    end

//Simulación Ejercicio 2 Ecuación 4
    initial begin
        #88
        $display("\n");
        $display("A B C | Y");
        $display("------|--");
        $monitor("%b %b %b | %b", e2A4, e2B4, e2C4, e2Y4);
        e2A4 = 0; e2B4 = 0; e2C4 = 0;
        #1 e2A4 = 0; e2B4 = 0; e2C4 = 1;
        #1 e2A4 = 0; e2B4 = 1; e2C4 = 0;
        #1 e2A4 = 0; e2B4 = 1; e2C4 = 1;
        #1 e2A4 = 1; e2B4 = 0; e2C4 = 0;
        #1 e2A4 = 1; e2B4 = 0; e2C4 = 1;
        #1 e2A4 = 1; e2B4 = 1; e2C4 = 0;
        #1 e2A4 = 1; e2B4 = 1; e2C4 = 1;
    end

    initial
    #97 $finish;
  
  initial begin
    $dumpfile("ejercicio04_tb.vcd");
    $dumpvars(0, testbench);
  end
  
endmodule
