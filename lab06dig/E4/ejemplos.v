//José Alejandro Rodríguez Porras 19131
//Electrónica Digital
//Ejercicio 4 Ejemplos
//nonblocking assignment
//sequential module
always_ff @(posedge clk)
begin
    //ambas líneas se ejecutan a la vez
    n1 <= d;//nonblocking assignment
    q <= n1;//nonblockiing assignment
end
//blocking assignment en lógica secuencial
assign y = s ? d1 : d0;//blocking assignment
always_comb
    begin
        p = a^b;//blocking assignment (se ejecuta primero)
        g = a & b;//blocking assignment (se ejecuta después de la línea anterior)
        s = p ^cin;
        cout = g | (p & cin);
    end
