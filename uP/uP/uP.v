//José Alejandro Rodríguez Porras 19131
//Electrónica Digital 1
//Proyecto 2 uP
//Módulo del flip flop D de 1 bit
module FFD1(input clk, rst, enable, d, output reg q);
    always @ (posedge clk or posedge rst) begin
        if (rst)
            q <= 0;
        else if (enable)
            q <= d;
        end 
endmodule
//Módulo del flip flop D de 2 bits
module FFD2(input clk, rst, enable, input [1:0]d, output reg [1:0]q);
    always @ (posedge clk or posedge rst) begin
        if (rst)
            q <= 2'b0;
        else if (enable)
            q <= d;
        end 
endmodule
//Módulo del flip flop D de 4 bits
module FFD4(input clk, rst, enable, input [3:0]d, output reg [3:0]q);
    always @ (posedge clk or posedge rst) begin
        if (rst)
            q <= 4'b0;
        else if (enable)
            q <= d;
        end 
endmodule

//Módulo del flip flop de 8 bits con dos salidas separadas de 4 bits
module FFD8(input wire clk, rst, enable, input wire [7:0]d, output wire [3:0]q1, output wire [3:0]q0);
    FFD4 f1(clk, rst, enable, d[7:4], q1);
    FFD4 f2(clk, rst, enable, d[3:0], q0);
endmodule

//Flip Flop tipo T con Enable para el Phase
module FFT(input wire clk, rst, enable, output wire q);
    FFD1 ffd1(clk, rst, enable, ~q, q);
endmodule

//Buffer Triestado de 4 bits
module tribuf4(input wire enable, input wire [3:0]in, output wire [3:0]out);
    assign out = (enable) ? in:4'bz;
endmodule

//Módulo del counter
module upcounter(input clk, rst, enabled, load, input [11:0]loadvalue, output reg [11:0]counter);
    // reset asíncrono
    always @ (posedge clk or posedge rst) begin
        if (rst)
            counter = 12'b0;
            // El reset pone todos los bits en 0.
        else if (load)
            counter = loadvalue;
            // El Load asigna un valor específico(Loadvalue) al contador mientras Load sea igual a 1
        else if (enabled)
            counter = counter + 1;
            //Mientras el enabled esté activado el counter sube 1 cada flanco positivo de reloj
    end

endmodule

//Memoria ROM de 4k x 8
//input es la dirección de memoria en la que se guarda el valor
//output es el dato que se almacena en la dirección
module rom(input wire [11:0]direccion, output wire [7:0]data);
    reg [7:0] memoria[0:4095];
    initial begin 
    // readmemb lee el archivo lista y almacena sus datos en una variable
        $readmemh("memory.list", memoria);
    end
    //asignación del dato en la dirección de la memoria
    assign data = memoria[direccion];
endmodule

//ALU de 4 bits del proyecto con inputs A, B como operandos, y op para elegir la operación que se desea realizar
//C y Zero son las banderas que se activan cuando hay overflow o la salida es 0 respectivamente
//S representa la salida de la ALU
module alu(input [3:0] A, B, input [2:0] op, output C, Zero, output [3:0]out);
    //Variable interna de salida de la operación
    //El quinto bit es para indicar overflow
    reg [4:0] pseudoout;
    //case para realizar la operación indicada dependiendo de la combinación de op y se actualiza cada vez que cambia A, B o op.
    always @ (A, B, op)
        case (op)
            3'b000: pseudoout = A; //Dejar pasar A
            3'b001: pseudoout = A - B; //Comparar A y B (Resta A-B)
            3'b010: pseudoout = B; //Dejar pasar B
            3'b011: pseudoout = A + B; // Sumar A y B
            3'b100: pseudoout = {1'b0, ~(A & B)}; //NAND entre a y B
            default: pseudoout = 5'b10101; //Default
        endcase
    //Asignación de las salidas con los bits de la variable interna de operación
    //Asigna del bit 4 al 0 de la variable interna a la salida de la ALU
    assign out = pseudoout[3:0];
    //Asigna el bit 5 para la bandera de carry cuando hay overflow
    assign C = pseudoout[4];
    //Identifica cuando el bit 4 al 0 todos son 0s, es decir la bandera Zero solo se activa cuando la salida de la operación es 0000.
    assign Zero = ~(pseudoout[3] | pseudoout[2] | pseudoout[1] | pseudoout[0]);
    
endmodule

//Módulo del decode, con el que se controlan todas las señales del procesador
//los inputs son los bits de instruccion, carry, zero y phase concatenados
//los outputs son para incPC, loadPC, loadA, loadFlags, S2, S1, S0, csRAM, weRAM, oeALU, oeIN, oeOprnd, loadOut respectivamente
//con lo que se controlan muchos de los enables de cada submódulos
//Es como el cerebro del microprocesador debido a que con este se controlan todas las señales
module decode(input [6:0]direccion, output [12:0]controlS);
    //variable interna para la salida del decoder 
    reg [12:0] pseudocontrolS;
    //siempre que haya un cambio en la combinación de la dirección de inputs se actualiza la variable interna de salida usando un casez
    always @ (direccion)
        casex(direccion)
            // any
            7'bxxxx_xx0: pseudocontrolS <= 13'b1000000001000;
            // JC
            7'b0000_1x1: pseudocontrolS <= 13'b0100000001000;
            7'b0000_0x1: pseudocontrolS <= 13'b1000000001000;
            // JNC
            7'b0001_1x1: pseudocontrolS <= 13'b1000000001000;
            7'b0001_0x1: pseudocontrolS <= 13'b0100000001000;
            // CMPI
            7'b0010_xx1: pseudocontrolS <= 13'b0001001000010;
            // CMPM
            7'b0011_xx1: pseudocontrolS <= 13'b1001001100000;
            // LIT
            7'b0100_xx1: pseudocontrolS <= 13'b0011010000010;
            // IN
            7'b0101_xx1: pseudocontrolS <= 13'b0011010000100;
            // LD
            7'b0110_xx1: pseudocontrolS <= 13'b1011010100000;
            // ST
            7'b0111_xx1: pseudocontrolS <= 13'b1000000111000;
            // JZ
            7'b1000_x11: pseudocontrolS <= 13'b0100000001000;
            7'b1000_x01: pseudocontrolS <= 13'b1000000001000;
            // JNZ
            7'b1001_x11: pseudocontrolS <= 13'b1000000001000;
            7'b1001_x01: pseudocontrolS <= 13'b0100000001000;
            // ADDI
            7'b1010_xx1: pseudocontrolS <= 13'b0011011000010;
            // ADDM
            7'b1011_xx1: pseudocontrolS <= 13'b1011011100000;
            // JMP
            7'b1100_xx1: pseudocontrolS <= 13'b0100000001000;
            // OUT
            7'b1101_xx1: pseudocontrolS <= 13'b0000000001001;
            // NANDI
            7'b1110_xx1: pseudocontrolS <= 13'b0011100000010;
            // NANDM
            7'b1111_xx1: pseudocontrolS <= 13'b1011100100000;
            default: pseudocontrolS <= 13'b1111111111111;
        endcase
    //se asigna el valor de la variable interna de salida a la variable externa de salida controlS    
    assign controlS = pseudocontrolS;
endmodule

//Módulo de la RAM, con input de la dirección address_RAM, resultado de la concatenación de oprnd y program_byte 
//El data_bus es un inout ya que funciona como input cuando el write enable es 1 y el chip select es 1
//El data_bus es un output cuando el writeenable es 0 y el chip select es 1.
//chip select es csRAM y write enable es weRAM
module ram(input [11:0]address_RAM, inout [3:0]data_bus, input csRAM, weRAM);
    //Variable interna de bus de salida
    reg [3:0]data_out;
    //Memoria ram
    reg [3:0] mem[0:4095];
    //asignación de la variable externa de bus de salida dependiendo de la condición
    //si solo chip select está activado se actualiza con el valor de la variable interna
    //si write enable está activado la salida se pone en alta impedancia
    assign data_bus = (csRAM && !weRAM) ? data_out : 4'bz;
    //Con el bloque always se incluye en la lista de sensibilidad la dirección, el bus de datos, el chip select y el write enable
    always @ (address_RAM or data_bus or csRAM or weRAM) begin
        //Si chip select y write enable están en 1, entonces se le asigna al valor del data_bus, como input al address_RAM
        //Función write 
        if (csRAM && weRAM) begin 
            mem[address_RAM] = data_bus;
        end
        //Si el chip select está en 1 y write enable en 0, entonces se le asigna el valor de la dirección a la variable de salida de bus interna 
        //Función read
        if (csRAM && !weRAM) begin 
            data_out = mem[address_RAM];
        end
    end
endmodule

//Módulo uP completo
module uP(input clock, reset, input [3:0]pushbuttons, output wire phase, c_flag, z_flag, output wire [3:0]instr, output wire [3:0]oprnd, output wire [3:0]accu,
output wire [3:0]data_bus, output wire [3:0]FF_out, output wire [7:0]program_byte, output wire [11:0]PC, output wire [11:0]address_RAM);
    
    //Cables internos 
    //outputs de la tabla
    // Program counter/ Accu/ Flags c y z/ op de ALU/      RAM    / ALU   /inputs/ oprnd/ outputs / flags 
    wire incPC, loadPC, loadA, loadFlags, S2, S1, S0, csRAM, weRAM, oeALU, oeIN, oeOprnd, loadOut, C, Zero;
    //Salida de la ALU
    wire [3:0]ALUout;
    //concatenación del operando y el program_byte para formar el address_RAM
    assign address_RAM = {oprnd, program_byte};
    //ingreso de las variables respectivas al program counter cuya salida es PC
    upcounter PROGRAMCOUNTER(clock, reset, incPC, loadPC, address_RAM, PC);
    //ingreso del input de PC y salida de program_byte a la rom
    rom ROM(PC, program_byte);
    //ingreso de las variables respectivas al fetch, donde el fetch se habilita cuando el phase es 0 únicamente, debido a que su enable es ~phase
    FFD8 FETCH(clock, reset, ~phase, program_byte, instr, oprnd);
    //ingreso de variables al modulo fetch, con 1'b1 ingresado en el enable para que que siempre esté activo,  funcionando como un clock con doble período
    //ya que un ciclo de phase dura dos ciclos de reloj
    FFT PHASE(clock, reset, 1'b1, phase);
    //Ingreso de variables respectivas al a ram
    ram RAM(address_RAM, data_bus, csRAM, weRAM);
    //Ingreso de inputs concatenados y outputs concatenados del decode
    decode DECODE({instr, c_flag, z_flag, phase}, {incPC, loadPC, loadA, loadFlags, S2, S1, S0, csRAM, weRAM, oeALU, oeIN, oeOprnd, loadOut});
    //buffer triestado para el bus del operando proveniente de la salida del fetch, y cuya salida es el data_bus
    tribuf4 BUSOPRND(oeOprnd, oprnd, data_bus);
    //ALU del proyecto con la combinación de op S2, S1 y S0 concatenada y cuya salida es el cable ALUout
    alu ALU(accu, data_bus,  {S2, S1, S0}, C, Zero, ALUout);
    //módulo de acumulador con respectivos enables
    FFD4 ACCU(clock, reset, loadA, ALUout, accu);
    //buffer triestado para la salida de la alu, donde ALUout es un input y data_bus es la salida
    tribuf4 BUSALU(oeALU, ALUout, data_bus);
    //flip flop de 2 bits para las banderas de Carry y Zero, concatenadas para el input, y que tienen como output c_flag y z_flag concatenadas
    FFD2 FLAGS(clock, reset, loadFlags, {C, Zero}, {c_flag, z_flag});
    //flip flop de 4 bits para el módulo de outputs, teniendo como entrada el data_bus y salida el FF_out. 
    FFD4 OUTPUTS(clock, reset, loadOut, data_bus, FF_out);
    //buffer triestado para el bus del módulo inputs, con entrada de 4 bits de pushbuttons y 4 bits salida de data_bus.
    tribuf4 BUSIN(oeIN, pushbuttons, data_bus);

endmodule