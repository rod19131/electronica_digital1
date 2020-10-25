//José Alejandro Rodríguez Porras 19131
//Electrónica Digital 1
//Lab 8 Ejercicio 2
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
