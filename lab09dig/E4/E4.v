//José Alejandro Rodríguez Porras 19131
//Electrónica Digital 1
//Laboratorio 9
//Ejercicio 4 
//Buffer Triestado de 4 bits 
module tribuf4(input wire enable, input wire [3:0]in, output wire [3:0]out);
    assign out = (enable) ? in:4'bz;
endmodule    