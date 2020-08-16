//José Alejandro Rodríguez Porras 19131
//testbench
module testbench();

//definir variables de inputs para cada ecuación
    reg t1_A8, t1_B8, t1_C8, t1_A4, t1_B4, t1_C4, t1_A2, t1_B2, t1_C2,
    t2_A8, t2_B8, t2_C8, t2_A4, t2_B4, t2_C4, t2_A2, t2_B2, t2_C2;
    wire t1_Y8, t1_Y4, t1_Y2, t2_Y8, t2_Y4, t2_Y2;

 //asignación de las variables a cada uno de los módulos de los mux de cada tabla
 //Tabla 1  
    t1_81 T1_8(t1_A8, t1_B8, t1_C8, t1_Y8);
    t1_41 T1_4(t1_A4, t1_B4, t1_C4, t1_Y4);
    t1_21 T1_2(t1_A2, t1_B2, t1_C2, t1_Y2);

//Tabla 2
    t2_81 T2_8(t2_A8, t2_B8, t2_C8, t2_Y8);
    t2_41 T2_4(t2_A4, t2_B4, t2_C4, t2_Y4);
    t2_21 T2_2(t2_A2, t2_B2, t2_C2, t2_Y2);

//Simulación Tabla 1 MUX 8:1
    initial begin
        $display("\n");
        $display("Tabla 1 MUX 8:1");
        $display("A B C | Y");
        $display("------|--");
        $monitor("%b %b %b | %b", t1_A8, t1_B8, t1_C8, t1_Y8);
        t1_A8 = 0; t1_B8 = 0; t1_C8 = 0;
        #1 t1_A8 = 0; t1_B8 = 0; t1_C8 = 1;
        #1 t1_A8 = 0; t1_B8 = 1; t1_C8 = 0;
        #1 t1_A8 = 0; t1_B8 = 1; t1_C8 = 1;
        #1 t1_A8 = 1; t1_B8 = 0; t1_C8 = 0;
        #1 t1_A8 = 1; t1_B8 = 0; t1_C8 = 1;
        #1 t1_A8 = 1; t1_B8 = 1; t1_C8 = 0;
        #1 t1_A8 = 1; t1_B8 = 1; t1_C8 = 1;
    end

//Simulación Tabla 1 MUX 4:1
    initial begin
        #8
        $display("\n");
        $display("Tabla 1 MUX 4:1");
        $display("A B C | Y");
        $display("------|--");
        $monitor("%b %b %b | %b", t1_A4, t1_B4, t1_C4, t1_Y4);
        t1_A4 = 0; t1_B4 = 0; t1_C4 = 0;
        #1 t1_A4 = 0; t1_B4 = 0; t1_C4 = 1;
        #1 t1_A4 = 0; t1_B4 = 1; t1_C4 = 0;
        #1 t1_A4 = 0; t1_B4 = 1; t1_C4 = 1;
        #1 t1_A4 = 1; t1_B4 = 0; t1_C4 = 0;
        #1 t1_A4 = 1; t1_B4 = 0; t1_C4 = 1;
        #1 t1_A4 = 1; t1_B4 = 1; t1_C4 = 0;
        #1 t1_A4 = 1; t1_B4 = 1; t1_C4 = 1;
    end

//Simulación Tabla 1 MUX 2:1
    initial begin
        #16
        $display("\n");
        $display("Tabla 1 MUX 2:1");
        $display("A B C | Y");
        $display("------|--");
        $monitor("%b %b %b | %b", t1_A2, t1_B2, t1_C2, t1_Y2);
        t1_A2 = 0; t1_B2 = 0; t1_C2 = 0;
        #1 t1_A2 = 0; t1_B2 = 0; t1_C2 = 1;
        #1 t1_A2 = 0; t1_B2 = 1; t1_C2 = 0;
        #1 t1_A2 = 0; t1_B2 = 1; t1_C2 = 1;
        #1 t1_A2 = 1; t1_B2 = 0; t1_C2 = 0;
        #1 t1_A2 = 1; t1_B2 = 0; t1_C2 = 1;
        #1 t1_A2 = 1; t1_B2 = 1; t1_C2 = 0;
        #1 t1_A2 = 1; t1_B2 = 1; t1_C2 = 1;
    end

//Simulación Tabla 2 MUX 8:1
    initial begin
        #24
        $display("\n");
        $display("Tabla 2 MUX 8:1");
        $display("A B C | Y");
        $display("------|--");
        $monitor("%b %b %b | %b", t2_A8, t2_B8, t2_C8, t2_Y8);
        t2_A8 = 0; t2_B8 = 0; t2_C8 = 0;
        #1 t2_A8 = 0; t2_B8 = 0; t2_C8 = 1;
        #1 t2_A8 = 0; t2_B8 = 1; t2_C8 = 0;
        #1 t2_A8 = 0; t2_B8 = 1; t2_C8 = 1;
        #1 t2_A8 = 1; t2_B8 = 0; t2_C8 = 0;
        #1 t2_A8 = 1; t2_B8 = 0; t2_C8 = 1;
        #1 t2_A8 = 1; t2_B8 = 1; t2_C8 = 0;
        #1 t2_A8 = 1; t2_B8 = 1; t2_C8 = 1;
    end

//Simulación Tabla 2 MUX 4:1
    initial begin
        #32
        $display("\n");
        $display("Tabla 2 MUX 4:1");
        $display("A B C | Y");
        $display("------|--");
        $monitor("%b %b %b | %b", t2_A4, t2_B4, t2_C4, t2_Y4);
        t2_A4 = 0; t2_B4 = 0; t2_C4 = 0;
        #1 t2_A4 = 0; t2_B4 = 0; t2_C4 = 1;
        #1 t2_A4 = 0; t2_B4 = 1; t2_C4 = 0;
        #1 t2_A4 = 0; t2_B4 = 1; t2_C4 = 1;
        #1 t2_A4 = 1; t2_B4 = 0; t2_C4 = 0;
        #1 t2_A4 = 1; t2_B4 = 0; t2_C4 = 1;
        #1 t2_A4 = 1; t2_B4 = 1; t2_C4 = 0;
        #1 t2_A4 = 1; t2_B4 = 1; t2_C4 = 1;
    end

//Simulación Tabla 2 MUX 2:1
    initial begin
        #40
        $display("\n");
        $display("Tabla 2 MUX 2:1");
        $display("A B C | Y");
        $display("------|--");
        $monitor("%b %b %b | %b", t2_A2, t2_B2, t2_C2, t2_Y2);
        t2_A2 = 0; t2_B2 = 0; t2_C2 = 0;
        #1 t2_A2 = 0; t2_B2 = 0; t2_C2 = 1;
        #1 t2_A2 = 0; t2_B2 = 1; t2_C2 = 0;
        #1 t2_A2 = 0; t2_B2 = 1; t2_C2 = 1;
        #1 t2_A2 = 1; t2_B2 = 0; t2_C2 = 0;
        #1 t2_A2 = 1; t2_B2 = 0; t2_C2 = 1;
        #1 t2_A2 = 1; t2_B2 = 1; t2_C2 = 0;
        #1 t2_A2 = 1; t2_B2 = 1; t2_C2 = 1;
    end
    
    initial
    #48 $finish;

    initial begin
        $dumpfile("ejercicio04_tb.vcd");
        $dumpvars(0,testbench);
    end

endmodule
    