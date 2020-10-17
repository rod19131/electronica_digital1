//José Alejandro Rodríguez Porras 19131
//Electrónica Digital
//Proyecto FSM
//Caja de velocidades automática con modo carrera
//Módulo Flip Flop Tipo D con reset asíncrono de un bit
//José Alejandro Rodríguez Porras 19131
//Electrónica Digital
//Proyecto FSM
//Caja de velocidades automática optimizada con modo carrera
//Módulo Flip Flop Tipo D con reset asíncrono de dos bits
module dff2(input clk, rst, input [1:0]d, output reg [1:0]q);

    always @ (posedge clk or posedge rst)
        if (rst)
            q <= 2'b00; 
    else begin
            q <= d;
    end
endmodule
// Módulo Flip Flop Tipo D con reset asíncrono de cuatro bits
module dff4(input clk, rst, input [3:0]d, output reg [3:0]q);

    always @ (posedge clk or posedge rst)
        if (rst)
            q <= 4'b0000;
    else begin
            q <= d;
    end
endmodule

//FSM modo carrera
module MC(input wire clk, rst, SV, RF, TM, SC, E, input wire [1:0]SP, output wire D, A, output wire [1:0]S, output wire [1:0]SF);
    
    //Ecuaciones de estados futuros
    assign SF[1] = (~S[1] & ~S[0] & ~RF & SV & TM & E) | (~S[1] & ~S[0] & ~RF & SV & SC & E) | (S[1] & ~S[0] & SV & TM & ~SP[1] & E) | (S[1] & ~S[0] & SV & SC & ~SP[1] & E) | 
    (S[1] & ~S[0] & SV & TM & ~SP[0] & E) | (S[1] & ~S[0] & SV & SC & ~SP[0] & E);

    assign SF[0] = (~S[1] & S[0] & ~TM & ~SC & E) | (~S[1] & RF & ~SC & ~TM & ~SC & E) | (~S[1] & ~TM & ~SC & ~SP[1] & ~S[0] & E) | (~S[1] & ~TM & ~SC & SP[1] & ~SP[0] & E);
  
   
    dff2 FF2(clk, rst, SF, S);  
   //Ecuaciones de salidas
    assign D = (S[1] & ~S[0]);
    assign A = (~S[1] & S[0]);

endmodule
//FSM Principal, Caja de 6 Velocidades de cambio automático para vehículo (1a, 2a, 3a, 4a, 5a, 6a)
module C_Velocidad(input wire clk, rst, A, AM, D, DM, TD, T1, T2, T3, T4, T5, output wire [3:0]S, output wire [3:0]SF, output wire [2:0]VA, output wire [2:0]ET, output wire SV, ETD);
    
    //Ecuaciones de estados futuros
    assign SF[3] = (S[3] & ~S[2] & S[0]) | (S[3] & S[2] & ~S[1] & ~S[0]) | (S[3] & ~S[2] & S[1] & A) | (S[3] & ~S[2] & S[1] & AM) | (S[3] & ~S[2] & S[1] & ~D & ~DM) | 
    (~S[3] & S[2] & S[1] & S[0] & ~A & ~AM & D) | (~S[3] & S[2] & S[1] & S[0] & ~A & ~AM & DM) | (~S[3] & S[2] & S[1] & S[0] & A & ~D & ~DM) | (~S[3] & S[2] & S[1] & S[0] & AM & ~D & ~DM) | 
    (S[3] & ~S[1] & ~S[0] & A & ~D & ~DM) | (S[3] & ~S[1] & ~S[0] & AM & ~D & ~DM) | (S[3] & ~S[2] & ~A & ~AM & D & ~TD) | (S[3] & ~S[2] & ~A & ~AM & DM & ~TD);

    assign SF[2] = (~S[3] & S[2] & ~S[1] & S[0]) | (S[3] & ~S[2] & ~S[1] & ~S[0] & A & D) | (S[3] & ~S[2] & ~S[1] & ~S[0] & AM & D) | (~S[2] & S[1] & S[0] & ~A & ~AM & D) |
    (S[3] & ~S[2] & ~S[1] & ~S[0] & A & DM) | (S[3] & ~S[2] & ~S[1] & ~S[0] & AM & DM) | (~S[2] & S[1] & S[0] & ~A & ~AM & DM) | (~S[2] & S[1] & S[0] & A & ~D & ~DM) | 
    (~S[2] & S[1] & S[0] & AM & ~D & ~DM) | (S[2] & ~S[1] & ~S[0] & ~A & ~AM & D & ~TD) | (S[2] & ~S[1] & ~S[0] & ~A & ~AM & DM & ~TD) | (S[3] & ~S[2] & ~S[1] & ~S[0] & ~A & ~AM & ~D & ~DM) | 
    (~S[3] & S[2] & S[1] & A & D) | (~S[3] & S[2] & S[1] & AM & D) | (~S[3] & S[2] & S[1] & A & DM) | (~S[3] & S[2] & S[1] & AM & DM) | (~S[3] & S[2] & S[1] & ~S[0] & ~TD) | 
    (~S[3] & S[2] & ~S[0] & A & ~D & ~DM) | (~S[3] & S[2] & ~S[0] & AM & ~D & ~DM) | (~S[3] & S[2] & S[1] & ~A & ~AM & ~D & ~DM) | (S[3] & ~S[2] & ~S[0] & ~A & ~AM & D & TD) | 
    (S[3] & ~S[2] & ~S[0] & ~A & ~AM & DM & TD); 
  
    assign SF[1] = (~S[3] & S[1] & S[0] & A & D) | (~S[2] & S[1] & S[0] & A & D) | (S[3] & ~S[1] & ~S[0] & A & D) | (S[2] & ~S[1] & ~S[0] & A & D) | (~S[3] & S[1] & S[0] & AM & D) |
    (~S[2] & S[1] & S[0] & AM & D) | (S[3] & ~S[1] & ~S[0] & AM & D) | (S[2] & ~S[1] & ~S[0] & AM & D) | (~S[3] & S[1] & S[0] & A & DM) | (~S[2] & S[1] & S[0] & A & DM) |
    (S[3] & ~S[1] & ~S[0] & A & DM) | (S[2] & ~S[1] & ~S[0] & A & DM) | (~S[3] & S[1] & S[0] & AM & DM) | (~S[2] & S[1] & S[0] & AM & DM) | (S[3] & ~S[1] & ~S[0] & AM & DM) |
    (S[2] & ~S[1] & ~S[0] & AM & DM) | (~S[3] & ~S[1] & S[0] & ~A & ~AM & D) | (~S[2] & ~S[1] & S[0] & ~A & ~AM & D) | (~S[3] & ~S[1] & S[0] & ~A & ~AM & DM) | (~S[2] & ~S[1] & S[0] & ~A & ~AM & DM) |
    (~S[3] & ~S[1] & S[0] & A & ~D & ~DM) | (~S[2] & ~S[1] & S[0] & A & ~D & ~DM) | (~S[3] & S[1] & ~S[0] & A & ~D & ~DM) | (~S[2] & S[1] & ~S[0] & A & ~D & ~DM) | (~S[3] & ~S[1] & S[0] & AM & ~D & ~DM) |
    (~S[2] & ~S[1] & S[0] & AM & ~D & ~DM) | (~S[3] & S[1] & ~S[0] & AM & ~D & ~DM) | (~S[2] & S[1] & ~S[0] & AM & ~D & ~DM) | (~S[3] & S[2] & S[1] & ~S[0] & ~A & ~AM & D) |
    (S[3] & ~S[2] & S[1] & ~S[0] & ~A & ~AM & D) | (~S[3] & S[2] & S[1] & ~S[0] & ~A & ~AM & DM) | (S[3] & ~S[2] & S[1] & ~S[0] & ~A & ~AM & DM) | (~S[3] & S[1] & S[0] & ~A & ~AM & ~D & ~DM) |
    (~S[2] & S[1] & S[0] & ~A & ~AM & ~D & ~DM) | (S[3] & ~S[1] & ~S[0] & ~A & ~AM & ~D & ~DM) | (S[2] & ~S[1] & ~S[0] & ~A & ~AM & ~D & ~DM) | (S[3] & S[2] & ~S[1] & ~S[0] & ~D & ~DM) |
    (~S[2] & S[1] & ~S[0] & ~A & ~AM & D & ~TD) | (~S[2] & S[1] & ~S[0] & ~A & ~AM & DM & ~TD);
    
    assign SF[0] = (~S[3] & ~S[2] & ~S[1] & ~S[0] & A & ~D & ~DM) | (~S[3] & ~S[2] & ~S[1] & ~S[0] & AM & ~D & ~DM) | (~S[3] & S[2] & A & D) | (~S[2] & S[1] & A & D) | (~S[2] & S[0] & A & D) |
    (~S[3] & S[2] & AM & D) | (~S[2] & S[1] & AM & D) | (~S[2] & S[0] & AM & D) | (~S[3] & S[2] & A & DM) | (~S[2] & S[1] & A & DM) | (~S[2] & S[0] & A & DM) | (~S[3] & S[2] & AM & DM) | 
    (~S[2] & S[1] & AM & DM) | (~S[2] & S[0] & AM & DM) | (S[3] & ~S[1] & ~S[0] & A & D) | (S[3] & ~S[1] & ~S[0] & AM & D) | (S[3] & ~S[1] & ~S[0] & A & DM) | (S[3] & ~S[1] & ~S[0] & AM & DM) | 
    (S[3] & S[2] & ~S[1] & ~S[0] & ~D & ~DM) | (~S[3] & S[2] & ~A & ~AM & ~D & ~DM) | (S[3] & ~S[2] & ~A & ~AM & ~D & ~DM) | (~S[2] & S[1] & ~A & ~AM & ~D & ~DM) | (~S[2] & S[0] & ~A & ~AM & ~D & ~DM) | 
    (~S[3] & S[2] & ~S[0] & ~A & ~AM & TD) | (S[3] & ~S[2] & ~S[0] & ~A & ~AM & TD) | (S[2] & ~S[1] & ~S[0] & ~A & ~AM & TD) | (S[2] & ~S[1] & ~S[0] & ~D & ~DM & T2) | 
    (S[3] & ~S[1] & ~S[0] & ~D & ~DM & T4) | (~S[3] & ~S[2] & S[1] & ~S[0] & ~D & ~DM & T1) | (~S[3] & S[2] & S[1] & ~S[0] & ~D & ~DM & T3) | (S[3] & ~S[2] & S[1] & ~S[0] & ~D & ~DM & T5);


    dff4 FF4(clk, rst, SF, S);

    //Ecuaciones de salidas
    assign VA[2] = (S[3] & ~S[2]) | (S[3] & ~S[1] & ~S[0]) | (~S[3] & S[2] & S[1] & S[0]);
    assign VA[1] = (~S[3] & S[2] & ~S[1]) | (~S[2] & S[1] & S[0]) | (~S[3] & S[2] & ~S[0]) | (S[2] & ~S[1] & ~S[0]);
    assign VA[0] = (~S[3] & ~S[1] & S[0]) | (~S[2] & ~S[1] & S[0]) | (~S[3] & S[1] & ~S[0]) | (~S[2] & S[1] & ~S[0]);
    assign SV = (S[3] & ~S[2]) | (S[3] & ~S[1] & ~S[0]) | (~S[3] & S[2] & S[1] & S[0]);
    assign ETD = (~S[3] & S[2] & ~S[0]) | (~S[2] & S[1] & ~S[0]) | (S[3] & ~S[1] & ~S[0]);
    assign ET[2] = (S[3] & ~S[2] & ~S[0]) | (S[3] & ~S[1] & ~S[0]);
    assign ET[1] = (~S[3] & S[2] & ~S[0]);
    assign ET[0] = (~S[3] & S[1] & ~S[0]) | (~S[2] & S[1] & ~S[0]) | (S[3] & S[2] & ~S[1] & ~S[0]);

endmodule

//Módulo del decoder para el seleccionador de timers usando case
module decoder(input wire [2:0]ET, input enabledec, output reg [5:0]decoder_out); 

always @ (enabledec or ET)
begin
  decoder_out = 0;
  if (enabledec) begin
    case (ET)
      3'b000 : decoder_out <= 6'b000000;
      3'b001 : decoder_out <= 6'b000001;
      3'b010 : decoder_out <= 6'b000010;
      3'b011 : decoder_out <= 6'b000100;
      3'b100 : decoder_out <= 6'b001000;
      3'b101 : decoder_out <= 6'b010000;
    endcase
  end
end

endmodule

//Módulo de Seleccionador de timers 
module Seleccionador(input wire [2:0]ET, input wire EnD, output wire TimerLED1, output wire TimerLED2, output wire TimerLED3, output wire TimerLED4, output wire TimerLED5, output [5:0]dec);
    decoder DE(ET, EnD, dec);
    assign TimerLED1 = dec[0];
    assign TimerLED2 = dec[1];
    assign TimerLED3 = dec[2];
    assign TimerLED4 = dec[3];
    assign TimerLED5 = dec[4];
endmodule

//Módulo del timer para desacelerar
module Timer_desacelerar(input wire ETD, output reg TD);
    always @ (ETD) begin
        if (ETD == 0) begin
            TD = 0;
        end 
        while(ETD) begin
            #30 TD = 1;
            #10 TD = 0;    
        end
    end
endmodule

//Módulo del Timer 1 de aceleración en la 1a. velocidad con respectivo velocímetro 1
module Timer_a1(input wire TimerLED1, output reg T1, output reg [2:0]Vlm1);
    always @ (TimerLED1) begin
        if (TimerLED1 == 0) begin
            Vlm1 = 3'b000;
            T1 = 0;
        end 
        while(TimerLED1) begin   
            #10 Vlm1 = 3'b001;
            #10 Vlm1 = 3'b010;
            #10 Vlm1 = 3'b011; ; T1 = 1;
            #11 T1 = 0; Vlm1 = 3'b000;  
        end
    end
endmodule

//Módulo del Timer 2 de aceleración en la 2a. velocidad con respectivo velocímetro 2
module Timer_a2(input wire TimerLED2, output reg T2, output reg [2:0]Vlm2);
    always @ (TimerLED2) begin
        if (TimerLED2 == 0) begin
            Vlm2 = 3'b000;
            T2 = 0;
        end 
        while(TimerLED2) begin
            #10 Vlm2 = 3'b001;
            #10 Vlm2 = 3'b010;
            #10 Vlm2 = 3'b011;
            #10 Vlm2 = 3'b100; ; T2 = 1;
            #11 T2 = 0; Vlm2 = 3'b000;
        end
    end
endmodule

//Módulo del Timer 3 de aceleración en la 3a. velocidad con respectivo velocímetro 3
module Timer_a3(input wire TimerLED3, output reg T3, output reg [2:0]Vlm3);
    always @ (TimerLED3) begin
        if (TimerLED3 == 0) begin
            Vlm3 = 3'b000;
            T3 = 0;
        end 
        while(TimerLED3) begin
            #10 Vlm3 = 3'b001;
            #10 Vlm3 = 3'b010;
            #10 Vlm3 = 3'b011;
            #10 Vlm3 = 3'b100;
            #10 Vlm3 = 3'b101; ; T3 = 1;
            #11 T3 = 0; Vlm3 = 3'b000;  
        end
    end
endmodule
//Módulo del Timer 4 de aceleración en la 4a. velocidad con respectivo velocímetro 4
module Timer_a4(input wire TimerLED4, output reg T4, output reg [2:0]Vlm4);
    always @ (TimerLED4) begin
        if (TimerLED4 == 0) begin
                Vlm4 = 3'b000;
                T4 = 0;
        end 
        while(TimerLED4) begin
            #11 Vlm4 = 3'b001;
            #10 Vlm4 = 3'b010;
            #10 Vlm4 = 3'b011;
            #10 Vlm4 = 3'b100;
            #10 Vlm4 = 3'b101;
            #10 Vlm4 = 3'b110; ; T4 = 1;
            #11 T4 = 0; Vlm4 = 3'b000;  
        end
    end
endmodule
//Módulo del Timer 5 de aceleración con respectivo velocímetro 5 en la 5a. velocidad y en la 6a. velocidad
module Timer_a5(input wire TimerLED5, input wire [2:0]VA , output reg T5, output reg [3:0]Vlm5);
    always @ (TimerLED5) begin
        if (TimerLED5 == 0) begin
            Vlm5 = 4'b0000;
            T5 = 0;
        end 
        //Velocímetro 5 en 5a. velocidad
        while(TimerLED5 == 1 & VA == 3'b101) begin
            #11 Vlm5 = 4'b0001;
            #10 Vlm5 = 4'b0010;
            #10 Vlm5 = 4'b0011;
            #10 Vlm5 = 4'b0100;
            #10 Vlm5 = 4'b0101;
            #10 Vlm5 = 4'b0110;
            #10 Vlm5 = 4'b0111; ; T5 = 1;
            #10 T5 = 0; Vlm5 = 4'b0000;  
        end
        //Velocímetro 5 en 6a. velocidad
        while (TimerLED5 == 1 & VA == 3'b110) begin
            #10  Vlm5 = 4'b0001; T5 = 1; 
            #10 Vlm5 = 4'b0000; T5 = 0; 
        end
    end
endmodule