//José Alejandro Rodríguez Porras 19131
//Electrónica Digital 1
//Laboratorio 9
//Ejercicio 4 testbench 
//Buffer Triestado de 4 bits
module testbench();
//Declaración de variables
    reg [3:0]in;
    reg enable;
    wire [3:0]out;
//Asignación de módulos
    tribuf4 tbuf4(enable, in, out);

//Prueba de funcionamiento del Buffer triestado
initial begin
    $display("in enable  | out");
    $display("-----------|--");
    $monitor("%b %b   | %b", in, enable, out);
    in = 4'b0000; enable = 0;
    //Prueba enable en 0
    #1 in = 4'b0000; enable = 0;
    #1 in = 4'b0010; enable = 0;
    //Prueba enable en 1
    #1 in = 4'b0010; enable = 1;
    #1 in = 4'b0111; enable = 1;
    //Prueba enable en 0
    #1 in = 4'b1111; enable = 0;
    //Prueba enable en 1
    #1 in = 4'b1111; enable = 1;
    #10 $finish;
end

    initial begin
        $dumpfile("E4_tb.vcd");
        $dumpvars(0,testbench);
    end
endmodule