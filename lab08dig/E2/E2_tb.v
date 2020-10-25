//José Alejandro Rodríguez Porras 19131
//Electrónica Digital 1
//Lab 8 Ejercicio 2 testbench
module testbench();
reg [11:0]direccion;
wire [7:0]data;

ROM rom(direccion, data);

initial begin
    $display("ROM");
    $display("direccion    | data");
    $monitor("%b | %b", direccion, data);
    //Simulación en la que se muestran cada una de las localidades de memoria (algunas con datos dentro de ellas y algunas sin datos guardados en ella)
       direccion = 12'd0;
    #1 direccion = 12'd1;
    #1 direccion = 12'd2;
    #1 direccion = 12'd3;
    #1 direccion = 12'd4;
    #1 direccion = 12'd5;
    #1 direccion = 12'd6;
    #1 direccion = 12'd7;
    #1 direccion = 12'd8;
    #1 direccion = 12'd9;
    #1 direccion = 12'd10;
    #1 direccion = 12'd11;
    #1 direccion = 12'd12;
    #1 direccion = 12'd13;
end
//final de la simulación
initial
    #20 $finish;
//Creación del vcd
initial begin 
    $dumpfile("E2_tb.vcd");
    $dumpvars(0, testbench);
end
endmodule

    