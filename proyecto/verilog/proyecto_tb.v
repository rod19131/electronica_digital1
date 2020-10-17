//José Alejandro Rodríguez Porras 19131
//Electrónica Digital
//Proyecto FSM
//Caja de velocidades automática con modo carrera
module testbench();
    //Declaración de variables
    reg clk, rst, RF, TM, SC, E, DM, AM, EnD;
    wire SV, TD, A, D,  ETD, TimerLED1, TimerLED2, TimerLED3, TimerLED4, TimerLED5, T1, T2, T3, T4, T5;
    wire [2:0]Vlm1;
    wire [2:0]Vlm2;
    wire [2:0]Vlm3;
    wire [2:0]Vlm4;
    wire [3:0]Vlm5;
    wire [5:0]dec;
    reg [1:0]SP;
    wire [1:0]S_MC; 
    wire [1:0]SF_MC;
    wire [2:0]VA;
    wire [2:0]ET;
    wire [3:0]S_C_V;
    wire [3:0]SF_C_V;
    //Llamar módulos de modo carrera y caja de velocidades respectivamente
    MC MC_FSM(clk, rst, SV, RF, TM, SC, E, SP, D, A, S_MC, SF_MC);
    C_Velocidad C_V_FSM(clk, rst, A, AM, D, DM, TD, T1, T2, T3, T4, T5, S_C_V, SF_C_V, VA, ET, SV, ETD);
    //Llamar a los módulos de decoder, timers y velocímetros para interpretar las salidas de la caja de velocidades
    Seleccionador SEL(ET, EnD, TimerLED1, TimerLED2, TimerLED3, TimerLED4, TimerLED5, dec);
    Timer_desacelerar T_DES(ETD, TD);
    Timer_a1 TA1(TimerLED1, T1, Vlm1);
    Timer_a2 TA2(TimerLED2, T2, Vlm2);
    Timer_a3 TA3(TimerLED3, T3, Vlm3);
    Timer_a4 TA4(TimerLED4, T4, Vlm4);
    Timer_a5 TA5(TimerLED5, VA, T5, Vlm5);
     initial begin
    #1 $display("RF TM SC SP E AM DM | VA  SV  ETD TimerLED1 TimerLED2 TimerLED3 TimerLED4 TimerLED5   Vlm1     Vlm2  Vlm3  Vlm4   Vlm5");
    $display("--------------------|----------------------------------------------------------------------------------------------------");
    $monitor("%b   %b  %b %b %b %b  %b  | %b  %b   %b      %b         %b         %b          %b           %b     %b      %b   %b   %b    %b", RF, TM, SC, SP, E, AM, DM, VA, SV, ETD, 
    TimerLED1, TimerLED2, TimerLED3, TimerLED4, TimerLED5, Vlm1, Vlm2, Vlm3, Vlm4, Vlm5);

     EnD = 1; clk = 0; rst = 1;  RF = 0; TM = 0; SC = 0; SP = 2'b00; E = 0; AM = 0;  DM = 0; 
    #1   rst = 1;
    #1   rst = 0;
    // Demostración de que el carro puede cambia de velocidades automáticamente al mantener el 
    //acelerador presionado (recorrido por cada una de las 6 velocidades)
    #2   RF = 0; TM = 0; SC = 0; SP = 2'b00; E = 0; AM = 1; DM = 0;
    //Demostración de que el carro permanece a velocidad constante y no cambia de velocidad en la caja
    //de velocidades al no presionar ni el acelerador o desacelerador manual
    #409 RF = 0; TM = 0; SC = 0; SP = 2'b00; E = 0; AM = 0; DM = 0;
    //Prueba de uso del desacelerador manual a través de las 6 velocidades (6a a 1a)
    #35  RF = 0; TM = 0; SC = 0; SP = 2'b00; E = 0; AM = 0; DM = 1;
    #295 RF = 0; TM = 0; SC = 0; SP = 2'b00; E = 0; AM = 0; DM = 0;
    #40  RF = 0; TM = 0; SC = 0; SP = 2'b00; E = 0; AM = 1; DM = 0;
    //Prueba de que el carro se puede quedar en una velocidad constante en cualquier velocidad
    //si no se presiona ni el acelerador o el desacelerador
    #160 RF = 0; TM = 0; SC = 0; SP = 2'b00; E = 0; AM = 0; DM = 0;
    //Prueba de que si se presionan el acelerador y el desacelerador manual de forma simultánea
    //el vehículo no cambiará de la velocidad actual 
    #40  RF = 0; TM = 0; SC = 0; SP = 2'b00; E = 0; AM = 1; DM = 0;
    #69  RF = 0; TM = 0; SC = 0; SP = 2'b00; E = 0; AM = 1; DM = 1;
    //Prueba de que si se estaba presionando el desacelerador manual y se presiona el acelerador
    //manual a la vez el vehículo deja de cambiar de velocidad y se queda en la última velocidad utilizada
    #40  RF = 0; TM = 0; SC = 0; SP = 2'b00; E = 0; AM = 0; DM = 1;
    #70  RF = 0; TM = 0; SC = 0; SP = 2'b00; E = 0; AM = 1; DM = 1;
    #70  RF = 0; TM = 0; SC = 0; SP = 2'b00; E = 0; AM = 0; DM = 0;
    //Prueba de que si se deja de desacelerar manualmente el vehículo permanece en la velocidad actual
    #30  RF = 0; TM = 0; SC = 0; SP = 2'b00; E = 0; AM = 0; DM = 1;
    #50  RF = 0; TM = 0; SC = 0; SP = 2'b00; E = 0; AM = 0; DM = 0;
    //Prueba de que el reset funciona como freno de mano, es decir estaciona el carro 
    //desde cualquier velocidad que es esté usando, es decir lo pone en velocidad 0 (estacionado)
    #150  RF = 0; TM = 0; SC = 0; SP = 2'b00; E = 0; AM = 1; DM = 0;
    #100 rst = 1; AM = 0;
    #1   rst = 0;
    #39  RF = 0; TM = 0; SC = 0; SP = 2'b00; E = 0; AM = 0; DM = 0;
    //Prueba de que al activar el enable la caja de velocidades se puede controlar
    // por medio de sensores que activan el acelerador o desacelerador automático
    
    // el carro arranca al identificar un carro a su lado o delantera
    #10  RF = 0; TM = 0; SC = 0; SP = 2'b00; E = 1; AM = 0; DM = 0;
    #10  RF = 0; TM = 0; SC = 0; SP = 2'b01; E = 1; AM = 0; DM = 0;
    // Evidencia de que el vehículo procura acelerar automáticamente independientemente
    // de si hay carros o no alrededor, y cuando no se encienden sensores críticos (SC, TM)
    // o desacelerador manual
    #40  RF = 0; TM = 0; SC = 0; SP = 2'b00; E = 1; AM = 0; DM = 0;
    #100 RF = 0; TM = 0; SC = 0; SP = 2'b10; E = 1; AM = 0; DM = 0;
    #100 RF = 0; TM = 0; SC = 0; SP = 2'b10; E = 1; AM = 0; DM = 0;
    #100 RF = 0; TM = 0; SC = 0; SP = 2'b11; E = 1; AM = 0; DM = 0;
    #100 RF = 0; TM = 0; SC = 0; SP = 2'b00; E = 1; AM = 0; DM = 0;
    //Prueba de que si se enciende un sensor crítico (SC, TM) el carro comienza a desacelerar automáticamente
    #300 RF = 0; TM = 1; SC = 0; SP = 2'b00; E = 1; AM = 0; DM = 0;
    #200 RF = 0; TM = 0; SC = 0; SP = 2'b00; E = 1; AM = 0; DM = 0;
    #80  RF = 0; TM = 0; SC = 0; SP = 2'b00; E = 1; AM = 0; DM = 0;
    //Prueba de que si se presiona el acelerador manual mientras un sensor crítico está 
    //encendido, el vehículo se mantendrá a velocidad constante
    #10  RF = 0; TM = 1; SC = 0; SP = 2'b00; E = 1; AM = 1; DM = 0;
    //Prueba de que si se presiona el desacelerador manual mientras un sensor crítico encendido
    //está activando el desacelerador automático el vehículo desacelera normalmente, y si llega a 3a. el 
    //vehículo continuará desacelerando.
    #100 RF = 0; TM = 1; SC = 0; SP = 2'b00; E = 1; AM = 0; DM = 1;
    #100 RF = 0; TM = 0; SC = 0; SP = 2'b10; E = 1; AM = 0; DM = 0;
    //Prueba del sensor de recta final en el vehículo
    #100 RF = 1; TM = 0; SC = 0; SP = 2'b00; E = 1; AM = 0; DM = 0;
    //Prueba del sensor de recta final junto con el sensor TM (motor caliente)
    #60  RF = 1; TM = 1; SC = 0; SP = 2'b00; E = 1; AM = 0; DM = 0;
    //Prueba del sensor de recta final junto con el sensor SC (Sensor curvas)
    #100 RF = 1; TM = 0; SC = 1; SP = 2'b00; E = 1; AM = 0; DM = 0;
    //Prueba de que con el enable E apagado la máquina de sensores deja de controlar el acelerador y desacelerador automático del vehículo 
    // volviendo a controlar el vehículo con el acelerador y desacelerador manual 
    #100 RF = 1; TM = 0; SC = 0; SP = 2'b10; E = 0; AM = 0; DM = 0;
    #100 RF = 1; TM = 1; SC = 1; SP = 2'b10; E = 0; AM = 0; DM = 1;
    #50  RF = 0; TM = 0; SC = 1; SP = 2'b10; E = 0; AM = 0; DM = 0;
    #50  RF = 0; TM = 0; SC = 1; SP = 2'b10; E = 0; AM = 0; DM = 0;
    #50  RF = 0; TM = 0; SC = 0; SP = 2'b10; E = 1; AM = 0; DM = 0;
    // Prueba de que si se enciende el sensor crítico de curvas y hay un carro atrás
    // del vehículo, el desacelerador automático se queda intermintente, es decir
    // no cambiará a una velocidad menor para prevenir un choque
    #160 RF = 0; TM = 0; SC = 1; SP = 2'b11; E = 1; AM = 0; DM = 0;
    #100 RF = 0; TM = 0; SC = 1; SP = 2'b00; E = 1; AM = 0; DM = 0;
    #100 rst = 1; 
    #1 rst = 0;
    #300 $finish;
     end
    always
        #5 clk = ~clk;
        //creación del archivo vcd
    initial begin
        $dumpfile("proyecto_tb.vcd");
        $dumpvars(0,testbench);
    end
endmodule