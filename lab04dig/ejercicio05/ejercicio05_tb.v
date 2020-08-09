// José Alejandro Rodríguez Porras 19131
//testbench
module testbench();

    //definir variables de inputs para cada ecuación
    reg gsopA, gsopV, gsopM, gposA, gposV, gposM, g5A, g5V, g5M,
    opsopA, opsopV, opsopM, opposA, opposV, opposM, op5A, op5V, op5M;
    wire gsopL, gposL, g5L, opsopL, opposL, op5L;
    //asignación de las variables a cada uno de los módulos
    //módulos con gate level modelling 
    gsop05 GS5(gsopA, gsopV, gsopM, gsopL);
    gpos05 GP5(gposA, gposV, gposM, gposL);
    g05 G5(g5A, g5V, g5M, g5L);

    //módulos con operadores lógicos
    opsop05 OPS5(opsopA, opsopV, opsopM, opsopL);
    oppos05 OPP5(opposA, opposV, opposM, opposL);
    op05 OP5(op5A, op5V, op5M, op5L);

    //Simulaciones de los módulos con gate level modelling
    //Simulación sop 
    initial begin
        $display("A B C | Y");
        $display("------|--");
        $monitor("%b %b %b | %b", gsopA, gsopV, gsopM, gsopL);
        gsopA = 0; gsopV = 0; gsopM = 0;
        #1 gsopA = 0; gsopV = 0; gsopM = 1;
        #1 gsopA = 0; gsopV = 1; gsopM = 0;
        #1 gsopA = 0; gsopV = 1; gsopM = 1;
        #1 gsopA = 1; gsopV = 0; gsopM = 0;
        #1 gsopA = 1; gsopV = 0; gsopM = 1;
        #1 gsopA = 1; gsopV = 1; gsopM = 0;
        #1 gsopA = 1; gsopV = 1; gsopM = 1;
    end

    //Simulación pos
    initial begin
        #8
        $display("\n");
        $display("A B C | Y");
        $display("------|--");
        $monitor("%b %b %b | %b", gposA, gposV, gposM, gposL);
        gposA = 0; gposV = 0; gposM = 0;
        #1 gposA = 0; gposV = 0; gposM = 1;
        #1 gposA = 0; gposV = 1; gposM = 0;
        #1 gposA = 0; gposV = 1; gposM = 1;
        #1 gposA = 1; gposV = 0; gposM = 0;
        #1 gposA = 1; gposV = 0; gposM = 1;
        #1 gposA = 1; gposV = 1; gposM = 0;
        #1 gposA = 1; gposV = 1; gposM = 1;
    end

    //Simulación ecuación minimizada
    initial begin
        #16
        $display("\n");
        $display("A B C | Y");
        $display("------|--");
        $monitor("%b %b %b | %b", g5A, g5V, g5M, g5L);
        g5A = 0; g5V = 0; g5M = 0;
        #1 g5A = 0; g5V = 0; g5M = 1;
        #1 g5A = 0; g5V = 1; g5M = 0;
        #1 g5A = 0; g5V = 1; g5M = 1;
        #1 g5A = 1; g5V = 0; g5M = 0;
        #1 g5A = 1; g5V = 0; g5M = 1;
        #1 g5A = 1; g5V = 1; g5M = 0;
        #1 g5A = 1; g5V = 1; g5M = 1;
    end

    //Simulación de los módulos con behavioral modelling
    //Simulación sop
    initial begin
        #24
        $display("\n");
        $display("A B C | Y");
        $display("------|--");
        $monitor("%b %b %b | %b", opsopA, opsopV, opsopM, opsopL);
        opsopA = 0; opsopV = 0; opsopM = 0;
        #1 opsopA = 0; opsopV = 0; opsopM = 1;
        #1 opsopA = 0; opsopV = 1; opsopM = 0;
        #1 opsopA = 0; opsopV = 1; opsopM = 1;
        #1 opsopA = 1; opsopV = 0; opsopM = 0;
        #1 opsopA = 1; opsopV = 0; opsopM = 1;
        #1 opsopA = 1; opsopV = 1; opsopM = 0;
        #1 opsopA = 1; opsopV = 1; opsopM = 1;
    end

    //Simulación pos
    initial begin
        #32
        $display("\n");
        $display("A B C | Y");
        $display("------|--");
        $monitor("%b %b %b | %b", opposA, opposV, opposM, opposL);
        opposA = 0; opposV = 0; opposM = 0;
        #1 opposA = 0; opposV = 0; opposM = 1;
        #1 opposA = 0; opposV = 1; opposM = 0;
        #1 opposA = 0; opposV = 1; opposM = 1;
        #1 opposA = 1; opposV = 0; opposM = 0;
        #1 opposA = 1; opposV = 0; opposM = 1;
        #1 opposA = 1; opposV = 1; opposM = 0;
        #1 opposA = 1; opposV = 1; opposM = 1;
    end

    //Simulación ecuación minimizada
    initial begin
        #40
        $display("\n");
        $display("A B C | Y");
        $display("------|--");
        $monitor("%b %b %b | %b", op5A, op5V, op5M, op5L);
        op5A = 0; op5V = 0; op5M = 0;
        #1 op5A = 0; op5V = 0; op5M = 1;
        #1 op5A = 0; op5V = 1; op5M = 0;
        #1 op5A = 0; op5V = 1; op5M = 1;
        #1 op5A = 1; op5V = 0; op5M = 0;
        #1 op5A = 1; op5V = 0; op5M = 1;
        #1 op5A = 1; op5V = 1; op5M = 0;
        #1 op5A = 1; op5V = 1; op5M = 1;
    end

    initial
    #49 $finish;

//generación del archivo vcd  
  initial begin
    $dumpfile("ejercicio05_tb.vcd");
    $dumpvars(0, testbench);
  end
  
endmodule