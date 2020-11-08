//José Alejandro Rodríguez Porras 19131
//Electrónica Digital 1
//Lab 10 Ejercicio 1
//Módulo con Program Counter, ROM de 4096x8 y Fetch
//Contador de 12 bits, con Load, Enabled y Reset
module up_counter(input clk, rst, Load, Enabled, input [11:0]Loadvalue, output [11:0]counter);
    reg [11:0] counter_up;
    // Load y reset asíncronos
    always @(posedge clk or posedge Load or posedge rst)
    // El reset pone todos los bits del contador en 0 de forma asíncrona
        begin
            if (rst)
                counter_up <= 12'b000000000000;
            // El Load asigna un valor específico(Loadvalue) al contador mientras Load sea igual a 1
            else if(Load)
                counter_up <= Loadvalue;
            //Mientras Enable sea igual a 1 el contador va sumando uno al valor previo, "va contando"
            else begin 
            //Si el contador llega a su valor máximo, es decir 4095 el siguiente valor que se le asigna es 0
                if (Enabled == 1 & counter_up == 12'b111111111111)
                    counter_up = 12'd0;
                //El contador cuenta
                else if (Enabled == 1)
                    counter_up <= counter_up + 12'd1;
            end    
    end
    //Se asigna el valor del contador a la salida
    assign counter = counter_up;
endmodule

//Memoria ROM de 4k x 8
//input es la dirección de memoria en la que se guarda el valor
//output es el dato que se almacena en la dirección
module ROM(input wire [11:0]direccion, output wire [7:0]data);
    reg [7:0] memoria[0:4095];
    initial begin 
    // readmemb lee el archivo lista y almacena sus datos en una variable
        $readmemb("lista.list", memoria);
    end
    //asignación del dato en la dirección de la memoria
    assign data = memoria[direccion];
endmodule

//Fetch (Flip flop D de 8 bits de entrada y 2 salidas de 4 bits)
module fetch(input clk, rst, enable, input [7:0]d, output reg [3:0]instr, output reg [3:0]oprnd);
    always @ (posedge clk or posedge rst) begin
        if (rst) begin
            instr <= 4'b0000;
            oprnd <= 4'b0000;
        end
        else if (enable) begin
            instr <= d[7:4];
            oprnd <= d[3:0];
        end
    end
endmodule

//Módulo con Program Counter de 12 bits, ROM de 4096x8 y Fetch de 8 bits
module count_rom_fetch(input rst, clk, enabled, load, input [11:0]loadvalue, output wire [7:0]program_byte, output wire [3:0]instr, output wire [3:0] oprnd);
    wire [11:0]counter;
    up_counter upcounter(clk, rst, load, enabled, loadvalue, counter);
    ROM rom(counter, program_byte);
    fetch FETCH(clk, rst, enabled, program_byte, instr, oprnd);
endmodule
